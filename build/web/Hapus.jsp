<%-- 
    Document   : Hapus
    Created on : 14/03/2020, 11:50:01 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%! 
    Connection connection;
    PreparedStatement prepare;
    Integer idsiswahapus;
%>

<% 
    if(request.getParameter("idhapus")!=null && request.getParameter("idhapus")!=""){
    idsiswahapus=Integer.parseInt(request.getParameter("idhapus"));
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentregistjsp","root","");
        prepare=connection.prepareStatement("delete from siswa where id=?");
        prepare.setInt(1,idsiswahapus);
        prepare.executeUpdate();
        response.sendRedirect("./index.jsp");
    }catch(ClassNotFoundException c){
        out.println("Class Tidak Ditemukan "+c.getMessage());
    }catch(Exception e){
        out.println("Error "+e.getMessage());
    }
    }
    
%>