<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ingresar.jsp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            background-color: #a9a9a9;
        }

        .background-logo {
            background-image: url(imagenes/logo.jpg);
            background-size: cover;
            background-position: center;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0.9;
        }

        .content {
            z-index: 1;
            width: 100%;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 120px 20px 20px;
        }

        .container {
            width: 100%;
            max-width: 500px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: rgba(34, 139, 34, 1);
            margin: 10px 0;
            border-radius: 10px;
        }

        .spacer {
            height: 10px;
        }

        
        #container1 {
            width: 100%;
            height: 110px; 
            background-color: rgba(34, 139, 34, 1);
            display: flex;
            align-items: center;
            justify-content: center; 
            position: fixed;
            top: 0;
            left: 0;
            padding: 0 20px;
            z-index: 10;
        }

        #container1 h1 {
            color: black;
            font-weight: bold;
            font-size: 50px; 
            text-align: center;
            width: 100%; 
            margin: 0;
        }

        #container1 img {
            height: 90px; 
            width: auto;
            margin-left: 20px; 
        }

        #container2 {
            background-color: rgba(34, 139, 34, 1);
            color: black;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        #container3 {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: transparent;
            width: 100%;
            max-width: 400px;
            color: white;
            font-weight: bold;
        }

        #container3 label {
            display: block;
            margin: 5px 0;
            color: black;
            width: 100%;
        }

        #container3 input[type="text"],
        #container3 input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid rgba(34, 139, 34, 1);
            border-radius: 5px;
            font-weight: bold;
        }

        .centered-button {
            width: 100%;
            color: black;
            font-weight: bold;
            background-color: rgba(34, 139, 34, 1);
            border: 2px solid #000;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 15px 0;
        }

        .centered-button:hover {
            transform: translateY(-3px);
            background-color: #1e7d1e;
        }

        #piepagina {
            margin-top: 20px;
            text-align: center;
            width: 100%;
        }

        #piepagina a {
            color: red;
            font-weight: bold;
            text-decoration: none;
        }

        footer {
            margin-top: 10px;
            color: black;
            font-weight: bold;
        }

        
        @media (max-width: 768px) {
            #container1 {
                height: 100px; 
            }
            
            #container1 h1 {
                font-size: 40px; 
            }
            
            #container1 img {
                height: 70px; 
            }
            
            .content {
                padding-top: 110px; 
            }
            
            .container {
                padding: 15px;
            }
            
            #container3 input[type="text"],
            #container3 input[type="password"] {
                padding: 8px;
            }
            
            .centered-button {
                padding: 10px 15px;
            }
        }

        @media (max-width: 480px) {
            #container1 {
                height: 90px; 
                flex-direction: column; 
                padding: 10px;
            }
            
            #container1 h1 {
                font-size: 30px; 
                margin-top: 5px;
            }
            
            #container1 img {
                height: 60px; 
                margin-left: 0;
            }
            
            .content {
                padding: 100px 10px 10px;
            }
            
            #container2 h2 {
                font-size: 1.2rem;
            }
            
            #container3 label {
                font-size: 0.9rem;
            }
        }
    </style>
</head>

<body>
    <div class="background-logo"></div>
    <div class="content">
        <div id="container1">
            <img src="imagenes/logo2.png" alt="Logo TiendaDelConuco"/>
            <h1>TiendaDelConuco</h1>
        </div>

        <div class="spacer"></div>

        <div id="container2">
            <h2>Ingreso Usuarios</h2>
        </div>

        <div class="spacer"></div>

        <div id="container3">
            <div class="container">
                <form action="inicio.jsp" method="post">
                    <label for="usuario">Usuario:</label>
                    <input type="text" id="usuario" name="usuario" placeholder="Usuario">

                    <label for="clave">Clave:</label>
                    <input type="password" id="clave" name="clave" placeholder="Clave">
                    <br>
                    <button class="centered-button btn-a" name="role" value="Clientes">Ingresar</button>
                </form>
            </div>
        </div>

        <div id="piepagina">
            <a href="">¿Has olvidado tu contraseña?</a>
            <footer>
                <p><b>TiendaDelConuco V1.0</b></p>
            </footer>
        </div>
    </div>
</body>

</html>