<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de Inicio de Sesión - TiendaDelConucoS.A</title>
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
                justify-content: center;
                align-items: center;
                background-image: url(imagenes/logo.jpg);
                background-size: 90% auto;
                background-repeat: no-repeat;
                background-position: center bottom;
                background-attachment: local;
            }

            #main-content::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(255, 255, 255, 0.7);
                z-index: -1;
            }

            #login-container {
                width: 400px;
                background-color: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border: 2px solid rgba(34, 139, 34, 0.5);
            }

            #login-container h1 {
                color: rgba(34, 139, 34, 1);
                text-align: center;
                margin-top: 0;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
            }

            .form-group input:focus {
                outline: none;
                border-color: rgba(34, 139, 34, 0.7);
                box-shadow: 0 0 5px rgba(34, 139, 34, 0.5);
            }

            #submit-btn {
                width: 100%;
                padding: 12px;
                background-color: rgba(34, 139, 34, 1);
                color: black;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            #submit-btn:hover {
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(34, 139, 34, 0.7);
            }

            .error-bg {
                background-color: rgba(255, 200, 200, 0.3);
                border: 1px solid #ff6b6b;
                padding: 15px;
                border-radius: 5px;
            }

            .error {
                color: #d63031;
                background-color: #ffebee;
                padding: 10px;
                border-radius: 5px;
                border-left: 4px solid #d63031;
                margin-top: 15px;
                font-weight: bold;
                text-align: center;
            }

            .support-contact {
                font-style: italic;
                margin-top: 20px;
                font-size: 14px;
                text-align: center;
                color: #555;
            }
            
            #validation-message {
                color: #d63031;
                background-color: #ffebee;
                padding: 10px;
                border-radius: 5px;
                border-left: 4px solid #d63031;
                margin-top: 15px;
                font-weight: bold;
                text-align: center;
                display: none;
            }
        </style>
    </head>
    <body>
        <div id="header">
            <img src="imagenes/logo2.png" alt="" />
            <h1>TiendaDelConucoS.A</h1>
        </div>

        <div id="main-content">
            <div id="login-container" class="<%=request.getAttribute("errorExists")!= null ? "error-bg" : ""%>">
                <h1>Inicio de Sesión</h1>
                <form action="inicio.jsp" method="post" autocomplete="off" novalidate id="login-form">
                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="clave">Clave:</label>
                        <input type="password" id="clave" name="clave" placeholder="Ingrese su contraseña" required>
                    </div>
                    
                    <button type="submit" id="submit-btn">Ingresar</button>
                    
                    <div id="validation-message">Por favor, ingrese todos los datos requeridos.</div>
                    
                    <% String error = (String)request.getAttribute("error");
                    if (error != null){ %>
                        <p class="error"><%=error%></p>
                    <% } %>
                    
                    <div class="support-contact">
                        Para soporte técnico, contacte a: <br>
                        <strong>ArgüelloCodeSolution@gmail.com</strong>
                    </div>
                </form>
            </div>
        </div>
        
        <script>
            document.getElementById('login-form').addEventListener('submit', function(event) {
                var usuario = document.getElementById('usuario').value;
                var clave = document.getElementById('clave').value;
                var validationMessage = document.getElementById('validation-message');
                
                if (usuario.trim() === '' || clave.trim() === '') {
                    event.preventDefault(); // Evita que el formulario se envíe
                    validationMessage.style.display = 'block';
                    
                    // Ocultar el mensaje después de 3 segundos
                    setTimeout(function() {
                        validationMessage.style.display = 'none';
                    }, 3000);
                }
            });
        </script>
    </body>
</html>