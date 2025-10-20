

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.Mascotas" %>
<%@page import="Servlet.GestionarMascotas" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Mascotas</title>
        
        <link rel="stylesheet" type="text/css" href="Styles/Styles_1.css">
    </head>
    <body>
        <div class="container">
            <h2>Lista de Mascotas</h2>
            
            <!-- Mensajes de estado -->
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
            
            <!-- Botones de acción -->
            <div class="botones-accion">
                <a href="agregarMascota.jsp" class="btn btn-agregar">Agregar Mascota</a>
                <a href="buscarMascota.jsp" class="btn btn-buscar">Buscar Mascota</a>
            </div>
            
            <!-- Tabla de mascotas -->
            <table class="tabla-mascotas">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Foto</th>
                        <th>Nombre</th>
                        <th>Raza</th>
                        <th>Edad</th>
                        <th>Tipo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Mascotas> mascotas = (List<Mascotas>) request.getAttribute("mascotas");
                        if (mascotas == null) {
                            mascotas = GestionarMascotas.obtenerTodasLasMascotas();
                        }
                        
                        if (mascotas != null && !mascotas.isEmpty()) {
                            for (Mascotas mascota : mascotas) {
                    %>
                    <tr>
                        <td><%= mascota.getId() %></td>
                        <td>
                            <% if (mascota.getFoto() != null && !mascota.getFoto().isEmpty()) { %>
                                <img src="<%= mascota.getFoto() %>" alt="Foto de <%= mascota.getNombre() %>" 
                                     class="foto-mascota">
                            <% } else { %>
                                <div class="sin-foto">Sin foto</div>
                            <% } %>
                        </td>
                        <td><%= mascota.getNombre() %></td>
                        <td><%= mascota.getRaza() %></td>
                        <td><%= mascota.getEdad() %></td>
                        <td><%= mascota.getTipo() %></td>
                        <td>
                            <a href="editarMascota.jsp?id=<%= mascota.getId() %>" 
                               class="btn btn-editar">Editar</a>
                            <a href="EliminarMascotaServlet?id=<%= mascota.getId() %>" 
                               class="btn btn-eliminar"
                               onclick="return confirm('¿Está seguro de que desea eliminar esta mascota?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="sin-datos">No hay mascotas registradas</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
    </body>
</html>
