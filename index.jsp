<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.Mascotas" %>
<%@page import="Servlet.GestionarMascotas" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Centro de Adopciones - Mascotas</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Montserrat:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  --primary: #ff4d6d;
  --secondary: #fff5f7;
  --dark: #2b2b2b;
  --radius: 18px;
}

/* BASE */
body {
  margin: 0;
  font-family: "Poppins", sans-serif;
  background-color: var(--secondary);
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
  z-index: 100;
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

/* HERO SECTION */
.hero {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: var(--primary);
  color: #fff;
  padding: 120px 8% 100px;
  margin-top: 70px;
  position: relative;
  overflow: hidden;
}
.hero::before {
  content: "";
  position: absolute;
  top: -120px;
  left: -150px;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, #fff 0%, transparent 70%);
  opacity: 0.15;
  border-radius: 50%;
}
.hero-text {
  max-width: 550px;
  z-index: 2;
}
.hero-text h1 {
  font-family: "Montserrat", sans-serif;
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 15px;
}
.hero-text p {
  font-size: 1.1rem;
  margin-bottom: 25px;
}
.hero-buttons a {
  background-color: #fff;
  color: var(--primary);
  padding: 12px 25px;
  border-radius: 30px;
  font-weight: 600;
  margin-right: 10px;
  text-decoration: none;
  transition: 0.3s;
}
.hero-buttons a:hover {
  background-color: #ffd6de;
}
.hero-img {
  z-index: 2;
}
.hero-img img {
  width: 400px;
  border-radius: 20px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

/* SECCIÓN DE CARDS */
.container {
  position: relative;
  max-width: 1300px;
  margin: -60px auto 80px;
  background: #fff;
  border-radius: 24px;
  box-shadow: 0 8px 30px rgba(0,0,0,0.1);
  padding: 60px;
  z-index: 2;
}

h2 {
  text-align: center;
  color: var(--primary);
  font-family: "Montserrat", sans-serif;
  font-size: 2rem;
  margin-bottom: 30px;
}

/* MENSAJES */
.mensaje-exito, .mensaje-error {
  padding: 12px 18px;
  border-radius: var(--radius);
  font-weight: 500;
  text-align: center;
  margin-bottom: 20px;
}
.mensaje-exito {
  background-color: #d1f7d6;
  color: #256f38;
}
.mensaje-error {
  background-color: #ffd6d9;
  color: #991b1b;
}

/* BOTONES SUPERIORES */
.botones-accion {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin-bottom: 40px;
}
.btn {
  padding: 10px 22px;
  border-radius: 25px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.3s ease;
}
.btn-agregar {
  background: linear-gradient(135deg, #ff4d6d, #ff758f);
  color: #fff;
}
.btn-buscar {
  background: #fff;
  border: 2px solid var(--primary);
  color: var(--primary);
}
.btn:hover {
  transform: scale(1.05);
  box-shadow: 0 4px 10px rgba(255, 77, 109, 0.3);
}

/* GRID DE MASCOTAS */
.mascotas-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 25px;
}
.card {
  background-color: #fff;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 15px rgba(0,0,0,0.08);
  transition: 0.3s;
}
.card:hover {
  transform: translateY(-6px);
  box-shadow: 0 6px 20px rgba(0,0,0,0.15);
}
.card img {
  width: 100%;
  height: 220px;
  object-fit: cover;
}
.card-info {
  padding: 18px;
}
.card-info h3 {
  margin: 0 0 10px;
  color: var(--primary);
  font-family: "Montserrat", sans-serif;
}
.card-info p {
  margin: 6px 0;
  font-size: 0.9rem;
  color: #555;
}
.card-info i {
  color: var(--primary);
  margin-right: 6px;
}
.card-buttons {
  display: flex;
  justify-content: space-between;
  padding: 0 18px 18px;
}
.card-buttons a {
  text-decoration: none;
  padding: 8px 14px;
  border-radius: 20px;
  color: #fff;
  font-size: 0.9rem;
  transition: 0.3s;
}
.btn-editar { background-color: #3ba55c; }
.btn-eliminar { background-color: #ff4d6d; }
.btn-editar:hover { background-color: #46c06d; }
.btn-eliminar:hover { background-color: #ff6b81; }

/* FOOTER */
footer {
  text-align: center;
  color: #777;
  padding: 25px 0;
  font-size: 0.9rem;
  background-color: #fff;
  box-shadow: 0 -4px 15px rgba(0,0,0,0.05);
}

@media (max-width: 900px) {
  .hero { flex-direction: column; text-align: center; padding: 100px 5% 80px; }
  .hero-img img { width: 320px; margin-top: 30px; }
}
</style>
</head>

<body>

<!-- 🔸 NAVBAR -->
<header>
  <nav>
    <div class="logo"><i class="fa-solid fa-paw"></i> PetAdopt</div>
    <ul>
      <li><a href="#" class="active">Inicio</a></li>
      <li><a href="#mascotas">Mascotas</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
    <div class="actions">
      <a href="#" class="login">Iniciar sesión</a>
      <a href="#" class="signup">Registrarse</a>
    </div>
  </nav>
</header>

<!-- 🔸 HERO -->
<section class="hero">
  <div class="hero-text">
    <h1>Adopta un amigo fiel hoy</h1>
    <p>Bríndale una segunda oportunidad a quien más lo necesita. Encuentra tu compañero ideal entre nuestras mascotas disponibles.</p>
    <div class="hero-buttons">
      <a href="#mascotas">Ver Mascotas</a>
      <a href="agregarMascota.jsp">Agregar Nueva</a>
    </div>
  </div>
  <div class="hero-img">
    <img src="https://cdn.pixabay.com/photo/2019/02/21/15/06/woman-4011419_1280.jpg" alt="Adopta tu mascota">
  </div>
</section>

<!-- 🔸 CARDS DE MASCOTAS -->
<div class="container" id="mascotas">
  <h2><i class="fa-solid fa-paw"></i> Mascotas Disponibles</h2>

  <% if (request.getParameter("mensaje") != null) { %>
    <div class="mensaje-exito">
      <% if (request.getParameter("mensaje").equals("eliminado")) { %>
        Mascota eliminada exitosamente.
      <% } else if (request.getParameter("mensaje").equals("actualizado")) { %>
        Mascota actualizada exitosamente.
      <% } %>
    </div>
  <% } %>

  <% if (request.getParameter("error") != null) { %>
    <div class="mensaje-error">
      <% if (request.getParameter("error").equals("noencontrado")) { %>
        Mascota no encontrada.
      <% } else if (request.getParameter("error").equals("idinvalido")) { %>
        ID inválido.
      <% } else if (request.getParameter("error").equals("eliminar")) { %>
        Error al eliminar mascota.
      <% } else if (request.getParameter("error").equals("actualizar")) { %>
        Error al actualizar mascota.
      <% } %>
    </div>
  <% } %>

  <div class="botones-accion">
    <a href="agregarMascota.jsp" class="btn btn-agregar"><i class="fa-solid fa-plus"></i> Agregar Mascota</a>
    <a href="buscarMascota.jsp" class="btn btn-buscar"><i class="fa-solid fa-magnifying-glass"></i> Buscar Mascota</a>
  </div>

  <div class="mascotas-grid">
    <%
      List<Mascotas> mascotas = (List<Mascotas>) request.getAttribute("mascotas");
      if (mascotas == null) mascotas = GestionarMascotas.obtenerTodasLasMascotas();

      if (mascotas != null && !mascotas.isEmpty()) {
          for (Mascotas mascota : mascotas) {
    %>
    <div class="card">
      <% if (mascota.getFoto() != null && !mascota.getFoto().isEmpty()) { %>
        <img src="<%= mascota.getFoto() %>" alt="<%= mascota.getNombre() %>">
      <% } else { %>
        <img src="https://cdn.pixabay.com/photo/2016/02/19/10/00/dog-1209621_1280.jpg" alt="Sin foto">
      <% } %>
      <div class="card-info">
        <h3><%= mascota.getNombre() %></h3>
        <p><i class="fa-solid fa-dog"></i> Raza: <%= mascota.getRaza() %></p>
        <p><i class="fa-solid fa-calendar"></i> Edad: <%= mascota.getEdad() %> años</p>
        <p><i class="fa-solid fa-paw"></i> Tipo: <%= mascota.getTipo() %></p>
      </div>
      <div class="card-buttons">
        <a href="editarMascota.jsp?id=<%= mascota.getId() %>" class="btn-editar"><i class="fa-solid fa-pen"></i> Editar</a>
        <a href="EliminarMascotaServlet?id=<%= mascota.getId() %>" class="btn-eliminar"
           onclick="return confirm('¿Está seguro de eliminar esta mascota?')"><i class="fa-solid fa-trash"></i> Eliminar</a>
      </div>
    </div>
    <%
          }
      } else {
    %>
    <p style="text-align:center; color:#777;">No hay mascotas registradas</p>
    <% } %>
  </div>
</div>

<footer>© 2025 Centro de Adopciones | Todos los derechos reservados</footer>

</body>
</html>
