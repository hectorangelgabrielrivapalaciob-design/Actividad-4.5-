<?php
include("conexion.php");

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Averiguamos dinámicamente cómo se llama tu primera columna (ID)
    $resultado_columnas = $conexion->query("SHOW COLUMNS FROM pacientes");
    $columna_id_info = $resultado_columnas->fetch_assoc();
    $nombre_real_id = $columna_id_info['Field'];

    // Ejecutamos la eliminación limpia usando el nombre nativo de tu base de datos
    $sql_delete = "DELETE FROM pacientes WHERE `$nombre_real_id` = $id";

    if ($conexion->query($sql_delete) === TRUE) {
        echo "<script>alert('¡Registro eliminado con éxito!'); window.location.href='listar.php';</script>";
    } else {
        echo "Error al eliminar el registro: " . $conexion->error;
    }
} else {
    echo "<script>alert('ID no especificado.'); window.location.href='listar.php';</script>";
}
?>