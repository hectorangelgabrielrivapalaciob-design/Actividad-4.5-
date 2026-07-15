<?php
session_start();
require_once 'conexion.php';

// Validar inicio de sesión y rol (Admin o Médico)
if (!isset($_SESSION['usuario']) || !isset($_SESSION['2fa_verificado'])) {
    header("Location: login.php");
    exit();
}

$rol_usuario = $_SESSION['rol'];
if ($rol_usuario !== 'Administrador Global' && $rol_usuario !== 'Personal Medico') {
    echo "<script>alert('No tienes permisos para expedir recetas médicas.'); window.location.href='dashboard.php';</script>";
    exit();
}

$mensaje = "";
$status = "";
$receta_imprimir = null;

// 1. PROCESAR EL REGISTRO DE LA RECETA
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['guardar_receta'])) {
    $id_cita = intval($_POST['id_cita']);
    $diagnostico = trim($_POST['diagnostico']);
    $medicamentos = trim($_POST['medicamentos']);

    if (!empty($id_cita) && !empty($diagnostico) && !empty($medicamentos)) {
        $stmt = $conn->prepare("INSERT INTO recetas (id_cita, diagnostico, medicamentos) VALUES (?, ?, ?)");
        $stmt->bind_param("iss", $id_cita, $diagnostico, $medicamentos);
        
        if ($stmt->execute()) {
            $id_receta_nueva = $conn->insert_id;
            header("Location: recetas.php?imprimir=" . $id_receta_nueva);
            exit();
        } else {
            $mensaje = "Error al registrar la receta: " . $conn->error;
            $status = "danger";
        }
        $stmt->close();
    } else {
        $mensaje = "Por favor, complete todos los campos de la receta.";
        $status = "warning";
    }
}

// 2. MODO IMPRESIÓN: OBTENER DETALLES
if (isset($_GET['imprimir'])) {
    $id_receta = intval($_GET['imprimir']);
    $query_imp = "SELECT r.*, c.fecha_cita_inicio, p.nombre as p_nom, p.apellidos as p_ape, p.fecha_nacimiento,
                         d.nombre as d_nom, d.apellidos as d_ape, d.especialidad
                  FROM recetas r
                  JOIN citas c ON r.id_cita = c.id_cita
                  JOIN pacientes p ON c.id_paciente = p.id_paciente
                  JOIN doctores d ON c.id_doctor = d.id_doctor
                  WHERE r.id_receta = ?";
    $stmt_imp = $conn->prepare($query_imp);
    $stmt_imp->bind_param("i", $id_receta);
    $stmt_imp->execute();
    $receta_imprimir = $stmt_imp->get_result()->fetch_assoc();
    $stmt_imp->close();
}

// 3. CONSULTAR CITAS DISPONIBLES
$query_citas = "SELECT c.id_cita, c.fecha_cita_inicio, p.nombre as p_nom, p.apellidos as p_ape 
                FROM citas c
                JOIN pacientes p ON c.id_paciente = p.id_paciente
                WHERE c.id_cita NOT IN (SELECT id_cita FROM recetas)
                ORDER BY c.fecha_cita_inicio DESC";
