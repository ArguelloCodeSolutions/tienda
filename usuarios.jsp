<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: black;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: white;
        }

        #header {
            width: 100%;
            height: 110px;
            background-color: rgba(34, 139, 34, 1);
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        #header img {
            height: 90px;
            margin-left: 20px;
        }

        #header h1 {
            color: black;
            font-weight: bold;
            font-size: 50px;
            text-align: center;
            width: 100%;
        }

        #main-content {
            display: flex;
            flex: 1;
            position: relative;
        }

        #sidebar {
            width: 250px;
            background-color:#333333;
            padding:20px 0;
            z-index: 1;
        }

        #sidebar button {
            display: block;
            background-color: rgba(34, 139, 34, 1);
            color: black;
            font-weight: bold;
            border: none;
            width: 90%;
            height: 50px;
            margin: 15px auto;
            border-radius: 5px;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #sidebar button:nth-child(1) {
            background-color: white;
            color: black;
            border: 1px solid #228B22;
        }

        #sidebar button:nth-child(2) {
            background-color: rgba(34, 139, 34, 1);
            color: black;
        }

        #sidebar button:hover {
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(126, 200, 227, 0.7);
        }

        #content-area {
            flex: 1;
            padding: 20px;
            background-image: url(imagenes/logo.jpg);
            background-size: 50% auto;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: local;
            position: relative;
        }

        

        .user-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .user-buttons button {
            background-color: #228B22;
            color: black;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            min-width: 180px;
        }

        .back-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #228B22;
            color: black;
            font-weight: bold;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            z-index: 2;
        }

        .user-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
            display: none;
        }

        .user-form h2 {
            color: #228B22;
            text-align: center;
            margin-bottom: 20px;
        }

        .user-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-form table td {
            padding: 10px;
        }

        .user-form table tr:last-child td {
            text-align: center;
            padding-top: 20px;
        }

        .user-form input[type="text"],
        .user-form input[type="password"],
        .user-form input[type="email"],
        .user-form select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .user-form button[type="submit"] {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .user-form button[type="submit"]:hover {
            background-color: #1e7a1e;
        }

        .active-form {
            display: block;
        }
    </style>
    <script>
        function redirectToInicioSesion() {
            window.location.href = "inicio_sesion.jsp";
        }
        
        function goToHome() {
            window.location.href = "inicio.jsp";
        }

        function showForm(formId) {
            document.querySelectorAll('.user-form').forEach(form => {
                form.classList.remove('active-form');
            });
            
            document.getElementById(formId).classList.add('active-form');
        }
    </script>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Gestión de Usuarios</h1>
    </div>

    <div id="main-content">
        <div id="sidebar">
            <button type="button" onclick="window.location.href = 'usuarios.jsp'">Usuarios</button>
            <button type="button" onclick="window.location.href = 'clientes.jsp'">Clientes</button>
            <button type="button" onclick="window.location.href = 'creditos.jsp'">Créditos</button>
            <button type="button" onclick="window.location.href = 'productos.jsp'">Productos</button>
            <button type="button" onclick="window.location.href = 'facturas.jsp'">Facturas</button>
            <button type="button" onclick="window.location.href = 'reportes.jsp'">Reportes</button>
            <button type="button" onclick="goToHome()">regresar al Inicio</button>
        </div>

        <div id="content-area">
            <!-- Botones de usuario -->
            <div class="user-buttons">
                <button type="button" onclick="showForm('registrar-form')">Registrar Usuario</button>
                <button type="button" onclick="showForm('actualizar-form')">Actualizar Usuario</button>
                <button type="button" onclick="showForm('eliminar-form')">Eliminar Usuario</button>
                <button type="button" onclick="showForm('nuevo-form')">Crear Nuevo Usuario</button>
            </div>

            <!-- Formulario para Registrar Usuario -->
            <div id="registrar-form" class="user-form">
                <h2>Registrar Usuario</h2>
                <form action="procesar_registro.jsp" method="post">
                    <table>
                        <tr>
                            <td><label for="reg-nombre">Nombre:</label></td>
                            <td><input type="text" id="reg-nombre" name="nombre" required></td>
                        </tr>
                        <tr>
                            <td><label for="reg-apellido">Apellido:</label></td>
                            <td><input type="text" id="reg-apellido" name="apellido" required></td>
                        </tr>
                        <tr>
                            <td><label for="reg-email">Email:</label></td>
                            <td><input type="email" id="reg-email" name="email" required></td>
                        </tr>
                        <tr>
                            <td><label for="reg-usuario">Usuario:</label></td>
                            <td><input type="text" id="reg-usuario" name="usuario" required></td>
                        </tr>
                        <tr>
                            <td><label for="reg-password">Contraseña:</label></td>
                            <td><input type="password" id="reg-password" name="password" required></td>
                        </tr>
                        <tr>
                            <td><label for="reg-rol">Rol:</label></td>
                            <td>
                                <select id="reg-rol" name="rol" required>
                                    <option value="">Seleccione un rol</option>
                                    <option value="admin">Administrador</option>
                                    <option value="user">Usuario Normal</option>
                                    <option value="editor">Editor</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Registrar</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- Formulario para Actualizar Usuario -->
            <div id="actualizar-form" class="user-form">
                <h2>Actualizar Usuario</h2>
                <form action="procesar_actualizacion.jsp" method="post">
                    <table>
                        <tr>
                            <td><label for="act-id">ID Usuario:</label></td>
                            <td><input type="text" id="act-id" name="id" required></td>
                        </tr>
                        <tr>
                            <td><label for="act-nombre">Nombre:</label></td>
                            <td><input type="text" id="act-nombre" name="nombre"></td>
                        </tr>
                        <tr>
                            <td><label for="act-apellido">Apellido:</label></td>
                            <td><input type="text" id="act-apellido" name="apellido"></td>
                        </tr>
                        <tr>
                            <td><label for="act-email">Email:</label></td>
                            <td><input type="email" id="act-email" name="email"></td>
                        </tr>
                        <tr>
                            <td><label for="act-password">Nueva Contraseña:</label></td>
                            <td><input type="password" id="act-password" name="password"></td>
                        </tr>
                        <tr>
                            <td><label for="act-rol">Rol:</label></td>
                            <td>
                                <select id="act-rol" name="rol">
                                    <option value="">No cambiar</option>
                                    <option value="admin">Administrador</option>
                                    <option value="user">Usuario Normal</option>
                                    <option value="editor">Editor</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Actualizar</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div id="eliminar-form" class="user-form">
                <h2>Eliminar Usuario</h2>
                <form action="procesar_eliminacion.jsp" method="post">
                    <table>
                        <tr>
                            <td><label for="elim-id">ID Usuario:</label></td>
                            <td><input type="text" id="elim-id" name="id" required></td>
                        </tr>
                        <tr>
                            <td><label for="elim-confirm">Confirmar Eliminación:</label></td>
                            <td>
                                <select id="elim-confirm" name="confirm" required>
                                    <option value="">Seleccione una opción</option>
                                    <option value="si">Sí, eliminar este usuario</option>
                                    <option value="no">No, cancelar</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Eliminar</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div id="nuevo-form" class="user-form">
                <h2>Crear Nuevo Usuario</h2>
                <form action="procesar_nuevo.jsp" method="post">
                    <table>
                        <tr>
                            <td><label for="nuevo-nombre">Nombre:</label></td>
                            <td><input type="text" id="nuevo-nombre" name="nombre" required></td>
                        </tr>
                        <tr>
                            <td><label for="nuevo-apellido">Apellido:</label></td>
                            <td><input type="text" id="nuevo-apellido" name="apellido" required></td>
                        </tr>
                        <tr>
                            <td><label for="nuevo-usuario">Nombre de Usuario:</label></td>
                            <td><input type="text" id="nuevo-usuario" name="usuario" required></td>
                        </tr>
                        <tr>
                            <td><label for="nuevo-email">Email:</label></td>
                            <td><input type="email" id="nuevo-email" name="email" required></td>
                        </tr>
                        <tr>
                            <td><label for="nuevo-departamento">Departamento:</label></td>
                            <td>
                                <select id="nuevo-departamento" name="departamento" required>
                                    <option value="">Seleccione departamento</option>
                                    <option value="ventas">Ventas</option>
                                    <option value="contabilidad">Contabilidad</option>
                                    <option value="sistemas">Sistemas</option>
                                    <option value="administracion">Administración</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Crear Usuario</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
             
            <!-- Botón de inicio en la parte inferior derecha -->
            <button class="back-button" onclick="goToHome()">
                <i class="fas fa-home"></i> Inicio
            </button>
        </div>
    </div>
</body>

</html>