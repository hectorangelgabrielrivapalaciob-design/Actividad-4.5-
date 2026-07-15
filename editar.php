<?php
include("conexion.php");

// 1. BUSCAR EL REGISTRO POR ID DE FORMA SEGURA
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    
    $sql = "SELECT * FROM pacientes";
    $resultado = $conexion->query($sql);
    
    $paciente_encontrado = false;
    if ($resultado && $resultado->num_rows > 0) {
        while($fila = $resultado->fetch_row()) {
            if ($fila[0] == $id) {
                $paciente = [
                    'id_paciente' => $fila[0],
                    'nombre' => $fila[1],
                    'apellidos' => $fila[2],
                    'edad' => $fila[3],
                    'sexo' => $fila[4],
                    'telefono' => $fila[5],
                    'direccion' => $fila[6],
                    'diagnostico' => $fila[7],
                    'fecha_ingreso' => $fila[8],
                    'curp' => $fila[9],
                    'tipo_sangre' => $fila[10],
                    'alergias' => $fila[11],
                    'estatura_cm' => $fila[12],
                    'peso_kg' => $fila[13],
                    'contacto_emergencia' => $fila[14],
                    'tel_emergencia' => $fila[15],
                    'estado_paciente' => $fila[16]
                ];
                $paciente_encontrado = true;
                break;
            }
        }
    }
    
    if (!$paciente_encontrado) {
        die("<br><b style='color:red;'>Paciente no encontrado en los registros.</b>");
    }
} else {
    die("<br><b style='color:red;'>Falta especificar el ID del paciente.</b>");
}

// 2. GUARDAR LOS CAMBIOS CON UPDATE AUTOMÁTICO POR POSICIÓN
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_paciente = $_POST['id_paciente'];
    
    // Almacenamos las variables en el estricto orden de las columnas de tu tabla
    $valores = [
        1  => $_POST['nombre'],
        2  => $_POST['apellidos'],
        3  => $_POST['edad'],
        4  => $_POST['sexo'],
        5  => $_POST['telefono'],
        6  => $_POST['direccion'],
        7  => $_POST['diagnostico'],
        8  => $_POST['fecha_ingreso'],
        9  => $_POST['curp'],
        10 => $_POST['tipo_sangre'],
        11 => $_POST['alergias'],
        12 => $_POST['estatura_cm'],
        13 => $_POST['peso_kg'],
        14 => $_POST['contacto_emergencia'],
        15 => $_POST['tel_emergencia'],
        16 => $_POST['estado_paciente']
    ];

    // Obtenemos los nombres reales de las columnas desde la base de datos
    $resultado_columnas = $conexion->query("SHOW COLUMNS FROM pacientes");
    $columnas = [];
    while ($col = $resultado_columnas->fetch_assoc()) {
        $columnas[] = $col['Field'];
    }

    $nombre_id = $columnas[0]; // La primera columna es la llave primaria (ID)

    // Construimos dinámicamente el SET de la consulta usando los nombres nativos de la BD
    $partes_set = [];
    foreach ($valores as $indice => $valor) {
        if (isset($columnas[$indice])) {
            $nombre_columna = $columnas[$indice];
            // Escapamos el valor para evitar errores con caracteres raros o comillas
            $valor_escapado = $conexion->real_escape_string($valor);
            
            // Si es un campo numérico (Edad, Estatura, Peso), lo guardamos sin comillas si está vacío
            if (($indice == 3 || $indice == 12 || $indice == 13) && $valor_escapado === '') {
                $partes_set[] = "`$nombre_columna` = NULL";
            } else {
                $partes_set[] = "`$nombre_columna` = '$valor_escapado'";
            }
        }
    }

    $string_set = implode(", ", $partes_set);

    // Armamos la consulta final libre de errores de escritura manual
    $sql_update = "UPDATE pacientes SET $string_set WHERE `$nombre_id` = $id_paciente";

    if ($conexion->query($sql_update) === TRUE) {
        echo "<script>alert('¡Registro actualizado con éxito!'); window.location.href='listar.php';</script>";
    } else {
        echo "Error al actualizar: " . $conexion->error;
    }
}
?>