$citas_disponibles = $conn->query($query_citas);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Recetas Médicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        :root {
            --riva-dark: #0A4D68;
            --riva-cyan: #05BFDB;
            --riva-light: #F4F7F6;
        }
        body {
            background-color: var(--riva-light);
            font-family: 'Segoe UI', system-ui, sans-serif;
        }
        .navbar-custom { background-color: var(--riva-dark); }
        
        /* ESTILO INNOVADOR DE LA RECETA DE ALTA GAMA */
        .receta-container {
            background: #ffffff;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(10, 77, 104, 0.1);
            border: 1px solid rgba(0,0,0,0.05);
            position: relative;
        }
        
        /* Franja de diseño superior con geometría abstracta */
        .receta-header-creative {
            background: linear-gradient(135deg, var(--riva-dark) 0%, #086684 100%);
            color: white;
            padding: 35px;
            position: relative;
        }
        .receta-header-creative::after {
            content: "";
            position: absolute;
            bottom: 0;
            right: 0;
            width: 300px;
            height: 100%;
            background: linear-gradient(45deg, transparent 50%, rgba(5, 191, 219, 0.15) 50%);
            z-index: 1;
        }
        
        .brand-title {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: 1.5px;
            text-transform: uppercase;
        }
        
        /* Bloque lateral de metadata clínica (Estilo Tarjeta Médica) */
        .meta-sidebar {
            background-color: #fafbfc;
            border-right: 4px solid var(--riva-cyan);
            padding: 25px;
            height: 100%;
            border-radius: 0 0 0 20px;
        }
        
        .meta-label {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            color: #888;
            letter-spacing: 0.5px;
            margin-bottom: 2px;
        }
        
        .meta-value {
            font-size: 0.95rem;
            color: var(--riva-dark);
            font-weight: 600;
            margin-bottom: 15px;
        }

        /* Cuerpo principal del tratamiento */
        .receta-body-content {
            padding: 30px;
        }
        
        .section-badge {
            background: rgba(5, 191, 219, 0.12);
            color: #05889c;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: 30px;
            display: inline-block;
            font-size: 0.8rem;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .content-box-creative {
            background: #ffffff;
            border: 1px dashed #ced4da;
            border-radius: 12px;
            padding: 20px;
            font-size: 1rem;
            line-height: 1.6;
            color: #333;
            min-height: 140px;
        }
        
        /* Firma Electrónica / Sello */
        .signature-area {
            margin-top: 40px;
            text-align: right;
            position: relative;
        }
        
        .signature-line {
            display: inline-block;
            width: 220px;
            border-top: 2px solid var(--riva-dark);
            padding-top: 5px;
            text-align: center;
        }

        /* AJUSTES DRÁSTICOS DE IMPRESIÓN */
        @media print {
            .no-print, nav, .btn, .alert { display: none !important; }
            body { background: white !important; pading: 0; margin: 0; }
            .container { max-width: 100% !important; width: 100% !important; padding: 0 !important; }
            .receta-container {
                box-shadow: none !important;
                border: 2px solid var(--riva-dark) !important;
                border-radius: 0 !important;
            }
            .meta-sidebar {
                background-color: #f8f9fa !important;
                -webkit-print-color-adjust: exact; 
                print-color-adjust: exact;
            }
            .receta-header-creative {
                -webkit-print-color-adjust: exact; 
                print-color-adjust: exact;
            }
        }
    </style>
</head>
<body>

<!-- BARRA SUPERIOR NO IMPRIMIBLE -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom px-4 shadow-sm no-print">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="dashboard.php">
        <i class="bi bi-arrow-left-circle me-2 fs-4 text-info"></i> VOLVER AL PANEL
    </a>
</nav>

<div class="container py-5">
    
    <!-- MODO RECETA REDISEÑADA E INNOVADORA -->
    <?php if ($receta_imprimir): ?>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10">
                
                <div class="no-print d-flex justify-content-between mb-4">
                    <a href="recetas.php" class="btn btn-outline-secondary fw-bold rounded-pill px-4"><i class="bi bi-file-earmark-plus"></i> Generar Otra</a>
                    <button onclick="window.print();" class="btn btn-info text-white fw-bold rounded-pill px-4 shadow"><i class="bi bi-printer-fill me-2"></i> Lanzar Impresión Visual</button>
                </div>

                <!-- CONTENEDOR ESTILO GAFETE/VOUCHER VANGUARDISTA -->
                <div class="receta-container">
                    
                    <!-- ENCABEZADO CON ESTILO CORPORATIVO MODERNO -->
                    <div class="receta-header-creative d-flex justify-content-between align-items-center">
                        <div style="z-index: 2;">
                            <span class="text-info fw-bold text-uppercase small" style="letter-spacing: 2px;">Prescripción Facultativa</span>
                            <h1 class="brand-title mb-0">Hospital Riva Palacio</h1>
                        </div>
                        <div class="text-end" style="z-index: 2;">
                            <i class="bi bi-shield-plus text-info fs-1"></i>
                        </div>
                    </div>

                    <div class="row g-0">
                        <!-- COLUMNA LATERAL: DATOS CONTROLADOS -->
                        <div class="col-md-4">
                            <div class="meta-sidebar">
                                <div class="meta-label">Folio Receta</div>
                                <div class="meta-value">#RP-00<?php echo $receta_imprimir['id_receta']; ?></div>

                                <div class="meta-label">Paciente en Triage</div>
                                <div class="meta-value text-capitalize"><?php echo htmlspecialchars($receta_imprimir['p_nom'] . " " . $receta_imprimir['p_ape']); ?></div>
                                
                                <div class="meta-label">Fecha de Expedición</div>
                                <div class="meta-value"><?php echo date('d / M / Y', strtotime($receta_imprimir['fecha_cita_inicio'])); ?></div>

                                <div class="meta-label">Médico Responsable</div>
                                <div class="meta-value">Dr(a). <?php echo htmlspecialchars($receta_imprimir['d_nom'] . " " . $receta_imprimir['d_ape']); ?></div>
                                
                                <div class="meta-label">Especialidad</div>
                                <div class="meta-value"><span class="badge bg-dark text-info"><?php echo htmlspecialchars($receta_imprimir['especialidad']); ?></span></div>
                            </div>
                        </div>

                        <!-- COLUMNA PRINCIPAL: BLOQUES CLÍNICOS LIMPIOS -->
                        <div class="col-md-8">
                            <div class="receta-body-content">
                                
                                <!-- BLOQUE 1: DIAGNÓSTICO -->
                                <div class="mb-4">
                                    <span class="section-badge"><i class="bi bi-heart-pulse-fill"></i> Diagnóstico y Valoración</span>
                                    <div class="content-box-creative" style="white-space: pre-line;">
                                        <?php echo htmlspecialchars($receta_imprimir['diagnostico']); ?>
                                    </div>
                                </div>

                                <!-- BLOQUE 2: TRATAMIENTO -->
                                <div class="mb-2">
                                    <span class="section-badge"><i class="bi bi-capsule-capsules"></i> Régimen de Medicación</span>
                                    <div class="content-box-creative" style="white-space: pre-line; background-color: #fbfdfd;">
                                        <?php echo htmlspecialchars($receta_imprimir['medicamentos']); ?>
                                    </div>
                                </div>

                                <!-- ÁREA DE VALIDACIÓN Y FIRMA -->
                                <div class="signature-area">
                                    <div class="signature-line">
                                        <p class="mb-0 small fw-bold text-dark">Dr(a). <?php echo htmlspecialchars($receta_imprimir['d_nom'] . " " . $receta_imprimir['d_ape']); ?></p>
                                        <span class="text-muted" style="font-size: 0.65rem;">Cédula Profesional Validada</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    <!-- MODO FORMULARIO ORIGINAL -->
    <?php else: ?>
        <h2 class="fw-bold text-dark mb-4"><i class="bi bi-prescription text-success"></i> Expedición de Receta Médica</h2>
        <!-- Formulario idéntico para capturar la receta -->
        <div class="row justify-content-center">
            <div class="col-12 col-lg-7">
                <div class="card p-4 bg-white border-0 shadow-sm" style="border-radius: 12px;">
                    <form action="recetas.php" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-semibold text-muted">Seleccione la Consulta / Paciente</label>
                            <select name="id_cita" class="form-select" required>
                                <option value="">-- Citas pendientes de receta --</option>
                                <?php while($row = $citas_disponibles->fetch_assoc()): ?>
                                    <option value="<?php echo $row['id_cita']; ?>">
                                        <?php echo htmlspecialchars($row['p_nom'] . " " . $row['p_ape']); ?> - (<?php echo date('d/m/Y H:i', strtotime($row['fecha_cita_inicio'])); ?>)
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold text-muted">Diagnóstico Clínico (TEXT)</label>
                            <textarea name="diagnostico" class="form-control" rows="3" placeholder="Escriba la valoración médica detallada..." required></textarea>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold text-muted">Indicaciones y Medicamentos (TEXT)</label>
                            <textarea name="medicamentos" class="form-control" rows="6" placeholder="Paracetamol 500mg - 1 cada 8 horas por 5 días..." required></textarea>
                        </div>
                        <button type="submit" name="guardar_receta" class="btn w-100 fw-bold py-2 text-white" style="background-color: #0A4D68;">
                            Guardar y Desplegar Formato Innovador <i class="bi bi-stars ms-1"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    <?php endif; ?>
</div>

</body>
</html>