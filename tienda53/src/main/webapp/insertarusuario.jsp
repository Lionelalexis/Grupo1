<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tama�o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pesta�a -->
<title>Insertando usuario</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />

</head>


<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i class="fas fa-store"></i>Mi Tienda</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="listausuarios.jsp"><i class="far fa-user-circle"></i> Usuarios</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listaclientes.jsp"><i class="far fa-list-alt"></i> Clientes</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listaproveedores.jsp"><i class="fas fa-industry"></i> Proveedores</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="insertarproducto.jsp"><i class="fas fa-shopping-cart"></i> Productos</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="insertarventa.jsp"><i	class="fas fa-search-dollar"></i> Ventas</a>
  </li>
  <li class="nav-item">
  	<a class="nav-link" href="Reportes.jsp"><i class="far fa-clipboard"></i> Reportes</a>
  </li>
</ul>

	<div style="padding-left: 5px">
		<h1 class="colortitulos">
			<i class="fas fa-plus-circle"></i> Datos del nuevo usuario
		</h1>
		<div class="container">
		
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al crear el usuario, verifique que no exista un usuario con la cedula y usuario dados</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario creado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula</span> <input
						type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="cedula_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Email</span> <input
						type="text" class="form-control"
						placeholder="Inserte email aqui..."
						aria-describedby="basic-addon2" required id="email_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Nombre completo</span>
					<input type="text" class="form-control"
						placeholder="Inserte nonbre aqui..."
						aria-describedby="basic-addon3" required id="nombre_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Username</span> <input
						type="text" class="form-control"
						placeholder="Inserte username aqui..."
						aria-describedby="basic-addon4" required id="user">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Password</span> <input
						type="text" class="form-control"
						placeholder="Inserte password aqui..."
						aria-describedby="basic-addon5" required id="password">
				</div>





			</form>

			<button type="button" class="btn btn-success" onclick="enviar()">
				<i class="fas fa-check"></i> Insertar nuevo usuario
			</button>




			<h1 class="colortitulos">
				<i class="fas fa-cogs"></i> Operaciones
			</h1>
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success"
						onclick="window.location.href='<%=request.getContextPath()%>/insertarusuario.jsp'">
						<i class="fas fa-plus-circle"></i> Agregar usuario
					</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='<%=request.getContextPath()%>/eliminarusuario.jsp'">
						<i class="fas fa-trash"></i> Eliminar usuario
					</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='<%=request.getContextPath()%>/actualizarusuario.jsp'">
						<i class="fas fa-pen-alt"></i> Actualizar usuario
					</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='<%=request.getContextPath()%>/buscarusuario.jsp'">
						<i class="fas fa-search"></i> Buscar un usuario
					</button>
					<button type="button" class="btn btn-primary colorboton"
						onclick="window.location.href='<%=request.getContextPath()%>/listausuarios.jsp'">
						<i class="fas fa-search"></i> Listar todos los usuarios
					</button>
				</div>
			</div>
		</div>

	
	<script>
		function enviar() {
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
			var x = document.getElementById("user").value;
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl + '/listarusuarios', false);
			req.send(null);
			var usuarios=null;
			if (req.status == 200)
				usuarios=JSON.parse(req.responseText);
			  	console.log(JSON.parse(req.responseText));
			  	
			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].usuario);
				console.log(usuarios[i].cedula_usuario);
				
				if (usuarios[i].cedula_usuario ===parseInt(y,10) || usuarios[i].usuario ===x ) {
					console.log(usuarios[i].cedula_usuario +" "+y);
					console.log(usuarios[i].usuario +" "+x);
					coincidencia =true
					break;
				}
				
			
			}
			console.log(coincidencia);	
			
			if (coincidencia==false){
				var formData = new FormData();
	 			formData.append("cedula_usuario", document.getElementById("cedula_usuario").value);
	 			formData.append("email_usuario", document.getElementById("email_usuario").value);
	 			formData.append("nombre_usuario", document.getElementById("nombre_usuario").value);
	 			formData.append("password",document.getElementById("password").value);
	 			formData.append("usuario",document.getElementById("user").value);
	 			var xhr = new XMLHttpRequest();
	 			xhr.open("POST", baseUrl + "/registrarusuario");
	 			
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
	 			xhr.send(formData);

			}else{
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}	
		}
	</script>

</body>
</html>