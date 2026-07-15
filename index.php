<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Pacientes - Hospital SaMy Integral</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; margin: 20px; }
        .container { max-width: 600px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); margin: auto; }
        h2 { text-align: center; color: #333; }
        fieldset { border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 5px; }
        legend { font-weight: bold; color: #007bff; }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input, select, textarea { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        input[type="submit"] { background-color: #28a745; color: white; border: none; font-size: 16px; cursor: pointer; margin-top: 20px; padding: 12px; }
        input[type="submit"]:hover { background-color: #218838; }
    </style>
</head>
<body>

<div class="container">
    <h2>Registro de Pacientes</h2>
    <form action="guardar.php" method="POST">
        
        <fieldset>
            <legend>Datos Personales</legend>
            <label>Nombre:</label>
            <input type="text" name="nombre" required maxlength="80">

            <label>Apellidos:</label>
            <input type="text" name="apellidos" required maxlength="80">

            <label>CURP:</label>
            <input type="text" name="curp" required maxlength="18">

            <label>Edad:</label>
            <input type="number" name="edad" required>

            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="">Seleccione...</option>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                <option value="Otro">Otro</option>
            </select>
        </fieldset>

        <fieldset>
            <legend>Contacto y Dirección</legend>
            <label>Teléfono:</label>
            <input type="text" name="telefono" required maxlength="20">

            <label>Dirección:</label>
            <input type="text" name="direccion" required maxlength="120">
        </fieldset>

        <fieldset>
            <legend>Información Médica</legend>
            <label>Tipo de Sangre:</label>
            <input type="text" name="tipo_sangre" required maxlength="5" placeholder="Ej: O+, A-">

            <label>Estatura (cm):</label>
            <input type="number" name="estatura_cm" required>

            <label>Peso (kg):</label>
            <input type="number" step="0.01" name="peso_kg" required>

            <label>Alergias:</label>
            <textarea name="alergias" rows="2" maxlength="150" placeholder="Medicamentos, alimentos, etc."></textarea>

            <label>Diagnóstico Inicial:</label>
            <textarea name="diagnostico" rows="3" required maxlength="120"></textarea>

            <label>Estado del Paciente:</label>
            <select name="estado_paciente" required>
                <option value="Estable">Estable</option>
                <option value="En observacion">En observación</option>
                <option value="Critico">Crítico</option>
            </select>

            <label>Fecha de Ingreso:</label>
            <input type="date" name="fecha_ingreso" required>
        </fieldset>

        <fieldset>
            <legend>Contacto de Emergencia</legend>
            <label>Familiar Responsable:</label>
            <input type="text" name="contacto_emergencia" required maxlength="80">

            <label>Teléfono de Emergencia:</label>
            <input type="text" name="tel_emergencia" required maxlength="20">
        </fieldset>

        <input type="submit" value="Guardar Registro de Paciente">
    </form>
</div>

</body>
</html>