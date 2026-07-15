<?php
session_start();
require_once 'conexion.php';

// Validar que el usuario haya pasado el login y el 2FA
if (!isset($_SESSION['usuario']) || !isset($_SESSION['2fa_verificado'])) {
    header("Location: login.php");
    exit();
}

$rol_usuario = $_SESSION['rol'];
$nombre_usuario = $_SESSION['usuario'];

// Obtener estadísticas dinámicas de la base de datos
$cant_pacientes = $conn->query("SELECT COUNT(*) as total FROM pacientes")->fetch_assoc()['total'];
$cant_citas = $conn->query("SELECT COUNT(*) as total FROM citas")->fetch_assoc()['total'];
$cant_doctores = $conn->query("SELECT COUNT(*) as total FROM doctores")->fetch_assoc()['total'];
$cant_habitaciones = $conn->query("SELECT COUNT(*) as total FROM habitaciones WHERE estado='Disponible'")->fetch_assoc()['total'];

// Consultar citas médicas detalladas incluyendo el estado clínico
$query_citas = "SELECT c.id_cita, c.fecha_cita_inicio, c.motivo_detallado, c.estado, c.estado_clinico,
                       p.nombre as p_nom, p.apellidos as p_ape, 
                       d.nombre as d_nom, d.apellidos as d_ape, d.especialidad
                FROM citas c
                JOIN pacientes p ON c.id_paciente = p.id_paciente
                JOIN doctores d ON c.id_doctor = d.id_doctor
                ORDER BY c.fecha_cita_inicio ASC";
$res_citas = $conn->query($query_citas);

