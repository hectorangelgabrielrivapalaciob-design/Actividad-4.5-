<?php
// Incluimos la conexión que ya probamos y funciona
include("conexion.php");

// Usamos SELECT * para traer todas las columnas sin importar cómo estén escritas
$sql = "SELECT * FROM pacientes";
$resultado = $conexion->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Pacientes</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; margin: 20px; }
        .container { max-width: 1000px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); margin: auto; }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #007bff; color: white; }
        .btn-editar { background-color: #ffc107; color: black; padding: 6px 12px; text-decoration: none; border-radius: 4px; font-weight: bold; }
        .btn-editar:hover { background-color: #e0a800; }
        .btn-eliminar { background-color: #dc3545; color: white; padding: 6px 12px; text-decoration: none; border-radius: 4px; font-weight: bold; margin-left: 5px; }
        .btn-eliminar:hover { background-color: #bd2130; }
        .btn-nuevo { background-color: #28a745; color: white; padding: 10px 15px; text-decoration: none; border-radius: 4px; display: inline-block; margin-bottom: 10px; }
    </style>
</head>
<body>

<div class="container">
    <h2>Control de Pacientes Registrados</h2>
    <a href="index.php" class="btn-nuevo">+ Registrar Nuevo Paciente</a>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre Completo</th>
                <th>CURP</th>
                <th>Diagnóstico</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($resultado && $resultado->num_rows > 0) {
                // Obtenemos los datos fila por fila usando sus posiciones numéricas 
                // para evitar problemas con las mayúsculas o los dos puntos (:)
                while($fila = $resultado->fetch_row()) {
                    // $fila[0] es el ID, $fila[1] es el Nombre, $fila[2] Apellidos, etc.
                    echo "<tr>";
                    echo "<td>" . $fila[0] . "</td>";
                    echo "<td>" . $fila[1] . " " . $fila[2] . "</td>";
                    echo "<td>" . $fila[9] . "</td>"; // Posición de tu columna CURP
                    echo "<td>" . $fila[7] . "</td>"; // Posición de tu columna Diagnóstico
                    echo "<td>" . $fila[16] . "</td>"; // Posición de tu columna Estado del Paciente
                    
                    echo "<td>
                            <a href='editar.php?id=" . $fila[0] . "' class='btn-editar'>Editar</a> 
                            <a href='eliminar.php?id=" . $fila[0] . "' class='btn-eliminar' onclick='return confirm(\"¿Estás seguro de eliminar este paciente?\");'>Eliminar</a>
                          </td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='6' style='text-align:center;'>No hay pacientes registrados aún.</td></tr>";
            }
            ?>
        </tbody>
    </table>
</div>

</body>
</html>