<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.Mascotas" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Mascota</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Montserrat:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  --primary: #ff4d6d;
  --primary-light: #ff8fa3;
  --secondary: #fff5f7;
  --dark: #2b2b2b;
  --radius: 14px;
}

/* GENERAL */
body {
  margin: 0;
  font-family: "Poppins", sans-serif;
  background: linear-gradient(180deg, #ffe6eb, #fff5f7);
  color: var(--dark);
  overflow-x: hidden;
}

/* NAVBAR */
header {
  position: fixed;
  top: 0;
  width: 100%;
  background: #fff;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
  z-index: 10;
}
nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 18px 8%;
}
nav .logo {
  font-family: "Montserrat", sans-serif;
  font-size: 1.6rem;
  font-weight: 700;
  color: var(--primary);
}
nav ul {
  list-style: none;
  display: flex;
  gap: 30px;
  margin: 0;
  padding: 0;
}
nav ul li a {
  text-decoration: none;
  color: var(--dark);
  font-weight: 500;
  transition: 0.3s;
}
nav ul li a:hover {
  color: var(--primary);
}
nav .actions a {
  padding: 8px 18px;
  border-radius: 25px;
  border: 2px solid var(--primary);
  color: var(--primary);
  font-weight: 500;
  text-decoration: none;
  margin-left: 10px;
  transition: 0.3s;
}
nav .actions a.signup {
  background-color: var(--primary);
  color: #fff;
}
nav .actions a:hover { transform: scale(1.05); }

/* HERO */
.hero {
  background: linear-gradient(120deg, var(--primary), var(--primary-light));
  color: #fff;
  padding: 120px 8% 90px;
  text-align: center;
  position: relative;
  overflow: hidden;
  margin-top: 70px;
  border-bottom-left-radius: 120px;
  border-bottom-right-radius: 120px;
}
.hero::after {
  content: "";
  position: absolute;
  bottom: -150px;
  left: 50%;
  transform: translateX(-50%);
  width: 900px;
  height: 400px;
  background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
  border-radius: 50%;
}
.hero h1 {
  font-family: "Montserrat", sans-serif;
  font-size: 2.6rem;
  font-weight: 700;
  margin: 0;
}
.hero p {
  font-size: 1.1rem;
  margin-top: 10px;
  opacity: 0.95;
}

/* CONTENEDOR */
.container {
  max-width: 750px;
  margin: -80px auto 80px;
  background: #fff;
  border-radius: 25px;
  box-shadow: 0 8px 25px rgba(0,0,0,0.1);
  padding: 50px;
  text-align: center;
  position: relative;
  z-index: 2;
}
.container h2 {
  font-family: "Montserrat", sans-serif;
  color: var(--primary);
  margin-bottom: 25px;
  font-size: 1.9rem;
}

/* FORMULARIO */
.form-group {
  text-align: left;
}
label {
  display: block;
  font-weight: 500;
  margin-bottom: 6px;
  color: #444;
}
input[type="text"] {
  width: 100%;
  padding: 12px 15px;
  border-radius: 10px;
  border: 1.5px solid #e2e2e2;
  background-color: #fafafa;
  font-size: 0.95rem;
  transition: all 0.3s ease;
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.04);
}
input:focus {
  outline: none;
  border-color: var(--primary);
  box-shadow: 0 0 8px rgba(255, 77, 109, 0.3);
  background-color: #fff;
}
.form-text {
  font-size: 0.8rem;
  color: #777;
  margin-top: 4px;
}

/* BOTONES */
.form-actions {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-top: 25px;
}
.btn {
  padding: 12px 28px;
  border-radius: 25px;
  font-weight: 600;
  text-decoration: none;
  border: none;
  cursor: pointer;
  transition: 0.3s;
}
.btn-primary {
  background: linear-gradient(135deg, #ff4d6d, #ff758f);
  color: #fff;
}
.btn-secondary {
  background-color: #fff;
  border: 2px solid var(--primary);
  color: var(--primary);
}
.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(255, 77, 109, 0.3);
}

