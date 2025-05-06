<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - TiendaDelConucoS.A</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.css">
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

        #sidebar button:nth-child(6) {
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

        .report-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .report-buttons button {
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

        .report-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 1200px;
            margin: 20px auto;
            display: none;
        }

        .report-container h2 {
            color: #228B22;
            text-align: center;
            margin-bottom: 20px;
        }

        .filters {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .filter-group input,
        .filter-group select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .report-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .report-table th, .report-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .report-table th {
            background-color: #228B22;
            color: white;
        }

        .report-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .chart-container {
            position: relative;
            height: 400px;
            margin: 20px 0;
        }

        .summary-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px 0;
        }

        .summary-card {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            min-width: 200px;
            text-align: center;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }

        .summary-card h3 {
            color: #228B22;
            margin-top: 0;
        }

        .summary-card .value {
            font-size: 24px;
            font-weight: bold;
        }

        .export-options {
            text-align: center;
            margin-top: 20px;
        }

        .export-options button {
            background-color: #228B22;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
        }

        .active-report {
            display: block;
        }
    </style>
</head>

<body>
    <div id="header">
        <img src="imagenes/logo2.png" alt="" />
        <h1>Reportes</h1>
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
            <div class="report-buttons">
                <button type="button" onclick="showReport('ventas-report')">Ventas Diarias</button>
                <button type="button" onclick="showReport('inventario-report')">Inventario</button>
                <button type="button" onclick="showReport('clientes-report')">Clientes</button>
                <button type="button" onclick="showReport('impuestos-report')">Impuestos</button>
                <button type="button" onclick="showReport('compras-report')">Compras</button>
            </div>

            <div id="ventas-report" class="report-container">
                <h2>Reporte de Ventas Diarias</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label for="ventas-fecha-inicio">Fecha Inicio:</label>
                        <input type="date" id="ventas-fecha-inicio">
                    </div>
                    <div class="filter-group">
                        <label for="ventas-fecha-fin">Fecha Fin:</label>
                        <input type="date" id="ventas-fecha-fin">
                    </div>
                    <div class="filter-group">
                        <label for="ventas-vendedor">Vendedor:</label>
                        <select id="ventas-vendedor">
                            <option value="">Todos</option>
                            <option value="1">Juan Pérez</option>
                            <option value="2">María Gómez</option>
                        </select>
                    </div>
                    <button type="button" onclick="generarReporteVentas()">Generar Reporte</button>
                </div>
                
                <div class="summary-cards">
                    <div class="summary-card">
                        <h3>Ventas Totales</h3>
                        <div class="value" id="ventas-total">$0.00</div>
                    </div>
                    <div class="summary-card">
                        <h3>N° de Transacciones</h3>
                        <div class="value" id="ventas-transacciones">0</div>
                    </div>
                    <div class="summary-card">
                        <h3>Promedio por Venta</h3>
                        <div class="value" id="ventas-promedio">$0.00</div>
                    </div>
                </div>
                
                <div class="chart-container">
                    <canvas id="ventas-chart"></canvas>
                </div>
                
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>N° Factura</th>
                            <th>Cliente</th>
                            <th>Vendedor</th>
                            <th>Subtotal</th>
                            <th>Impuestos</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody id="ventas-table-body">
                    </tbody>
                </table>
                
                <div class="export-options">
                    <button type="button" onclick="exportToPDF('ventas')"><i class="fas fa-file-pdf"></i> Exportar a PDF</button>
                    <button type="button" onclick="exportToExcel('ventas')"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                    <button type="button" onclick="window.print()"><i class="fas fa-print"></i> Imprimir</button>
                </div>
            </div>

            <div id="inventario-report" class="report-container">
                <h2>Reporte de Inventario</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label for="inventario-categoria">Categoría:</label>
                        <select id="inventario-categoria">
                            <option value="">Todas</option>
                            <option value="viveres">Víveres</option>
                            <option value="granos">Granos</option>
                            <option value="lacteos">Lácteos</option>
                            <option value="aseo">Aseo</option>
                            <option value="licores">Licores</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="inventario-stock">Stock:</label>
                        <select id="inventario-stock">
                            <option value="">Todos</option>
                            <option value="bajo">Bajo (menos de 10)</option>
                            <option value="medio">Medio (10-50)</option>
                            <option value="alto">Alto (más de 50)</option>
                        </select>
                    </div>
                    <button type="button" onclick="generarReporteInventario()">Generar Reporte</button>
                </div>
                
                <div class="chart-container">
                    <canvas id="inventario-chart"></canvas>
                </div>
                
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Producto</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Valor Total</th>
                        </tr>
                    </thead>
                    <tbody id="inventario-table-body">
                    </tbody>
                </table>
                
                <div class="export-options">
                    <button type="button" onclick="exportToPDF('inventario')"><i class="fas fa-file-pdf"></i> Exportar a PDF</button>
                    <button type="button" onclick="exportToExcel('inventario')"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                </div>
            </div>

            <!-- Reporte de Clientes -->
            <div id="clientes-report" class="report-container">
                <h2>Reporte de Clientes</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label for="clientes-tipo">Tipo de Cliente:</label>
                        <select id="clientes-tipo">
                            <option value="">Todos</option>
                            <option value="regular">Regular</option>
                            <option value="frecuente">Frecuente</option>
                            <option value="especial">Especial</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="clientes-ubicacion">Ubicación:</label>
                        <select id="clientes-ubicacion">
                            <option value="">Todas</option>
                            <option value="local">Local</option>
                            <option value="foraneo">Foráneo</option>
                        </select>
                    </div>
                    <button type="button" onclick="generarReporteClientes()">Generar Reporte</button>
                </div>
                
                <div class="summary-cards">
                    <div class="summary-card">
                        <h3>Total Clientes</h3>
                        <div class="value" id="clientes-total">0</div>
                    </div>
                    <div class="summary-card">
                        <h3>Clientes Nuevos</h3>
                        <div class="value" id="clientes-nuevos">0</div>
                    </div>
                    <div class="summary-card">
                        <h3>Deuda Total</h3>
                        <div class="value" id="clientes-deuda">$0.00</div>
                    </div>
                </div>
                
                <div class="chart-container">
                    <canvas id="clientes-chart"></canvas>
                </div>
                
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Teléfono</th>
                            <th>Última Compra</th>
                            <th>Total Compras</th>
                            <th>Deuda Actual</th>
                        </tr>
                    </thead>
                    <tbody id="clientes-table-body">
                    </tbody>
                </table>
                
                <div class="export-options">
                    <button type="button" onclick="exportToPDF('clientes')"><i class="fas fa-file-pdf"></i> Exportar a PDF</button>
                    <button type="button" onclick="exportToExcel('clientes')"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                </div>
            </div>

            <div id="impuestos-report" class="report-container">
                <h2>Reporte de Impuestos</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label for="impuestos-anio">Año:</label>
                        <select id="impuestos-anio">
                            <option value="2023">2023</option>
                            <option value="2022">2022</option>
                            <option value="2021">2021</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="impuestos-trimestre">Trimestre:</label>
                        <select id="impuestos-trimestre">
                            <option value="0">Anual</option>
                            <option value="1">1° Trimestre</option>
                            <option value="2">2° Trimestre</option>
                            <option value="3">3° Trimestre</option>
                            <option value="4">4° Trimestre</option>
                        </select>
                    </div>
                    <button type="button" onclick="generarReporteImpuestos()">Generar Reporte</button>
                </div>
                
                <div class="summary-cards">
                    <div class="summary-card">
                        <h3>IVA Cobrado</h3>
                        <div class="value" id="impuestos-iva">$0.00</div>
                    </div>
                    <div class="summary-card">
                        <h3>Retenciones</h3>
                        <div class="value" id="impuestos-retenciones">$0.00</div>
                    </div>
                    <div class="summary-card">
                        <h3>Total a Pagar</h3>
                        <div class="value" id="impuestos-total">$0.00</div>
                    </div>
                </div>
                
                <div class="chart-container">
                    <canvas id="impuestos-chart"></canvas>
                </div>
                
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Mes</th>
                            <th>Ventas Totales</th>
                            <th>IVA Cobrado</th>
                            <th>IVA Pagado</th>
                            <th>Retenciones</th>
                            <th>Saldo</th>
                        </tr>
                    </thead>
                    <tbody id="impuestos-table-body">
                    </tbody>
                </table>
                
                <div class="export-options">
                    <button type="button" onclick="exportToPDF('impuestos')"><i class="fas fa-file-pdf"></i> Exportar a PDF</button>
                    <button type="button" onclick="exportToExcel('impuestos')"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                </div>
            </div>
             
            <button class="back-button" onclick="goToHome()">
                <i class="fas fa-home"></i> Inicio
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script>
        let ventasChart, inventarioChart, clientesChart, impuestosChart;
        
        function goToHome() {
            window.location.href = "inicio.jsp";
        }

        function showReport(reportId) {
            document.querySelectorAll('.report-container').forEach(report => {
                report.classList.remove('active-report');
            });
            
            if(reportId) {
                document.getElementById(reportId).classList.add('active-report');
                
                switch(reportId) {
                    case 'ventas-report':
                        generarReporteVentas();
                        break;
                    case 'inventario-report':
                        generarReporteInventario();
                        break;
                    case 'clientes-report':
                        generarReporteClientes();
                        break;
                    case 'impuestos-report':
                        generarReporteImpuestos();
                        break;
                }
            }
        }

        function generarReporteVentas() {
            const ventasData = {
                total: 12500.75,
                transacciones: 24,
                promedio: 520.86,
                datos: [
                    { fecha: '2023-07-01', factura: 'FAC-001', cliente: 'Juan Pérez', vendedor: 'María Gómez', subtotal: 1200.00, impuestos: 192.00, total: 1392.00 },
                    { fecha: '2023-07-01', factura: 'FAC-002', cliente: 'Carlos Rojas', vendedor: 'Pedro Sánchez', subtotal: 850.50, impuestos: 136.08, total: 986.58 },
                    
                ]
            };
            
            
            document.getElementById('ventas-total').textContent = `$${ventasData.total.toFixed(2)}`;
            document.getElementById('ventas-transacciones').textContent = ventasData.transacciones;
            document.getElementById('ventas-promedio').textContent = `$${ventasData.promedio.toFixed(2)}`;
            
            
            const tbody = document.getElementById('ventas-table-body');
            tbody.innerHTML = '';
            
            ventasData.datos.forEach(venta => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${venta.fecha}</td>
                    <td>${venta.factura}</td>
                    <td>${venta.cliente}</td>
                    <td>${venta.vendedor}</td>
                    <td>$${venta.subtotal.toFixed(2)}</td>
                    <td>$${venta.impuestos.toFixed(2)}</td>
                    <td>$${venta.total.toFixed(2)}</td>
                `;
                tbody.appendChild(row);
            });
            
            
            const ctx = document.getElementById('ventas-chart').getContext('2d');
            
            if(ventasChart) {
                ventasChart.destroy();
            }
            
            ventasChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Ventas Mensuales',
                        data: [12000, 19000, 15000, 18000, 22000, 19500, 12500],
                        backgroundColor: 'rgba(34, 139, 34, 0.7)',
                        borderColor: 'rgba(34, 139, 34, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        
        function generarReporteInventario() {
            
        }

        function generarReporteClientes() {
            
        }

        function generarReporteImpuestos() {
            
        }

        
        function exportToPDF(reportType) {
            alert(`Generando PDF del reporte de ${reportType}`);
        }

        function exportToExcel(reportType) {
            alert(`Exportando a Excel el reporte de ${reportType}`);
        }

        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('ventas-fecha-inicio').value = today;
            document.getElementById('ventas-fecha-fin').value = today;
            
            showReport('ventas-report');
        });
    </script>
</body>
</html>

