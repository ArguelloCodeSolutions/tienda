<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créditos - TiendaDelConucoS.A</title>
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

        /* Estilo específico para el botón Clientes - BLANCO */
        #sidebar button:nth-child(2) {
            background-color: rgba(34, 139, 34, 1); /* Verde */
            color: black;
            border: none;
        }

        /* Estilo específico para el botón Créditos - VERDE */
        #sidebar button:nth-child(3) {
            background-color: rgba(255, 255, 255, 1);
            color: black;
            border: none;
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

        /* Estilos para los botones de créditos */
        .credit-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .credit-buttons button {
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

        /* Estilo para el botón de regresar */
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

        /* Estilos para los formularios */
        .credit-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 20px auto;
            display: none;
        }

        .credit-form h2 {
            color: #228B22;
            text-align: center;
            margin-bottom: 20px;
        }

        .credit-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .credit-form table td {
            padding: 10px;
        }

        .credit-form table tr:last-child td {
            text-align: center;
            padding-top: 20px;
        }

        .credit-form input[type="text"],
        .credit-form input[type="number"],
        .credit-form input[type="date"],
        .credit-form select,
        .credit-form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .credit-form button[type="submit"] {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .credit-form button[type="submit"]:hover {
            background-color: #1e7a1e;
        }

        .active-form {
            display: block;
        }

        /* Estilo para la tabla de resultados */
        .results-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .results-table th, .results-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .results-table th {
            background-color: #228B22;
            color: white;
        }

        .results-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .search-container {
            text-align: center;
            margin: 20px 0;
        }

        .search-container input[type="text"] {
            padding: 10px;
            width: 300px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .search-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #228B22;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
    <script>
        function redirectToInicioSesion() {
            window.location.href = "inicio_sesion.jsp";
        }
        
        function goToHome() {
            window.location.href = "inicio.jsp";
        }

        // Función para mostrar el formulario seleccionado
        function showForm(formId) {
            // Oculta todos los formularios
            document.querySelectorAll('.credit-form').forEach(form => {
                form.classList.remove('active-form');
            });
            
            // Muestra el formulario seleccionado
            if(formId) {
                document.getElementById(formId).classList.add('active-form');
            }
        }
    </script>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Gestión de Créditos</h1>
    </div>

    <div id="main-content">
        <div id="sidebar">
            <button type="button" onclick="window.location.href = 'usuarios.jsp'">Usuarios</button>
            <button type="button" onclick="window.location.href = 'clientes.jsp'">Clientes</button>
            <button type="button" onclick="window.location.href = 'creditos.jsp'">Créditos</button>
            <button type="button" onclick="window.location.href = 'productos.jsp'">Productos</button>
            <button type="button" onclick="window.location.href = 'facturas.jsp'">Facturas</button>
            <button type="button" onclick="window.location.href = 'reportes.jsp'">Reportes</button>
            <button type="button" onclick="goToHome()">Regresar al Inicio</button>
        </div>

        <div id="content-area">
            <!-- Botones de créditos -->
            <div class="credit-buttons">
                <button type="button" onclick="showForm('gestion-form')">Registrar/Editar/Eliminar Créditos</button>
                <button type="button" onclick="showForm('ingresos-form')">Registrar Ingresos</button>
                <button type="button" onclick="showForm('balance-form')">Balance General</button>
            </div>

            <!-- Formulario de Gestión de Créditos -->
            <div id="gestion-form" class="credit-form">
                <h2>Gestión de Créditos</h2>
                <form action="" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="credito-id">ID Crédito:</label></td>
                            <td><input type="text" id="credito-id" name="id" placeholder="Dejar vacío para nuevo crédito"></td>
                        </tr>
                        <tr>
                            <td><label for="cliente-id">ID Cliente:</label></td>
                            <td><input type="text" id="cliente-id" name="cliente_id" required></td>
                        </tr>
                        <tr>
                            <td><label for="monto">Monto:</label></td>
                            <td><input type="number" id="monto" name="monto" min="0" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="tasa">Tasa de Interés (%):</label></td>
                            <td><input type="number" id="tasa" name="tasa" min="0" max="100" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="plazo">Plazo (meses):</label></td>
                            <td><input type="number" id="plazo" name="plazo" min="1" required></td>
                        </tr>
                        <tr>
                            <td><label for="fecha-inicio">Fecha de Inicio:</label></td>
                            <td><input type="date" id="fecha-inicio" name="fecha_inicio" required></td>
                        </tr>
                        <tr>
                            <td><label for="estado">Estado:</label></td>
                            <td>
                                <select id="estado" name="estado" required>
                                    <option value="activo">Activo</option>
                                    <option value="pagado">Pagado</option>
                                    <option value="moroso">Moroso</option>
                                    <option value="cancelado">Cancelado</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="accion">Acción:</label></td>
                            <td>
                                <select id="accion" name="accion" required>
                                    <option value="registrar">Registrar Nuevo</option>
                                    <option value="actualizar">Actualizar</option>
                                    <option value="eliminar">Eliminar</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Ejecutar Acción</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- Formulario de Registro de Ingresos -->
            <div id="ingresos-form" class="credit-form">
                <h2>Registro de Ingresos por Créditos</h2>
                <form action="procesar_ingreso.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="credito-pago">ID Crédito:</label></td>
                            <td><input type="text" id="credito-pago" name="credito_id" required></td>
                        </tr>
                        <tr>
                            <td><label for="monto-pago">Monto del Pago:</label></td>
                            <td><input type="number" id="monto-pago" name="monto" min="0" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="fecha-pago">Fecha de Pago:</label></td>
                            <td><input type="date" id="fecha-pago" name="fecha_pago" required></td>
                        </tr>
                        <tr>
                            <td><label for="metodo-pago">Método de Pago:</label></td>
                            <td>
                                <select id="metodo-pago" name="metodo_pago" required>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="transferencia">Transferencia</option>
                                    <option value="cheque">Cheque</option>
                                    <option value="tarjeta">Tarjeta de Crédito/Débito</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="comentarios">Comentarios:</label></td>
                            <td><textarea id="comentarios" name="comentarios" rows="3"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Registrar Pago</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- Formulario de Balance General -->
            <div id="balance-form" class="credit-form">
                <h2>Balance General de Créditos</h2>
                <div class="search-container">
                    <form action="#" method="GET">
                        <input type="text" name="search" placeholder="Buscar por cliente o ID crédito...">
                        <input type="submit" value="Buscar">
                    </form>
                </div>
                
                <table class="results-table">
                    <thead>
                        <tr>
                            <th>ID Crédito</th>
                            <th>Cliente</th>
                            <th>Monto Inicial</th>
                            <th>Saldo Pendiente</th>
                            <th>Estado</th>
                            <th>Próximo Pago</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>CR-001</td>
                            <td>Juan Pérez</td>
                            <td>$5,000.00</td>
                            <td>$2,500.00</td>
                            <td>Al día</td>
                            <td>15/07/2023</td>
                        </tr>
                        <tr>
                            <td>CR-002</td>
                            <td>María Gómez</td>
                            <td>$3,200.00</td>
                            <td>$1,800.00</td>
                            <td>Al día</td>
                            <td>20/07/2023</td>
                        </tr>
                        <tr>
                            <td>CR-003</td>
                            <td>Carlos Rojas</td>
                            <td>$7,500.00</td>
                            <td>$7,500.00</td>
                            <td>Moroso</td>
                            <td>05/06/2023</td>
                        </tr>
                    </tbody>
                </table>
                
                <div style="margin-top: 20px; text-align: center;">
                    <button onclick="window.print()" style="background-color: #228B22; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
                        <i class="fas fa-print"></i> Imprimir Reporte
                    </button>
                    <button onclick="exportToExcel()" style="background-color: #228B22; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; margin-left: 10px;">
                        <i class="fas fa-file-excel"></i> Exportar a Excel
                    </button>
                </div>
            </div>
             
            <!-- Botón de inicio en la parte inferior derecha -->
            <button class="back-button" onclick="goToHome()">
                <i class="fas fa-home"></i> Inicio
            </button>
        </div>
    </div>

    <script>
        // Función para exportar a Excel (simulada)
        function exportToExcel() {
            alert("Función de exportar a Excel se ejecutaría aquí");
            // En una implementación real, aquí iría el código para generar el Excel
        }
    </script>
    
</body>
</html>