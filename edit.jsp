<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.Mascotas" %>
<%@page import="Servlet.GestionarMascotas" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Editar Mascota</title>
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

/* HERO HEADER */
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
  margin-bottom: 30px;
  font-size: 1.9rem;
}

/* FORMULARIO */
.form-row {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}
.form-group {
  flex: 1;
  text-align: left;
}
label {
  display: block;
  font-weight: 500;
  margin-bottom: 6px;
  color: #444;
}
input[type="text"], select, input[type="file"] {
  width: 100%;
  padding: 12px 15px;
  border-radius: 10px;
  border: 1.5px solid #e2e2e2;
  background-color: #fafafa;
  font-size: 0.95rem;
  transition: all 0.3s ease;
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.04);
}
input:focus, select:focus {
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

/* PREVIEW IMAGEN */
.img-thumbnail {
  border-radius: 10px;
  box-shadow: 0 3px 8px rgba(0,0,0,0.1);
}

/* BOTONES */
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
  border: none;
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

/* ALERT */
.alert {
  border-radius: 12px;
}

/* RESPONSIVE */
@media (max-width: 700px) {
  .form-row { flex-direction: column; }
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
  <h1><i class="fa-solid fa-pen-to-square"></i> Edita los Datos de tu Mascota</h1>
  <p>Actualiza la información y mantén al día el perfil de tu compañero peludo 🐾</p>
</section>

<!-- 🔸 FORMULARIO -->
<div class="container">
  <h2><i class="fa-solid fa-paw"></i> Editar Mascota</h2>

  <%
    Mascotas mascota = null;
    String idParam = request.getParameter("id");
    if (idParam != null) {
      try {
        int id = Integer.parseInt(idParam);
        mascota = GestionarMascotas.buscarMascota(id);
      } catch (NumberFormatException e) {
        // ID inválido
      }
    }
    if (mascota == null) {
  %>
    <div class="alert alert-danger" role="alert">
      Mascota no encontrada o ID inválido.
    </div>
    <div class="d-grid">
      <a href="listaMascotas.jsp" class="btn btn-secondary">Volver a la lista</a>
    </div>
  <%
    } else {
  %>

  <form action="ActualizarMascotaServlet" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= mascota.getId() %>">

    <div class="form-row">
      <div class="form-group">
        <label for="nombre">Nombre *</label>
        <input type="text" id="nombre" name="nombre" value="<%= mascota.getNombre() %>" required>
      </div>
      <div class="form-group">
        <label for="raza">Raza *</label>
        <input type="text" id="raza" name="raza" value="<%= mascota.getRaza() %>" required>
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="edad">Edad *</label>
        <input type="text" id="edad" name="edad" value="<%= mascota.getEdad() %>" required>
      </div>
      <div class="form-group">
        <label for="tipo">Tipo *</label>
        <select id="tipo" name="tipo" required>
          <option value="">Seleccione un tipo</option>
          <option value="Perro" <%= mascota.getTipo().equals("Perro") ? "selected" : "" %>>Perro</option>
          <option value="Gato" <%= mascota.getTipo().equals("Gato") ? "selected" : "" %>>Gato</option>
          <option value="Conejo" <%= mascota.getTipo().equals("Conejo") ? "selected" : "" %>>Conejo</option>
          <option value="Hamster" <%= mascota.getTipo().equals("Hamster") ? "selected" : "" %>>Hamster</option>
          <option value="Pájaro" <%= mascota.getTipo().equals("Pájaro") ? "selected" : "" %>>Pájaro</option>
          <option value="Otro" <%= mascota.getTipo().equals("Otro") ? "selected" : "" %>>Otro</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label for="foto">Foto de la mascota</label>
      <input type="file" id="foto" name="foto" accept="image/*">
      <div class="form-text">Formatos permitidos: JPG, PNG, GIF. Tamaño máximo: 5MB</div>

      <% if (mascota.getFoto() != null && !mascota.getFoto().isEmpty()) { %>
        <div class="mt-3">
          <label class="form-label">Foto actual:</label>
          <div>
            <img src="<%= mascota.getFoto() %>" alt="Foto de <%= mascota.getNombre() %>" class="img-thumbnail" style="width: 150px; height: 150px; object-fit: cover;">
          </div>
        </div>
        <input type="hidden" name="foto_actual" value="<%= mascota.getFoto() %>">
      <% } %>
    </div>

    <div class="form-actions" style="margin-top:25px; display:flex; justify-content:center; gap:20px;">
      <a href="listaMascotas.jsp" class="btn btn-secondary">Cancelar</a>
      <button type="submit" class="btn btn-primary">Actualizar Mascota</button>
    </div>
  </form>

  <% } %>
</div>

</body>
</html>
