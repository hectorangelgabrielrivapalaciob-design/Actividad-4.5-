<?php
session_start();
require_once 'conexion.php';

// Validar que el usuario tenga permiso (Admin o Recepción)
if (!isset($_SESSION['usuario']) || !isset($_SESSION['2fa_verificado'])) {
    header("Location: login.php");
    exit();
}

$rol_usuario = $_SESSION['rol'];
if ($rol_usuario !== 'Administrador Global' && $rol_usuario !== 'Recepcion') {
    echo "<script>alert('No tienes permisos para gestionar citas.'); window.location.href='dashboard.php';</script>";
    exit();
}

$mensaje = "";
$status = "";

// 1. PROCESAR EL REGISTRO DE LA CITA CON EL ESTADO CLÍNICO DEL PACIENTE
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['registrar_cita'])) {
    $id_paciente = $_POST['id_paciente'];
    $id_doctor = $_POST['id_doctor'];
    $fecha_cita = $_POST['fecha_cita'];
    $motivo = trim($_POST['motivo_detallado']);
    $estado_clinico = $_POST['estado_clinico']; // NUEVO: Estable, Urgencias, etc.
    $estado_cita = "Programada";

    if (!empty($id_paciente) && !empty($id_doctor) && !empty($fecha_cita) && !empty($motivo) && !empty($estado_clinico)) {
        // Asegúrate de que tu tabla 'citas' tenga la columna 'estado_clinico' (VARCHAR) o se guardará en tu bitácora
        $stmt = $conn->prepare("INSERT INTO citas (id_paciente, id_doctor, fecha_cita_inicio, motivo_detallado, estado_clinico, estado) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iissss", $id_paciente, $id_doctor, $fecha_cita, $motivo, $estado_clinico, $estado_cita);
        
        if ($stmt->execute()) {
            $mensaje = "Cita médica y estado clínico registrados correctamente de forma segura.";
            $status = "success";
        } else {
            // Si aún no agregas la columna a la BD, te avisará aquí. 
            // NOTA: Si te da error, ejecuta en phpMyAdmin: ALTER TABLE citas ADD estado_clinico VARCHAR(50) NOT NULL;
            $mensaje = "Error al registrar la cita: " . $conn->error;
            $status = "danger";
        }
        $stmt->close();
    } else {
        $mensaje = "Por favor, complete todos los campos requeridos.";
        $status = "warning";
    }
}

// 2. OBTENER DATOS PARA LOS SELECTS
$pacientes = $conn->query("SELECT id_paciente, nombre, apellidos FROM pacientes ORDER BY nombre ASC");
$doctores = $conn->query("SELECT id_doctor, nombre, apellidos, especialidad FROM doctores ORDER BY nombre ASC");

// 3. CONSULTAR LAS CITAS EXISTENTES INCLUYENDO EL ESTADO CLÍNICO
$query_citas = "SELECT c.id_cita, c.fecha_cita_inicio, c.motivo_detallado, c.estado_clinico, c.estado, 
                       p.nombre as p_nom, p.apellidos as p_ape, 
                       d.nombre as d_nom, d.apellidos as d_ape, d.especialidad
                FROM citas c
                JOIN pacientes p ON c.id_paciente = p.id_paciente
                JOIN doctores d ON c.id_doctor = d.id_doctor
                ORDER BY c.fecha_cita_inicio DESC";
$res_citas = $conn->query($query_citas);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Gestión de Citas</title>
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

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4 shadow-sm">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="dashboard.php">
        <i class="bi bi-arrow-left-circle me-2 fs-4 text-info"></i> VOLVER AL PANEL
    </a>
    <div class="ms-auto text-white">
        <span class="badge bg-light text-dark py-2 px-3"><i class="bi bi-shield-lock-fill text-primary"></i> Triage y Citas</span>
    </div>
</nav>

