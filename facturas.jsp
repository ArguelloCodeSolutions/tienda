<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facturas - TiendaDelConucoS.A</title>
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
            background-image: url(imagenes/logo-Art.jpg);
            background-size: 50% auto;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
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

        
        #sidebar button:nth-child(5) {
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

        
        .invoice-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .invoice-buttons button {
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

        
        .invoice-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 900px;
            margin: 20px auto;
            display: none;
        }

        .invoice-form h2 {
            color: #228B22;
            text-align: center;
            margin-bottom: 20px;
        }

        .invoice-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .invoice-form table td {
            padding: 10px;
        }

        .invoice-form table tr:last-child td {
            text-align: center;
            padding-top: 20px;
        }

        .invoice-form input[type="text"],
        .invoice-form input[type="number"],
        .invoice-form input[type="date"],
        .invoice-form select,
        .invoice-form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .invoice-form button[type="submit"] {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .invoice-form button[type="submit"]:hover {
            background-color: #1e7a1e;
        }

        .active-form {
            display: block;
        }

        
        .invoices-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .invoices-table th, .invoices-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .invoices-table th {
            background-color: #228B22;
            color: white;
        }

        .invoices-table tr:nth-child(even) {
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

        
        .invoice-items {
            margin-top: 20px;
        }

        .invoice-items table {
            width: 100%;
            border-collapse: collapse;
        }

        .invoice-items th {
            background-color: #f2f2f2;
        }

        .invoice-items input[type="number"] {
            width: 80px;
        }

        .add-item-btn {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
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
            
            document.querySelectorAll('.invoice-form').forEach(form => {
                form.classList.remove('active-form');
            });
            
            
            if(formId) {
                document.getElementById(formId).classList.add('active-form');
            }
        }

        
        function addInvoiceItem() {
            const table = document.getElementById('invoice-items-table');
            const row = table.insertRow(-1);
            
            row.innerHTML = `
                <td><input type="text" name="producto[]" required></td>
                <td><input type="number" name="cantidad[]" min="1" value="1" required></td>
                <td><input type="number" name="precio[]" min="0" step="0.01" required></td>
                <td><input type="number" name="descuento[]" min="0" max="100" value="0"></td>
                <td><button type="button" onclick="this.parentNode.parentNode.remove()">Eliminar</button></td>
            `;
            
            calculateTotal();
        }

        
        function calculateTotal() {
            const rows = document.querySelectorAll('#invoice-items-table tr');
            let subtotal = 0;
            
            rows.forEach(row => {
                const cantidad = parseFloat(row.querySelector('input[name="cantidad[]"]').value) || 0;
                const precio = parseFloat(row.querySelector('input[name="precio[]"]').value) || 0;
                const descuento = parseFloat(row.querySelector('input[name="descuento[]"]').value) || 0;
                
                const totalItem = cantidad * precio * (1 - descuento/100);
                subtotal += totalItem;
            });
            
            document.getElementById('subtotal').textContent = subtotal.toFixed(2);
            
            
            const iva = subtotal * 0.16;
            document.getElementById('iva').textContent = iva.toFixed(2);
            
            const total = subtotal + iva;
            document.getElementById('total').textContent = total.toFixed(2);
            
            
            document.getElementById('total-input').value = total.toFixed(2);
        }

        
        document.addEventListener('DOMContentLoaded', function() {
            document.addEventListener('input', function(e) {
                if(e.target.name === 'cantidad[]' || e.target.name === 'precio[]' || e.target.name === 'descuento[]') {
                    calculateTotal();
                }
            });
        });
    </script>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Gestión de Facturas</h1>
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
            <!-- Botones de facturación -->
            <div class="invoice-buttons">
                <button type="button" onclick="showForm('proveedor-form')">Registrar Proveedores</button>
                <button type="button" onclick="showForm('orden-form')">Generar Órdenes de Compra</button>
                <button type="button" onclick="showForm('recibo-form')">Registrar Recibos</button>
                <button type="button" onclick="showForm('factura-form')">Crear Nueva Factura</button>
            </div>

            <!-- Formulario de Registro de Proveedores -->
            <div id="proveedor-form" class="invoice-form">
                <h2>Registro de Proveedores</h2>
                <form action="procesar_proveedor.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="proveedor-id">ID Proveedor:</label></td>
                            <td><input type="text" id="proveedor-id" name="id" placeholder="Dejar vacío para nuevo proveedor"></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-nombre">Nombre:</label></td>
                            <td><input type="text" id="proveedor-nombre" name="nombre" required></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-ruc">RUC:</label></td>
                            <td><input type="text" id="proveedor-ruc" name="ruc" required></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-telefono">Teléfono:</label></td>
                            <td><input type="text" id="proveedor-telefono" name="telefono" required></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-email">Email:</label></td>
                            <td><input type="text" id="proveedor-email" name="email"></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-direccion">Dirección:</label></td>
                            <td><textarea id="proveedor-direccion" name="direccion" rows="3"></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="proveedor-accion">Acción:</label></td>
                            <td>
                                <select id="proveedor-accion" name="accion" required>
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

            <!-- Formulario de Órdenes de Compra -->
            <div id="orden-form" class="invoice-form">
                <h2>Generar Órden de Compra</h2>
                <form action="procesar_orden.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="orden-numero">Número de Orden:</label></td>
                            <td><input type="text" id="orden-numero" name="numero" readonly value="OC-<%= new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()) %>"></td>
                        </tr>
                        <tr>
                            <td><label for="orden-proveedor">Proveedor:</label></td>
                            <td>
                                <select id="orden-proveedor" name="proveedor" required>
                                    <option value="">Seleccione proveedor</option>
                                    <option value="1">Proveedor 1</option>
                                    <option value="2">Proveedor 2</option>
                                    <option value="3">Proveedor 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="orden-fecha">Fecha:</label></td>
                            <td><input type="date" id="orden-fecha" name="fecha" required></td>
                        </tr>
                        <tr>
                            <td><label for="orden-entrega">Fecha Estimada de Entrega:</label></td>
                            <td><input type="date" id="orden-entrega" name="fecha_entrega" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="invoice-items">
                                    <h3>Items de la Orden</h3>
                                    <table id="orden-items-table">
                                        <thead>
                                            <tr>
                                                <th>Producto</th>
                                                <th>Cantidad</th>
                                                <th>Precio Unitario</th>
                                                <th>Subtotal</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="text" name="producto[]" required></td>
                                                <td><input type="number" name="cantidad[]" min="1" value="1" required></td>
                                                <td><input type="number" name="precio[]" min="0" step="0.01" required></td>
                                                <td><span class="subtotal">0.00</span></td>
                                                <td><button type="button" onclick="this.parentNode.parentNode.remove(); calculateOrderTotal()">Eliminar</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button type="button" class="add-item-btn" onclick="addOrderItem()">Agregar Item</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="total-section">
                                    <p>Total: <span id="orden-total">0.00</span></p>
                                    <input type="hidden" name="total" id="orden-total-input">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Generar Orden</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- Formulario de Recibos -->
            <div id="recibo-form" class="invoice-form">
                <h2>Registrar Recibo</h2>
                <form action="procesar_recibo.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="recibo-numero">Número de Recibo:</label></td>
                            <td><input type="text" id="recibo-numero" name="numero" required></td>
                        </tr>
                        <tr>
                            <td><label for="recibo-fecha">Fecha:</label></td>
                            <td><input type="date" id="recibo-fecha" name="fecha" required></td>
                        </tr>
                        <tr>
                            <td><label for="recibo-cliente">Cliente:</label></td>
                            <td>
                                <select id="recibo-cliente" name="cliente" required>
                                    <option value="">Seleccione cliente</option>
                                    <option value="1">Cliente 1</option>
                                    <option value="2">Cliente 2</option>
                                    <option value="3">Cliente 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="recibo-monto">Monto:</label></td>
                            <td><input type="number" id="recibo-monto" name="monto" min="0" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="recibo-metodo">Método de Pago:</label></td>
                            <td>
                                <select id="recibo-metodo" name="metodo_pago" required>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="transferencia">Transferencia</option>
                                    <option value="cheque">Cheque</option>
                                    <option value="tarjeta">Tarjeta</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="recibo-concepto">Concepto:</label></td>
                            <td><textarea id="recibo-concepto" name="concepto" rows="3" required></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Registrar Recibo</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <!-- Formulario de Facturación -->
            <div id="factura-form" class="invoice-form">
                <h2>Crear Nueva Factura</h2>
                <form action="procesar_factura.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="factura-numero">Número de Factura:</label></td>
                            <td><input type="text" id="factura-numero" name="numero" readonly value="FAC-<%= new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()) %>"></td>
                        </tr>
                        <tr>
                            <td><label for="factura-fecha">Fecha:</label></td>
                            <td><input type="date" id="factura-fecha" name="fecha" required></td>
                        </tr>
                        <tr>
                            <td><label for="factura-cliente">Cliente:</label></td>
                            <td>
                                <select id="factura-cliente" name="cliente" required>
                                    <option value="">Seleccione cliente</option>
                                    <option value="1">Cliente 1</option>
                                    <option value="2">Cliente 2</option>
                                    <option value="3">Cliente 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="factura-vendedor">Vendedor:</label></td>
                            <td><input type="text" id="factura-vendedor" name="vendedor" required></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="invoice-items">
                                    <h3>Items de la Factura</h3>
                                    <table id="invoice-items-table">
                                        <thead>
                                            <tr>
                                                <th>Producto</th>
                                                <th>Cantidad</th>
                                                <th>Precio Unitario</th>
                                                <th>Descuento (%)</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="text" name="producto[]" required></td>
                                                <td><input type="number" name="cantidad[]" min="1" value="1" required></td>
                                                <td><input type="number" name="precio[]" min="0" step="0.01" required></td>
                                                <td><input type="number" name="descuento[]" min="0" max="100" value="0"></td>
                                                <td><button type="button" onclick="this.parentNode.parentNode.remove(); calculateTotal()">Eliminar</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button type="button" class="add-item-btn" onclick="addInvoiceItem()">Agregar Item</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="total-section">
                                    <p>Subtotal: <span id="subtotal">0.00</span></p>
                                    <p>IVA (16%): <span id="iva">0.00</span></p>
                                    <p>Total: <span id="total">0.00</span></p>
                                    <input type="hidden" name="total" id="total-input">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="factura-metodo">Método de Pago:</label></td>
                            <td>
                                <select id="factura-metodo" name="metodo_pago" required>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="tarjeta">Tarjeta</option>
                                    <option value="transferencia">Transferencia</option>
                                    <option value="credito">Crédito</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="factura-comentarios">Comentarios:</label></td>
                            <td><textarea id="factura-comentarios" name="comentarios" rows="3"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit">Generar Factura</button>
                                <button type="button" onclick="window.print()" style="margin-left: 10px;">Imprimir Factura</button>
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

    <script>
        
        function addOrderItem() {
            const table = document.getElementById('orden-items-table');
            const row = table.insertRow(-1);
            
            row.innerHTML = `
                <td><input type="text" name="producto[]" required></td>
                <td><input type="number" name="cantidad[]" min="1" value="1" required></td>
                <td><input type="number" name="precio[]" min="0" step="0.01" required></td>
                <td><span class="subtotal">0.00</span></td>
                <td><button type="button" onclick="this.parentNode.parentNode.remove(); calculateOrderTotal()">Eliminar</button></td>
            `;
            
            
            row.querySelector('input[name="cantidad[]"]').addEventListener('input', calculateItemSubtotal);
            row.querySelector('input[name="precio[]"]').addEventListener('input', calculateItemSubtotal);
            
            calculateOrderTotal();
        }

        
        function calculateItemSubtotal() {
            const row = this.parentNode.parentNode;
            const cantidad = parseFloat(row.querySelector('input[name="cantidad[]"]').value) || 0;
            const precio = parseFloat(row.querySelector('input[name="precio[]"]').value) || 0;
            const subtotal = cantidad * precio;
            
            row.querySelector('.subtotal').textContent = subtotal.toFixed(2);
            calculateOrderTotal();
        }

        
        function calculateOrderTotal() {
            const rows = document.querySelectorAll('#orden-items-table tr');
            let total = 0;
            
            rows.forEach(row => {
                const subtotalText = row.querySelector('.subtotal').textContent;
                total += parseFloat(subtotalText) || 0;
            });
            
            document.getElementById('orden-total').textContent = total.toFixed(2);
            document.getElementById('orden-total-input').value = total.toFixed(2);
        }

        
        document.addEventListener('DOMContentLoaded', function() {
            // Calcular subtotal inicial para el primer item
            const firstQty = document.querySelector('#orden-items-table input[name="cantidad[]"]');
            const firstPrice = document.querySelector('#orden-items-table input[name="precio[]"]');
            
            if(firstQty && firstPrice) {
                firstQty.addEventListener('input', calculateItemSubtotal);
                firstPrice.addEventListener('input', calculateItemSubtotal);
                calculateItemSubtotal.call(firstQty);
            }
            
            
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('orden-fecha').value = today;
            document.getElementById('factura-fecha').value = today;
            
            
            const deliveryDate = new Date();
            deliveryDate.setDate(deliveryDate.getDate() + 7);
            document.getElementById('orden-entrega').value = deliveryDate.toISOString().split('T')[0];
        });
    </script>
</body>
</html>