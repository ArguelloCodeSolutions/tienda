<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes - TiendaDelConucoS.A</title>
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

        
        #sidebar button:nth-child(2) {
            background-color: white;
            color: black;
            border: 1px solid #228B22;
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

        #content-area::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.7);
            z-index: -1;
        }

        
        .client-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .client-buttons button {
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

        
        .client-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 20px auto;
            display: none;
        }

        .client-form h2 {
            color: #228B22;
            text-align: center;
            margin-bottom: 20px;
        }

        .client-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .client-form table td {
            padding: 10px;
        }

        .client-form table tr:last-child td {
            text-align: center;
            padding-top: 20px;
        }

        .client-form input[type="text"],
        .client-form input[type="number"],
        .client-form input[type="date"],
        .client-form input[type="email"],
        .client-form input[type="tel"],
        .client-form select,
        .client-form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .client-form button[type="submit"] {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .client-form button[type="submit"]:hover {
            background-color: #1e7a1e;
        }

        .active-form {
            display: block;
        }

        
        .clients-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .clients-table th, .clients-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .clients-table th {
            background-color: #228B22;
            color: white;
        }

        .clients-table tr:nth-child(even) {
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

        
        .client-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .client-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            width: 250px;
            padding: 15px;
        }

        .client-card h3 {
            color: #228B22;
            margin-top: 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .client-card p {
            margin: 8px 0;
        }

        .client-card .client-id {
            font-weight: bold;
            color: #555;
        }

        .client-card .client-actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .client-card .client-actions button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .client-card .client-actions .edit-btn {
            background-color: #228B22;
            color: white;
        }

        .client-card .client-actions .delete-btn {
            background-color: #dc3545;
            color: white;
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
            
            document.querySelectorAll('.client-form').forEach(form => {
                form.classList.remove('active-form');
            });
            
            
            if(formId) {
                document.getElementById(formId).classList.add('active-form');
            }
        }

        
        function loadClientData(clientId, nombre, tipo, telefono, email, direccion) {
            document.getElementById('client-id').value = clientId;
            document.getElementById('client-nombre').value = nombre;
            document.getElementById('client-tipo').value = tipo;
            document.getElementById('client-telefono').value = telefono;
            document.getElementById('client-email').value = email;
            document.getElementById('client-direccion').value = direccion;
            document.getElementById('client-accion').value = 'actualizar';
            
            showForm('gestion-form');
        }
    </script>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Gestión de Clientes</h1>
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
            
            <div class="client-buttons">
                <button type="button" onclick="showForm('registrar-form')">Registrar Cliente</button>
                <button type="button" onclick="showForm('buscar-form')">Buscar Cliente</button>
                <button type="button" onclick="showForm('credito-form')">Línea de Crédito</button>
                <button type="button" onclick="showForm('historial-form')">Historial de Compras</button>
            </div>

            
            <div id="registrar-form" class="client-form active-form">
                <h2>Registro de Clientes</h2>
                <form action="agregar.java" method="post">
                    <input type="hidden" id="client-id" name="id">
                    <input type="hidden" id="client-accion" name="accion" value="registrar">
                    
                    <table>
                        <tr>
                            <td width="30%"><label for="client-nombre">Nombre Completo:</label></td>
                            <td><input type="text" id="client-nombre" name="nombre" required></td>
                        </tr>
                        <tr>
                            <td><label for="client-tipo">Tipo de Cliente:</label></td>
                            <td>
                                <select id="client-tipo" name="tipo" required>
                                    <option value="">Seleccione tipo</option>
                                    <option value="regular">Regular</option>
                                    <option value="frecuente">Frecuente</option>
                                    <option value="especial">Especial</option>
                                    <option value="corporativo">Corporativo</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="client-identificacion">Identificación:</label></td>
                            <td><input type="text" id="client-identificacion" name="identificacion" required></td>
                        </tr>
                        <tr>
                            <td><label for="client-telefono">Teléfono:</label></td>
                            <td><input type="tel" id="client-telefono" name="telefono" required></td>
                        </tr>
                        <tr>
                            <td><label for="client-email">Email:</label></td>
                            <td><input type="email" id="client-email" name="email"></td>
                        </tr>
                        <tr>
                            <td><label for="client-direccion">Dirección:</label></td>
                            <td><textarea id="client-direccion" name="direccion" rows="3" required></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="client-limite">Límite de Crédito:</label></td>
                            <td><input type="number" id="client-limite" name="limite_credito" min="0" step="0.01"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Guardar Cliente</button>
                                <button type="button" onclick="showForm('')" style="margin-left: 10px;">Cancelar</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            
            <div id="buscar-form" class="client-form">
                <h2>Buscar Clientes</h2>
                <div class="search-container">
                    <form onsubmit="buscarClientes(); return false;">
                        <input type="text" id="busqueda-cliente" placeholder="Nombre, identificación o teléfono">
                        <input type="submit" value="Buscar">
                    </form>
                </div>
                
                <div class="client-cards" id="clientes-resultados">
                    <!-- Ejemplo de tarjetas de clientes -->
                    <div class="client-card">
                        <h3>Juan Pérez</h3>
                        <p class="client-id">ID: CL-001</p>
                        <p><i class="fas fa-phone"></i> 555-1234</p>
                        <p><i class="fas fa-envelope"></i> juan@example.com</p>
                        <p><i class="fas fa-map-marker-alt"></i> Calle Principal #123</p>
                        <div class="client-actions">
                            <button class="edit-btn" onclick="loadClientData('CL-001', 'Juan Pérez', 'frecuente', '555-1234', 'juan@example.com', 'Calle Principal #123')">Editar</button>
                            <button class="delete-btn">Eliminar</button>
                        </div>
                    </div>
                    
                    <div class="client-card">
                        <h3>María Gómez</h3>
                        <p class="client-id">ID: CL-002</p>
                        <p><i class="fas fa-phone"></i> 555-5678</p>
                        <p><i class="fas fa-envelope"></i> maria@example.com</p>
                        <p><i class="fas fa-map-marker-alt"></i> Avenida Central #456</p>
                        <div class="client-actions">
                            <button class="edit-btn" onclick="loadClientData('CL-002', 'María Gómez', 'regular', '555-5678', 'maria@example.com', 'Avenida Central #456')">Editar</button>
                            <button class="delete-btn">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

            
            <div id="credito-form" class="client-form">
                <h2>Gestión de Línea de Crédito</h2>
                <form action="procesar_credito.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="credito-cliente">Cliente:</label></td>
                            <td>
                                <select id="credito-cliente" name="cliente_id" required>
                                    <option value="">Seleccione cliente</option>
                                    <option value="1">Juan Pérez</option>
                                    <option value="2">María Gómez</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="credito-limite">Nuevo Límite:</label></td>
                            <td><input type="number" id="credito-limite" name="limite" min="0" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="credito-plazo">Plazo (días):</label></td>
                            <td><input type="number" id="credito-plazo" name="plazo" min="1" value="30"></td>
                        </tr>
                        <tr>
                            <td><label for="credito-accion">Acción:</label></td>
                            <td>
                                <select id="credito-accion" name="accion" required>
                                    <option value="actualizar">Actualizar Límite</option>
                                    <option value="congelar">Congelar Crédito</option>
                                    <option value="reactivar">Reactivar Crédito</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Procesar</button>
                            </td>
                        </tr>
                    </table>
                </form>
                
                <h3 style="margin-top: 30px;">Historial de Crédito</h3>
                <table class="clients-table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Límite Anterior</th>
                            <th>Nuevo Límite</th>
                            <th>Acción</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2023-07-01</td>
                            <td>Juan Pérez</td>
                            <td>$1,000.00</td>
                            <td>$1,500.00</td>
                            <td>Actualización</td>
                            <td>admin</td>
                        </tr>
                        <tr>
                            <td>2023-06-15</td>
                            <td>María Gómez</td>
                            <td>$500.00</td>
                            <td>$500.00</td>
                            <td>Congelado</td>
                            <td>admin</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            
            <div id="historial-form" class="client-form">
                <h2>Historial de Compras</h2>
                <table>
                    <tr>
                        <td width="30%"><label for="historial-cliente">Cliente:</label></td>
                        <td>
                            <select id="historial-cliente" onchange="cargarHistorial()">
                                <option value="">Seleccione cliente</option>
                                <option value="1">Juan Pérez</option>
                                <option value="2">María Gómez</option>
                            </select>
                        </td>
                    </tr>
                </table>
                
                <div class="summary-cards" style="margin: 20px 0;">
                    <div class="summary-card">
                        <h3>Total Compras</h3>
                        <div class="value" id="total-compras">$0.00</div>
                    </div>
                    <div class="summary-card">
                        <h3>Última Compra</h3>
                        <div class="value" id="ultima-compra">N/A</div>
                    </div>
                    <div class="summary-card">
                        <h3>Deuda Actual</h3>
                        <div class="value" id="deuda-actual">$0.00</div>
                    </div>
                </div>
                
                <table class="clients-table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Factura</th>
                            <th>Monto</th>
                            <th>Pagado</th>
                            <th>Saldo</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody id="historial-table">
                        
                    </tbody>
                </table>
            </div>
             
            
            <button class="back-button" onclick="goToHome()">
                <i class="fas fa-home"></i> Inicio
            </button>
        </div>
    </div>

    <script>
        
        function buscarClientes() {
            const termino = document.getElementById('busqueda-cliente').value.toLowerCase();
            alert(`Buscando clientes con: ${termino}`);
            
        }

        
        function cargarHistorial() {
            const clienteId = document.getElementById('historial-cliente').value;
            if(clienteId) {
                
                document.getElementById('total-compras').textContent = '$2,450.00';
                document.getElementById('ultima-compra').textContent = '2023-07-15';
                document.getElementById('deuda-actual').textContent = '$450.00';
                
                const tbody = document.getElementById('historial-table');
                tbody.innerHTML = `
                    <tr>
                        <td>2023-07-15</td>
                        <td>FAC-1024</td>
                        <td>$850.00</td>
                        <td>$400.00</td>
                        <td>$450.00</td>
                        <td>Pendiente</td>
                    </tr>
                    <tr>
                        <td>2023-06-28</td>
                        <td>FAC-1012</td>
                        <td>$600.00</td>
                        <td>$600.00</td>
                        <td>$0.00</td>
                        <td>Pagado</td>
                    </tr>
                    <tr>
                        <td>2023-05-10</td>
                        <td>FAC-1005</td>
                        <td>$1,000.00</td>
                        <td>$1,000.00</td>
                        <td>$0.00</td>
                        <td>Pagado</td>
                    </tr>
                `;
            } else {
                document.getElementById('historial-table').innerHTML = '';
                document.getElementById('total-compras').textContent = '$0.00';
                document.getElementById('ultima-compra').textContent = 'N/A';
                document.getElementById('deuda-actual').textContent = '$0.00';
            }
        }

        
        document.addEventListener('DOMContentLoaded', function() {
            showForm('registrar-form');
        });
    </script>
</body>
</html>