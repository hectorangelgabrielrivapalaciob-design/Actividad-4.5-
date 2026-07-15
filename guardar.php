<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // 1. Recibimos los datos desde el formulario
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $curp = $_POST['curp'];
    $edad = $_POST['edad'];
    $sexo = $_POST['sexo'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $tipo_sangre = $_POST['tipo_sangre'];
    $estatura_cm = $_POST['estatura_cm'];
    $peso_kg = $_POST['peso_kg'];
    $alergias = $_POST['alergias'];
    $diagnostico = $_POST['diagnostico'];
    $estado_paciente = $_POST['estado_paciente'];
    $fecha_ingreso = $_POST['fecha_ingreso'];
    $contacto_emergencia = $_POST['contacto_emergencia'];
    $tel_emergencia = $_POST['tel_emergencia'];

    // 2. Insertamos DIRECTO por orden de columnas para evitar los errores de los dos puntos (:)
    // El primer campo es NULL porque el ID_PACIENTE es AUTO_INCREMENT
    $sql = "INSERT INTO pacientes VALUES (
        NULL, 
        '$nombre', 
        '$apellidos', 
        $edad, 
        '$sexo', 
        '$telefono', 
        '$direccion', 
        '$diagnostico', 
        '$fecha_ingreso', 
        '$curp', 
        '$tipo_sangre', 
        '$alergias', 
        $estatura_cm, 
        $peso_kg, 
        '$contacto_emergencia', 
        '$tel_emergencia', 
        '$estado_paciente'
    )";

    if ($conexion->query($sql) === TRUE) {
        echo "<script>alert('¡Paciente registrado con éxito!'); window.location.href='listar.php';</script>";
    } else {
        echo "Error al guardar el registro: " . $conexion->error;
    }
}

$conexion->close();
?>