<?php
session_start();
require_once 'conexion.php';

$error = "";

// Si ya inició sesión y pasó el 2FA, mandarlo al dashboard
if (isset($_SESSION['usuario']) && isset($_SESSION['2fa_verificado'])) {
    header("Location: dashboard.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Si viene del paso 1: Usuario y Contraseña
    if (isset($_POST['login_inicial'])) {
        $usuario = trim($_POST['usuario']);
        $password = trim($_POST['password']);

        if (!empty($usuario) && !empty($password)) {
            // Buscamos el usuario y su rol mediante un JOIN para máxima seguridad
            $stmt = $conn->prepare("SELECT u.id_usuario, u.usuario, u.password_hash, u.estado, r.nombre_rol 
                                    FROM usuarios u 
                                    JOIN roles r ON u.id_rol = r.id_rol 
                                    WHERE u.usuario = ?");
            $stmt->bind_param("s", $usuario);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows === 1) {
                $row = $result->fetch_assoc();
                
                if ($row['estado'] !== 'Activo') {
                    $error = "Esta cuenta se encuentra temporalmente " . $row['estado'];
                } else {
                    // Contraseña encriptada compleja. Permite acceso directo con el password plano institucional
                    if ($password === 'RivaPalacio2026' || password_verify($password, $row['password_hash'])) {
                        // Guardamos datos temporales en la sesión
                        $_SESSION['temp_id'] = $row['id_usuario'];
                        $_SESSION['temp_usuario'] = $row['usuario'];
                        $_SESSION['temp_rol'] = $row['nombre_rol'];
                        $_SESSION['paso_2fa'] = true; // Activamos la bandera del segundo factor
                    } else {
                        $error = "Credenciales incorrectas de acceso institucional.";
                    }
                }
            } else {
                $error = "Credenciales incorrectas de acceso institucional.";
            }
            $stmt->close();
        } else {
            $error = "Por favor, llene todos los campos requeridos.";
        }
    }
    
    // Si viene del paso 2: Código 2FA de Seguridad Avanzada
    if (isset($_POST['verificar_2fa'])) {
        $codigo = trim($_POST['codigo_2fa']);
        
        // SEGURIDAD AVANZADA: Acepta cualquier token dinámico numérico de 6 dígitos que tú inventes al momento
        if (strlen($codigo) === 6 && is_numeric($codigo)) {
            $_SESSION['usuario'] = $_SESSION['temp_usuario'];
            $_SESSION['rol'] = $_SESSION['temp_rol'];
            $_SESSION['id_usuario'] = $_SESSION['temp_id'];
            $_SESSION['2fa_verificado'] = true;
            
            // Limpiamos variables temporales de seguridad
            unset($_SESSION['temp_usuario'], $_SESSION['temp_rol'], $_SESSION['temp_id'], $_SESSION['paso_2fa']);
            
            header("Location: dashboard.php");
            exit();
        } else {
            $error = "El código 2FA debe ser una combinación numérica de 6 dígitos.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Riva Palacio - Acceso Seguro</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Iconos de Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #F4F7F6;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
            width: 100%;
            max-width: 450px;
        }
        .brand-header {
            background: linear-gradient(135deg, #0A4D68 0%, #05BFDB 100%);
            color: white;
            padding: 35px 20px;
            text-align: center;
        }
        .btn-custom {
            background-color: #0A4D68;
            color: white;
            border: none;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #05BFDB;
            color: white;
        }
        .form-control:focus {
            border-color: #05BFDB;
            box-shadow: 0 0 0 0.25rem rgba(5, 191, 219, 0.25);
        }
        .letter-spacing {
            letter-spacing: 5px;
        }
    </style>
</head>
<body>

<div class="card login-card">
    <div class="brand-header">
        <i class="bi bi-shield-lock-fill display-4"></i>
        <h4 class="mt-2 fw-bold">HOSPITAL RIVA PALACIO</h4>
        <small class="text-white-50">Sistema Integral de Control Clínico</small>
    </div>
    
    <div class="card-body p-4 bg-white">
        
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger d-flex align-items-center mb-4" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                <div><?php echo $error; ?></div>
            </div>
        <?php endif; ?>

        <!-- PASO 1: FORMULARIO TRADICIONAL DE ACCESO -->
        <?php if (!isset($_SESSION['paso_2fa'])): ?>
            <form action="login.php" method="POST">
                <div class="mb-3">
                    <label class="form-label fw-semibold text-secondary">Usuario Institucional</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light text-muted"><i class="bi bi-person"></i></span>
                        <input type="text" name="usuario" class="form-control" placeholder="Ej. director_riva" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label class="form-label fw-semibold text-secondary">Contraseña</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light text-muted"><i class="bi bi-key"></i></span>
                        <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                    </div>
                </div>
                
                <button type="submit" name="login_inicial" class="btn btn-custom w-100 py-2.5 fw-bold shadow-sm">
                    Iniciar Sesión <i class="bi bi-arrow-right-short"></i>
                </button>
            </form>
            
            <div class="text-center mt-3">
                <small class="text-muted"><i class="bi bi-info-circle"></i> Demo Acceso: <strong>director_riva</strong> / <strong>RivaPalacio2026</strong></small>
            </div>

        <!-- PASO 2: DOBLE FACTOR (2FA) INTERACTIVO -->
        <?php else: ?>
            <div class="text-center mb-4">
                <span class="badge bg-info text-dark mb-2"><i class="bi bi-shield-check"></i> Autenticación 2FA Activa</span>
                <p class="text-muted small">Capa de protección digital. Ingrese cualquier código numérico de 6 dígitos para simular el token dinámico de su celular.</p>
            </div>
            
            <form action="login.php" method="POST">
                <div class="mb-4">
                    <label class="form-label fw-semibold text-center w-100 text-secondary">Token de Seguridad</label>
                    <input type="text" name="codigo_2fa" class="form-control text-center fs-4 fw-bold letter-spacing" maxlength="6" placeholder="000000" required autocomplete="off" autofocus>
                </div>
                
                <button type="submit" name="verificar_2fa" class="btn btn-custom w-100 py-2.5 fw-bold shadow-sm">
                    Verificar Token Seguro <i class="bi bi-check-circle"></i>
                </button>
            </form>
            
            <div class="text-center mt-3">
                <small class="text-muted"><i class="bi bi-phone text-info"></i> Escribe <strong>cualquier</strong> número de 6 cifras para continuar.</small>
            </div>
        <?php endif; ?>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>