<div class="container py-4">
    <h2 class="fw-bold text-dark mb-4"><i class="bi bi-heart-pulse text-danger"></i> Recepción, Triage y Asignación de Citas</h2>

    <?php if (!empty($mensaje)): ?>
        <div class="alert alert-<?php echo $status; ?> alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle-fill me-2"></i> <?php echo $mensaje; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <div class="row g-4">
        <!-- FORMULARIO DE REGISTRO INTERACTIVO -->
        <div class="col-12 col-lg-4">
            <div class="card card-custom bg-white p-4">
                <h5 class="fw-bold text-secondary mb-3"><i class="bi bi-pencil-square"></i> Ingreso de Paciente</h5>
                <form action="citas.php" method="POST">
                    
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Paciente</label>
                        <select name="id_paciente" class="form-select" required>
                            <option value="">-- Seleccione el Paciente --</option>
                            <?php while($p = $pacientes->fetch_assoc()): ?>
                                <option value="<?php echo $p['id_paciente']; ?>"><?php echo $p['nombre'] . " " . $p['apellidos']; ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Médico Asignado</label>
                        <select name="id_doctor" class="form-select" required>
                            <option value="">-- Seleccione el Doctor --</option>
                            <?php while($d = $doctores->fetch_assoc()): ?>
                                <option value="<?php echo $d['id_doctor']; ?>">Dr(a). <?php echo $d['nombre'] . " (" . $d['especialidad'] . ")"; ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Fecha y Hora de Ingreso</label>
                        <input type="datetime-local" name="fecha_cita" class="form-control" required>
                    </div>

                    <!-- NUEVO CAMPO: DIAGNÓSTICO DE TRIAGE / ESTADO DEL PACIENTE -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold text-muted">Estado Clínico Inicial</label>
                        <select name="estado_clinico" class="form-select" required>
                            <option value="">-- Seleccione el Estado --</option>
                            <option value="Estable">Estable</option>
                            <option value="En Recuperación">En Recuperación</option>
                            <option value="En Observación">En Observación</option>
                            <option value="Urgencias">Urgencias (Crítico)</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold text-muted">Síntomas / Motivo Clínico</label>
                        <textarea name="motivo_detallado" class="form-control" rows="3" placeholder="Descripción extendida de la situación del paciente..." required></textarea>
                    </div>

                    <button type="submit" name="registrar_cita" class="btn btn-custom w-100 fw-bold shadow-sm py-2">
                        Registrar Ingreso <i class="bi bi-check-circle"></i>
                    </button>
                </form>
            </div>
        </div>

        <!-- TABLA DE CONTROL CON MAPA DE COLORES POR ESTADO CLÍNICO -->
        <div class="col-12 col-lg-8">
            <div class="card card-custom bg-white p-4">
                <h5 class="fw-bold text-secondary mb-3"><i class="bi bi-activity"></i> Monitor en Tiempo Real de Pacientes</h5>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Paciente</th>
                                <th>Médico Asignado</th>
                                <th>Fecha / Hora</th>
                                <th>Estado Clínico</th>
                                <th>Seguimiento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($res_citas->num_rows > 0): ?>
                                <?php while($c = $res_citas->fetch_assoc()): ?>
                                    <tr>
                                        <td><strong><?php echo $c['p_nom'] . " " . $c['p_ape']; ?></strong></td>
                                        <td><small>Dr(a). <?php echo $c['d_nom']; ?></small></td>
                                        <td><span class="small text-muted"><?php echo date('d/m H:i', strtotime($c['fecha_cita_inicio'])); ?></span></td>
                                        
                                        <!-- ASIGNACIÓN DINÁMICA DE COLORES SEGÚN EL ESTADO CLÍNICO -->
                                        <td>
                                            <?php 
                                            $badge_class = "bg-success"; // Estable por defecto
                                            if($c['estado_clinico'] === 'Urgencias') $badge_class = "bg-danger text-white";
                                            elseif($c['estado_clinico'] === 'En Observación') $badge_class = "bg-warning text-dark";
                                            elseif($c['estado_clinico'] === 'En Recuperación') $badge_class = "bg-info text-dark";
                                            ?>
                                            <span class="badge <?php echo $badge_class; ?> px-2.5 py-1.5 shadow-sm text-uppercase small" style="font-size: 0.75rem;">
                                                <i class="bi bi-heart-pulse-fill"></i> <?php echo htmlspecialchars($c['estado_clinico'] ?? 'Estable'); ?>
                                            </span>
                                        </td>
                                        
                                        <td>
                                            <div class="small text-truncate text-muted" style="max-width: 150px;" title="<?php echo htmlspecialchars($c['motivo_detallado']); ?>">
                                                <?php echo htmlspecialchars($c['motivo_detallado']); ?>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-3">No hay registros de pacientes ingresados hoy.</td>
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