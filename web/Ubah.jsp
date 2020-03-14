<%-- 
    Document   : Ubah
    Created on : 14/03/2020, 11:43:21 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>

<%! 
    Connection connection;
    ResultSet resultset;
    PreparedStatement prepare;
    
    Integer idubahsiswa;

%>
<%  
    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentregistjsp","root","");
    if(request.getParameter("btnubah")!=null){
        idubahsiswa=Integer.parseInt(request.getParameter("idubah"));
        String nama=request.getParameter("txtnamasiswa");
        String alamat=request.getParameter("txtalamatsiswa");
        String nomor=request.getParameter("txtnomorsiswa");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            prepare=connection.prepareStatement("update siswa set nama=?,alamat=?,telepon=? where id=?");
            prepare.setString(1,nama);
            prepare.setString(2,alamat);
            prepare.setString(3,nomor);
            prepare.setInt(4,idubahsiswa);
            prepare.executeUpdate();
            response.sendRedirect("./index.jsp");
        }catch(ClassNotFoundException c){
            out.println("Class Not Found "+c.getMessage());
        }catch(Exception e){
            out.println("Error "+e.getMessage());
        }
    }
    if(request.getParameter("idubah")!=null && request.getParameter("idubah")!=""){
        idubahsiswa=Integer.parseInt(request.getParameter("idubah"));
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            prepare=connection.prepareStatement("select * from siswa where id=?");
            prepare.setInt(1,idubahsiswa);
            resultset=prepare.executeQuery();
            resultset.next();
        }catch(ClassNotFoundException c){
            out.println("Class Tidak Ditemukan "+c.getMessage());
        }catch(Exception e){
            out.println("Error "+e.getMessage());
        }
    }else{
        response.sendRedirect("./index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ubah</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Edit Student</h1>
        <div class="row">
            <div class="col-sm-4">
                <form action="#" method="POST">
                    <div alight="left">
                        <label class="form-label">Nama</label>
                        <input type="text" class="form-control" placeholder="Nama Siswa" name="txtnamasiswa" id="txtnamasiswa" value="<%=resultset.getString("nama") %>"/>
                    </div>
                    <div alight="left">
                        <label class="form-label">Alamat</label>
                        <input type="text" class="form-control" placeholder="Alamat" name="txtalamatsiswa" id="txtalamatsiswa" value="<%=resultset.getString("alamat") %>" >
                    </div>
                    <div alight="left">
                        <label class="form-label">Nomor HandPhone</label>
                        <input type="number" class="form-control" placeholder="Nomo HP" name="txtnomorsiswa" id="txtnomorsiswa" value=<%=resultset.getString("telepon") %>>
                    </div>
                    <br>
                    <div alight="right">
                        <input type="submit" name="btnubah" id="btnubah" value="Ubah" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
