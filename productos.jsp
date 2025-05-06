<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos - TiendaDelConucoS.A</title>
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
            background-image: url(imagenes/logo.jpg.);
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

        
        #sidebar button:nth-child(4) {
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

        
        .category-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .category-buttons button {
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

        
        .product-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 20px auto;
            display: none;
        }

        .product-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .product-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .product-form table td {
            padding: 10px;
        }

        .product-form table tr:last-child td {
            text-align: center;
            padding-top: 20px;
        }

        .product-form input[type="text"],
        .product-form input[type="number"],
        .product-form input[type="date"],
        .product-form select,
        .product-form textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .product-form button[type="submit"] {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .product-form button[type="submit"]:hover {
            background-color: #1e7a1e;
        }

        .active-form {
            display: block;
        }

        .products-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .products-table th, .products-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .products-table th {
            background-color: #228B22;
            color: white;
        }

        .products-table tr:nth-child(even) {
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

        .product-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .product-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            width: 200px;
            padding: 15px;
            text-align: center;
        }

        .product-card img {
            max-width: 100%;
            height: 120px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .product-card h3 {
            color: #228B22;
            margin: 10px 0;
        }

        .product-card .price {
            font-weight: bold;
            color: #333;
            font-size: 18px;
        }

        .product-card .stock {
            color: #666;
            font-size: 14px;
        }

        .product-card button {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
    <script>
        function redirectToInicioSesion() {
            window.location.href = "inicio_sesion.jsp";
        }
        
        function goToHome() {
            window.location.href = "inicio.jsp";
        }

        function showCategory(categoryId) {
            document.querySelectorAll('.category-content').forEach(content => {
                content.style.display = 'none';
            });
            
            document.getElementById(categoryId).style.display = 'block';
            
            document.querySelectorAll('.product-form').forEach(form => {
                form.classList.remove('active-form');
            });
        }

        function showForm(formId) {
            document.querySelectorAll('.product-form').forEach(form => {
                form.classList.remove('active-form');
            });
            
            if(formId) {
                document.getElementById(formId).classList.add('active-form');
            }
        }
    </script>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Gestión de Productos</h1>
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
            <!-- Botones de categorías -->
            <div class="category-buttons">
                <button type="button" onclick="showForm('gestion-form')">Gestión de Productos</button>
            </div>

            <!-- Formulario de Gestión de Productos -->
            <div id="gestion-form" class="product-form">
                <h2></h2>
                <form action="procesar_producto.jsp" method="post">
                    <table>
                        <tr>
                            <td width="30%"><label for="producto-id">ID Producto:</label></td>
                            <td><input type="text" id="producto-id" name="id" placeholder="Dejar vacío para nuevo producto"></td>
                        </tr>
                        <tr>
                            <td><label for="producto-nombre">Nombre:</label></td>
                            <td><input type="text" id="producto-nombre" name="nombre" required></td>
                        </tr>
                        <tr>
                            <td><label for="producto-categoria">Categoría:</label></td>
                            <td>
                                <select id="producto-categoria" name="categoria" required>
                                    <option value="">Seleccione categoría</option>
                                    <option value="viveres">Víveres</option>
                                    <option value="granos">Granos</option>
                                    <option value="lacteos">Lácteos</option>
                                    <option value="aseo">Productos de Aseo</option>
                                    <option value="licores">Licores</option>
                                    <option value="papeleria">Papelería</option>
                                    <option value="cosmeticos">Cosméticos</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="producto-precio">Precio:</label></td>
                            <td><input type="number" id="producto-precio" name="precio" min="0" step="0.01" required></td>
                        </tr>
                        <tr>
                            <td><label for="producto-stock">Stock:</label></td>
                            <td><input type="number" id="producto-stock" name="stock" min="0" required></td>
                        </tr>
                        <tr>
                            <td><label for="producto-proveedor">Proveedor:</label></td>
                            <td><input type="text" id="producto-proveedor" name="proveedor"></td>
                        </tr>
                        <tr>
                            <td><label for="producto-descripcion">Descripción:</label></td>
                            <td><textarea id="producto-descripcion" name="descripcion" rows="3"></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="producto-accion">Acción:</label></td>
                            <td>
                                <select id="producto-accion" name="accion" required>
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
             
            <!-- Botón de inicio en la parte inferior derecha -->
            <button class="back-button" onclick="goToHome()">
                <i class="fas fa-home"></i> Inicio
            </button>
        </div>
    </div>

    <script>
        function showFormWithProduct(id, nombre, categoria, precio, stock) {
            document.getElementById('producto-id').value = id;
            document.getElementById('producto-nombre').value = nombre;
            document.getElementById('producto-categoria').value = categoria;
            document.getElementById('producto-precio').value = precio;
            document.getElementById('producto-stock').value = stock;
            document.getElementById('producto-accion').value = 'actualizar';
            
            showForm('gestion-form');
        }

        function exportToExcel() {
            alert("Función de exportar a Excel se ejecutaría aquí");
        }
    </script>
</body>
</html>