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
    echo "<script>alert('No tienes permisos para gestionar pacientes.'); window.location.href='dashboard.php';</script>";
    exit();
}

$mensaje = "";
$status = "";

// 1. PROCESAR EL REGISTRO DE UN NUEVO PACIENTE
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['registrar_paciente'])) {
    $nombre = trim($_POST['nombre']);
    $apellidos = trim($_POST['apellidos']);
    $telefono = trim($_POST['telefono']);
    $fecha_nacimiento = $_POST['fecha_nacimiento'];
    $historial_alergias = trim($_POST['historial_alergias']);

    if (!empty($nombre) && !empty($apellidos) && !empty($fecha_nacimiento)) {
        $stmt = $conn->prepare("INSERT INTO pacientes (nombre, apellidos, telefono, fecha_nacimiento, historial_alergias) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $nombre, $apellidos, $telefono, $fecha_nacimiento, $historial_alergias);
        
        if ($stmt->execute()) {
            $mensaje = "Paciente registrado exitosamente en el sistema.";
            $status = "success";
        } else {
            $mensaje = "Error al registrar el paciente: " . $conn->error;
            $status = "danger";
        }
        $stmt->close();
    } else {
        $mensaje = "Por favor, llene los campos obligatorios (Nombre, Apellidos y Fecha de Nacimiento).";
        $status = "warning";
    }
}

// 2. CONSULTAR LOS PACIENTES EXISTENTES
$res_pacientes = $conn->query("SELECT * FROM pacientes ORDER BY id_paciente DESC");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Registro de Pacientes</title>
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
        .card-custom {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .btn-custom {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-custom:hover {
            background-color: var(--secondary-color);
            color: white;
        }
    </style>
</head>
<body>

<!-- BARRA SUPERIOR -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4 shadow-sm">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="dashboard.php">
        <i class="bi bi-arrow-left-circle me-2 fs-4 text-info"></i> VOLVER AL PANEL
    </a>
    <div class="ms-auto text-white">
        <span class="badge bg-light text-dark py-2 px-3"><i class="bi bi-people-fill text-primary"></i> Expedientes</span>
    </div>
</nav>

<div class="container py-4">
    <h2 class="fw-bold text-dark mb-4"><i class="bi bi-person-plus-fill text-primary"></i> Control de Expedientes de Pacientes</h2>

    <?php if (!empty($mensaje)): ?>
        <div class="alert alert-<?php echo $status; ?> alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle-fill me-2"></i> <?php echo $mensaje; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <div class="row g-4">
        <!-- FORMULARIO DE REGISTRO DE PACIENTE -->
        <div class="col-12 col-lg-4">
            <div class="card card-custom bg-white p-4">
                <h5 class="fw-bold text-secondary mb-3"><i class="bi bi-file-earmark-person"></i> Nuevo Expediente</h5>
                <form action="pacientes.php" method="POST">
                    
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Nombre(s) *</label>
                        <input type="text" name="nombre" class="form-control" required placeholder="Ej. Juan">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Apellidos *</label>
                        <input type="text" name="apellidos" class="form-control" required placeholder="Ej. Pérez Gómez">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Teléfono de Contacto</label>
                        <input type="text" name="telefono" class="form-control" placeholder="Ej. 5512345678">
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Fecha de Nacimiento *</label>
                        <input type="date" name="fecha_nacimiento" class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold text-muted">Alergias u Observaciones Clínicas</label>
                        <textarea name="historial_alergias" class="form-control" rows="3" placeholder="Ej. Alérgico a la penicilina, hipertenso..."></textarea>
                    </div>

                    <button type="submit" name="registrar_paciente" class="btn btn-custom w-100 fw-bold shadow-sm py-2">
                        Registrar Paciente <i class="bi bi-person-check"></i>
                    </button>
                </form>
            </div>
        </div>

        <!-- TABLA DE CONTROL DE EXPEDIENTES -->
        <div class="col-12 col-lg-8">
            <div class="card card-custom bg-white p-4">
                <h5 class="fw-bold text-secondary mb-3"><i class="bi bi-folder2-open"></i> Base de Datos de Pacientes Activos</h5>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Nombre Completo</th>
                                <th>Fecha Nac.</th>
                                <th>Teléfono</th>
                                <th>Alergias / Notas</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($res_pacientes->num_rows > 0): ?>
                                <?php while($p = $res_pacientes->fetch_assoc()): ?>
                                    <tr>
                                        <td><span class="badge bg-light text-dark">#<?php echo $p['id_paciente']; ?></span></td>
                                        <td><strong><?php echo htmlspecialchars($p['nombre'] . " " . $p['apellidos']); ?></strong></td>
                                        <td><small class="text-muted"><?php echo date('d/m/Y', strtotime($p['fecha_nacimiento'])); ?></small></td>
                                        <td><span class="small"><?php echo htmlspecialchars($p['telefono'] ?: 'N/A'); ?></span></td>
                                        <td>
                                            <div class="small text-danger" style="max-width: 200px;" title="<?php echo htmlspecialchars($p['historial_alergias']); ?>">
                                                <?php echo htmlspecialchars($p['historial_alergias'] ?: 'Ninguna registrada'); ?>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-3">No hay pacientes registrados en el sistema.</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>