/* RESULTADO */
.resultado {
  margin-top: 40px;
  text-align: left;
}
.resultado .card {
  border-radius: 15px;
  box-shadow: 0 6px 20px rgba(0,0,0,0.08);
  overflow: hidden;
}
.resultado img {
  border-radius: 10px;
  width: 100%;
  height: 230px;
  object-fit: cover;
}
.resultado h5 {
  color: var(--primary);
  font-weight: 600;
}
.alert {
  border-radius: 12px;
}

/* RESPONSIVE */
@media (max-width: 700px) {
  .container { padding: 30px 25px; }
  .hero h1 { font-size: 2rem; }
}
</style>
</head>

<body>

<!-- 🔸 NAVBAR -->
<header>
  <nav>
    <div class="logo"><i class="fa-solid fa-paw"></i> PetAdopt</div>
    <ul>
      <li><a href="listaMascotas.jsp">Inicio</a></li>
      <li><a href="#">Mascotas</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
    <div class="actions">
      <a href="#" class="login">Login</a>
      <a href="#" class="signup">Sign Up</a>
    </div>
  </nav>
</header>

<!-- 🔸 HERO -->
<section class="hero">
  <h1><i class="fa-solid fa-magnifying-glass"></i> Busca a tu Mascota</h1>
  <p>Encuentra rápidamente a tu amigo peludo por su nombre o ID 🐕</p>
</section>

<!-- 🔸 CONTENIDO -->
<div class="container">
  <h2><i class="fa-solid fa-paw"></i> Buscar Mascota</h2>

  <form action="BuscarMascotaServlet" method="POST">
    <div class="form-group">
      <label for="criterio">Buscar por ID o Nombre</label>
      <input type="text" id="criterio" name="criterio" placeholder="Ingrese ID o nombre de la mascota" required>
      <div class="form-text">Puede buscar por ID (número) o por nombre</div>
    </div>

    <div class="form-actions">
      <a href="listaMascotas.jsp" class="btn btn-secondary">Volver</a>
      <button type="submit" class="btn btn-primary">Buscar</button>
    </div>
  </form>

  <!-- RESULTADOS -->
  <%
    Mascotas mascotaEncontrada = (Mascotas) request.getAttribute("mascotaEncontrada");
    String criterio = (String) request.getAttribute("criterio");

    if (criterio != null && !criterio.trim().isEmpty()) {
      if (mascotaEncontrada != null) {
  %>
  <div class="resultado">
    <h4>Resultado de la búsqueda:</h4>
    <div class="card mt-3">
      <div class="card-body row">
        <div class="col-md-4">
          <% if (mascotaEncontrada.getFoto() != null && !mascotaEncontrada.getFoto().isEmpty()) { %>
            <img src="<%= mascotaEncontrada.getFoto() %>" alt="Foto de <%= mascotaEncontrada.getNombre() %>">
          <% } else { %>
            <div class="bg-light d-flex align-items-center justify-content-center rounded" style="height:230px;">
              <i class="fa-solid fa-image text-muted fs-1"></i>
            </div>
          <% } %>
        </div>
        <div class="col-md-8">
          <h5><i class="fa-solid fa-paw"></i> <%= mascotaEncontrada.getNombre() %></h5>
          <p><strong>ID:</strong> <%= mascotaEncontrada.getId() %></p>
          <p><strong>Raza:</strong> <%= mascotaEncontrada.getRaza() %></p>
          <p><strong>Edad:</strong> <%= mascotaEncontrada.getEdad() %></p>
          <p><strong>Tipo:</strong> <%= mascotaEncontrada.getTipo() %></p>

          <div class="mt-3 d-flex gap-2">
            <a href="editarMascota.jsp?id=<%= mascotaEncontrada.getId() %>" class="btn btn-secondary">
              <i class="fa-solid fa-pen"></i> Editar
            </a>
            <a href="EliminarMascotaServlet?id=<%= mascotaEncontrada.getId() %>" 
               class="btn btn-primary" 
               style="background-color:#ff4d6d;"
               onclick="return confirm('¿Está seguro de eliminar esta mascota?')">
               <i class="fa-solid fa-trash"></i> Eliminar
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%
      } else {
  %>
  <div class="alert alert-warning mt-4">
    No se encontró ninguna mascota con el criterio: "<%= criterio %>"
  </div>
  <%
      }
    }
  %>
</div>

</body>
</html>