// Convertir citas a formato JSON para el calendario visual con colores por urgencia
$eventos_calendario = [];
while($c = $res_citas->fetch_assoc()) {
    // Definir color del evento en el calendario según su estado clínico
    $color_evento = '#0A4D68'; // Azul estándar
    if(($c['estado_clinico'] ?? '') === 'Urgencias') {
        $color_evento = '#dc3545'; // Rojo crítico
    } elseif(($c['estado_clinico'] ?? '') === 'En Observación') {
        $color_evento = '#ffc107'; // Amarillo advertencia
    } elseif(($c['estado_clinico'] ?? '') === 'En Recuperación') {
        $color_evento = '#0dcaf0'; // Celeste recuperación
    }

    $eventos_calendario[] = [
        'id' => $c['id_cita'],
        'title' => "Pac: " . $c['p_nom'] . " " . $c['p_ape'],
        'start' => $c['fecha_cita_inicio'],
        'description' => $c['motivo_detallado'],
        'color' => $color_evento
    ];
}
$json_eventos = json_encode($eventos_calendario);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Panel de Control</title>
    <!-- Bootstrap 5 y Iconos -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <!-- FullCalendar 6 -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">
    
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
        .sidebar {
            background-color: white;
            min-height: calc(100vh - 56px);
            box-shadow: 2px 0 15px rgba(0,0,0,0.05);
        }
        .nav-link-custom {
            color: #495057;
            font-weight: 500;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            border-radius: 8px;
            margin: 4px 10px;
            transition: all 0.2s;
            text-decoration: none;
        }
        .nav-link-custom:hover, .nav-link-custom.active {
            background-color: rgba(5, 191, 219, 0.1);
            color: var(--primary-color);
        }
        .nav-link-custom i {
            margin-right: 12px;
            font-size: 1.2rem;
        }
        .card-stat {
            border: none;
            border-radius: 12px;
            color: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .bg-gradient-riva {
            background: linear-gradient(135deg, var(--primary-color) 0%, #088395 100%);
        }
        .bg-gradient-accent {
            background: linear-gradient(135deg, var(--secondary-color) 0%, #00F2FE 100%);
        }
        #calendar {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .cita-card {
            border-left: 5px solid var(--secondary-color);
        }
        .cita-urgente {
            border-left: 5px solid #dc3545 !important;
        }
    </style>
</head>
<body>

<!-- BARRA DE NAVEGACIÓN SUPERIOR -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4 shadow-sm">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="dashboard.php">
        <i class="bi bi-heart-pulse-fill me-2 fs-3 text-info"></i> HOSPITAL RIVA PALACIO
    </a>
    <div class="ms-auto d-flex align-items-center text-white">
        <span class="badge bg-light text-dark me-3 py-2 px-3"><i class="bi bi-person-badge-fill text-primary"></i> <?php echo $rol_usuario; ?></span>
        <span class="me-3">Bienvenido, <strong><?php echo $nombre_usuario; ?></strong></span>
        <a href="logout.php" class="btn btn-outline-light btn-sm"><i class="bi bi-box-arrow-right"></i> Salir</a>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- MENÚ LATERAL IZQUIERDO CON ENLACES TOTALMENTE FUNCIONALES -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar col-12 p-0 pt-3">
            <div class="position-sticky">
                <a class="nav-link-custom active" href="dashboard.php">
                    <i class="bi bi-house-door"></i> Inicio / Agenda
                </a>
                
                <?php if ($rol_usuario === 'Administrador Global' || $rol_usuario === 'Recepcion'): ?>
                <a class="nav-link-custom" href="citas.php">
                    <i class="bi bi-calendar-plus"></i> Control de Citas
                </a>
                <a class="nav-link-custom" href="pacientes.php">
                    <i class="bi bi-people"></i> Control de Pacientes
                </a>
                <a class="nav-link-custom" href="habitaciones.php">
                    <i class="bi bi-door-closed"></i> Habitaciones
                </a>
                <?php endif; ?>
                
                <?php if ($rol_usuario === 'Administrador Global' || $rol_usuario === 'Personal Medico'): ?>
                <a class="nav-link-custom" href="recetas.php">
                    <i class="bi bi-file-earmark-medical"></i> Expedición de Recetas
                </a>
                <?php endif; ?>
            </div>
        </nav>

        <!-- CONTENIDO CENTRAL DEL DASHBOARD -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 fw-bold text-dark">Panel Integral de Gestión Hospitalaria</h1>
            </div>

            <!-- TARJETAS DE INDICADORES EN TIEMPO REAL -->
            <div class="row g-3 mb-4">
                <div class="col-6 col-lg-3"><div class="card card-stat bg-gradient-riva p-3"><h6 class="text-white-50">Citas Totales</h6><h2 class="fw-bold mb-0"><?php echo $cant_citas; ?></h2></div></div>
                <div class="col-6 col-lg-3"><div class="card card-stat bg-gradient-accent p-3"><h6 class="text-dark-50 text-dark">Pacientes Activos</h6><h2 class="fw-bold mb-0 text-dark"><?php echo $cant_pacientes; ?></h2></div></div>
                <div class="col-6 col-lg-3"><div class="card card-stat bg-gradient-riva p-3"><h6 class="text-white-50">Cuerpo Médico</h6><h2 class="fw-bold mb-0"><?php echo $cant_doctores; ?></h2></div></div>
                <div class="col-6 col-lg-3"><div class="card card-stat bg-gradient-accent p-3"><h6 class="text-dark-50 text-dark">Camas Libres</h6><h2 class="fw-bold mb-0 text-dark"><?php echo $cant_habitaciones; ?></h2></div></div>
            </div>

            <!-- SECCIÓN DEL CALENDARIO Y DETALLES MÈDICOS -->
            <div class="row g-4">
                <!-- CALENDARIO VISUAL -->
                <div class="col-12 col-xl-7">
                    <h5 class="fw-bold mb-3 text-secondary"><i class="bi bi-calendar3"></i> Agenda Médica Visual</h5>
                    <div id="calendar"></div>
                </div>
                
                <!-- MONITOR DE SÍNTOMAS Y ESTADOS CLÍNICOS (TRIAGE) -->
                <div class="col-12 col-xl-5">
                    <h5 class="fw-bold mb-3 text-secondary"><i class="bi bi-activity"></i> Detalles y Triage de Pacientes</h5>
                    <div class="overflow-y-auto" style="max-height: 560px;">
                        <?php 
                        $res_citas->data_seek(0);
                        if ($res_citas->num_rows > 0): 
                            while($c = $res_citas->fetch_assoc()):
                                $clase_borde = "cita-card";
                                if(($c['estado_clinico'] ?? '') === 'Urgencias') $clase_borde = "cita-urgente";
                        ?>
                            <div class="card mb-3 shadow-sm <?php echo $clase_borde; ?> bg-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="fw-bold text-primary mb-0"><?php echo htmlspecialchars($c['p_nom'] . " " . $c['p_ape']); ?></h6>
                                        <span class="badge <?php echo (($c['estado_clinico'] ?? '') === 'Urgencias') ? 'bg-danger' : 'bg-light text-dark'; ?> small">
                                            <?php echo htmlspecialchars($c['estado_clinico'] ?? 'Estable'); ?>
                                        </span>
                                    </div>
                                    <p class="text-muted small mb-2">Dr(a). <?php echo htmlspecialchars($c['d_nom'] . " (" . $c['especialidad'] . ")"); ?></p>
                                    <div class="p-2 bg-light rounded text-secondary small">
                                        <strong>Síntomas/Motivo:</strong><br><?php echo nl2br(htmlspecialchars($c['motivo_detallado'])); ?>
                                    </div>
                                </div>
                            </div>
                        <?php 
                            endwhile;
                        else:
                        ?>
                            <p class="text-muted text-center py-4">No hay información clínica que mostrar hoy.</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Scripts de Bootstrap y FullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'es',
            events: <?php echo $json_eventos; ?>,
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            }
        });
        calendar.render();
    });
</script>
</body>
</html>