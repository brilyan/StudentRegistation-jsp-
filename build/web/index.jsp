<%-- 
    Document   : index
    Created on : 07/03/2020, 7:43:17 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>



<% 
        if(request.getParameter("submit")!=null){
            
        String nama=request.getParameter("namasiswa");
        String alamat=request.getParameter("alamatsiswa");
        String nomor=request.getParameter("nomorsiswa");
        Connection connection;
        PreparedStatement prepare;
    
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentregistjsp","root","");
        prepare=connection.prepareStatement("insert into siswa(nama,alamat,telepon)values(?,?,?)");
        prepare.setString(1,nama);
        prepare.setString(2,alamat);
        prepare.setString(3,nomor);
        prepare.executeUpdate();
        %>
        <script>
            alert("Data Berhasil Ditambahkan");
        </script>
        <%
   
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>School</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Registation System</h1>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#">
                    <div alight="left">
                        <label class="form-label">Nama</label>
                        <input type="text" class="form-control" placeholder="Nama Siswa" name="namasiswa" id="namasiswa" required>
                      </div>
                    <div alight="left">
                        <label class="form-label">Alamat</label>
                        <input type="text" class="form-control" placeholder="Alamat Siswa" name="alamatsiswa" id="alamatsiswa" required>
                      </div>
                    <div alight="left">
                        <label class="form-label">Nomor Hanphone</label>
                        <input type="number" class="form-control" placeholder="Nomor Hanphone" name="nomorsiswa" id="nomorsiswa" required>
                    </div>
                
                          <br>
                    <div alight="right">
                        <input type="submit" name="submit" id="submit" value="submit" class="btn btn-info">
                        <input type="reset" name="reset" id="reset" value="reset" class="btn btn-warning">
                      </div>
                </form>
            </div>
                <div class="col-sm-8">
                    <div class="panel-body">
                        <table id="tblstudent" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                            <thead>
                                
                                <tr>
                                    <th>Nama Siswa</th>
                                    <th>Alamat</th>
                                    <th>Nomor HP</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                                
                                <% 
                                    Connection connection;
                                    PreparedStatement prepare;
                                    ResultSet resultsettampil;
                                    
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentregistjsp","root","");
                                    
                                    String query="select * from siswa";
                                    Statement statement=connection.createStatement();
                                    resultsettampil=statement.executeQuery(query);
                                    while(resultsettampil.next()){
                                       
                                        String idsiswa=resultsettampil.getString("id");
                                              
                                    
                                %>
                                
                                <tr>
                                    <td><%=resultsettampil.getString("nama") %></td>
                                    <td><%=resultsettampil.getString("alamat") %></td>
                                    <td><%=resultsettampil.getString("telepon") %></td>
                                    <td><a href="Ubah.jsp?idubah=<%=idsiswa %>">Ubah</a></td>
                                    <td><a href="Hapus.jsp?idhapus=<%=idsiswa %>" onclick="return confirm('Anda Yakin Ingin Menghapus?')">Hapus</a></td>
                                </tr>
                                <%
                                    }
                                 %>
                        </table>
                            
                </div>
        </div>
            
        </div>
    </body>
</html>
