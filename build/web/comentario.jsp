<!DOCTYPE html>  
<html>  
    <head>  
        <style>  
            div.box{margin:2px;border:1px solid pink;padding:10px;background-color:#e3e3e3}  
        </style>  
    </head>  
    <body>  

        <%@ page import="java.sql.*" %>  
        <%
            String comentario = request.getParameter("comment");
            String email = request.getParameter("email");
            if (comentario == null || email == null || comentario.trim().equals("") || email.trim().equals("")) {
                out.print("<p>Por favor complete os campos<p>");
            } else {

                try {
                    Class.forName("org.postgresql.Driver");
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pfc", "postgres", "postgres"
                            + "");
                    PreparedStatement ps = con.prepareStatement("insert into comentario(comentarios,email) values(?,?)");

                    ps.setString(1, comentario);
                    ps.setString(2, email);
                    int i = ps.executeUpdate();

                    PreparedStatement ps2 = con.prepareStatement("select * from comentario order by id_comentario desc");
                    ResultSet rs = ps2.executeQuery();

                    out.print("<hr/><h2>Comentarios:</h2>");
                    while (rs.next()) {
                        out.print("<div class='box'>");
                        out.print("<p>" + rs.getString(2) + "</p>");
                        out.print("<p><strong>By: " + rs.getString(3) + "</strong></p>");
                        out.print("</div>");
                    }

                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }

            }//end of else  
%>  
    </body>  
</html>  