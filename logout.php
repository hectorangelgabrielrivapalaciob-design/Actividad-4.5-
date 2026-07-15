<?php
// Iniciar el manejo de sesiones
session_start();

// Destruir absolutamente todas las variables de la sesión activa
$_SESSION = array();

// Si se desea destruir la cookie de sesión también (máxima seguridad)
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Destruir la sesión en el servidor
session_destroy();

// Redirigir de inmediato a la pantalla de acceso institucional seguro
header("Location: login.php");
exit();
?>