<?php
session_start();
require_once 'conexion.php';

// Validar inicio de sesión y rol (Admin o Recepción)
if (!isset($_SESSION['usuario']) || !isset($_SESSION['2fa_verificado'])) {
    header("Location: login.php");
    exit();
}

$rol_usuario = $_SESSION['rol'];
if ($rol_usuario !== 'Administrador Global' && $rol_usuario !== 'Recepcion') {
    echo "<script>alert('No tienes permisos para gestionar habitaciones.'); window.location.href='dashboard.php';</script>";
    exit();
}

$mensaje = "";
$status = "";

// 1. PROCESAR CAMBIO DE ESTADO (Asignar u Ocupar Cama)
if (isset($_GET['accion']) && isset($_GET['id'])) {
    $id_habitacion = intval($_GET['id']);
    $nueva_accion = $_GET['accion'];
    
    $nuevo_estado = ($nueva_accion === 'ocupar') ? 'Ocupada' : 'Disponible';
    
    $stmt = $conn->prepare("UPDATE habitaciones SET estado = ? WHERE id_habitacion = ?");
    $stmt->bind_param("si", $nuevo_estado, $id_habitacion);
    
    if ($stmt->execute()) {
        $mensaje = "El estado de la habitación #" . $id_habitacion . " se actualizó a " . $nuevo_estado . ".";
        $status = "success";
    } else {
        $mensaje = "Error al actualizar la habitación: " . $conn->error;
        $status = "danger";
    }
    $stmt->close();
}

// 2. CONSULTAR TODAS LAS HABITACIONES ORDENADAS POR ID
$res_habitaciones = $conn->query("SELECT * FROM habitaciones ORDER BY id_habitacion ASC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Habitaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #0A4D68;
            --secondary-color: #05BFDB;
            --bg-light: #F4F7F6;
        }
        body {
            background-color: var(--bg-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar-custom {
            background-color: var(--primary-color);
        }
        .card-habitacion {
            border: none;
            border-radius: 12px;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .card-habitacion:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .border-disponible { border-top: 6px solid #28a745; }
        .border-ocupada { border-top: 6px solid #dc3545; }
    </style>
</head>
<body>

<!-- BARRA SUPERIOR -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4 shadow-sm">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="dashboard.php">
        <i class="bi bi-arrow-left-circle me-2 fs-4 text-info"></i> VOLVER AL PANEL
    </a>
    <div class="ms-auto text-white">
        <span class="badge bg-light text-dark py-2 px-3"><i class="bi bi-door-closed-fill text-primary"></i> Admisión y Camas</span>
    </div>
</nav>

<div class="container py-4">
    <h2 class="fw-bold text-dark mb-2"><i class="bi bi-grid-3x3-gap-fill text-info"></i> Monitoreo de Camas Hospitalarias</h2>
    <p class="text-muted mb-4">Administración visual y cambio de disponibilidad de habitaciones para hospitalización o urgencias.</p>

    <?php if (!empty($mensaje)): ?>
        <div class="alert alert-<?php echo $status; ?> alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle-fill me-2"></i> <?php echo $mensaje; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <!-- TABLERO VISUAL DE HABITACIONES -->
    <div class="row g-4">
        <?php if ($res_habitaciones && $res_habitaciones->num_rows > 0): ?>
            <?php while($h = $res_habitaciones->fetch_assoc()): 
                $es_disponible = ($h['estado'] === 'Disponible');
                $clase_borde = $es_disponible ? 'border-disponible' : 'border-ocupada';
                $badge_color = $es_disponible ? 'bg-success' : 'bg-danger';
            ?>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="card card-habitacion bg-white p-3 <?php echo $clase_borde; ?>">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-bold text-dark mb-0">Cama <?php echo htmlspecialchars($h['id_habitacion']); ?></h5>
                            <span class="badge <?php echo $badge_color; ?>"><?php echo htmlspecialchars($h['estado']); ?></span>
                        </div>
                        <p class="text-muted small mb-3">
                            <i class="bi bi-info-circle"></i> Tipo: <?php echo htmlspecialchars($h['tipo'] ?? 'General'); ?>
                        </p>
                        
                        <!-- BOTÓN INTERACTIVO DE CAMBIO RÁPIDO -->
                        <?php if($es_disponible): ?>
                            <a href="habitaciones.php?accion=ocupar&id=<?php echo $h['id_habitacion']; ?>" class="btn btn-outline-danger btn-sm w-100 fw-semibold">
                                <i class="bi bi-person-plus"></i> Asignar Paciente
                            </a>
                        <?php else: ?>
                            <a href="habitaciones.php?accion=liberar&id=<?php echo $h['id_habitacion']; ?>" class="btn btn-outline-success btn-sm w-100 fw-semibold">
                                <i class="bi bi-box-arrow-left"></i> Dar de Alta / Liberar
                            </a>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <div class="col-12 text-center text-muted py-5">
                <i class="bi bi-exclamation-triangle fs-1"></i>
                <p class="mt-2">No se encontraron habitaciones dadas de alta en la base de datos.</p>
            </div>
        <?php endif; ?>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>