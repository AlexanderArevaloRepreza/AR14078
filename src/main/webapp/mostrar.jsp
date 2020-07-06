<%-- 
    Document   : mostrar.jsp
    Created on : 07-04-2020, 05:39:27 PM
    Author     : Omar
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.progra2.AR14078.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ar14078.UsuarioJpaController"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    UsuarioJpaController controler = new UsuarioJpaController(emf);

    List<Usuario> lista = new ArrayList<Usuario>();

    lista = controler.findUsuarioEntities();
    
    
    

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">   
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Usuarios Registrados</h1>
        <br>
        <br>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">Delete</th>
                </tr>
            </thead>
            <tbody>
                 <% 
                    for (Usuario us : lista){
                     
                 %>   
                <tr>
                    <th scope = "row"> <%= us.getId()%> </th>
                    <td> <%= us.getNombre()%> </td>
                    <td> <%= us.getCorreo()%> </td>
                    <td> <%= us.getContrasenia()%></td>
                    <td><a href="/AR14078/ServletEliminar?id=<%=us.getId()%>"><buton class="btn btn-danger eliminar">Eliminar</button></a></td>
                </tr>
                <%
                   
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
