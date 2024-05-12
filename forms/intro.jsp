<%@ page language="java" session="true" import="java.sql.*" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{   String accno=(String)session.getValue("ano");
    String custid=request.getParameter("T1");
    String name=request.getParameter("T2");
    String custaccno=request.getParameter("T3");
    String copy=request.getParameter("R1");

        int i=0; 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");

	String sq=("insert into intro values(?,?,?,?,?)");                       	PreparedStatement p=cc.prepareStatement(sq);
	p.setInt(1,Integer.parseInt(accno));
	p.setString(2,custid);
	p.setString(3,name);
	p.setString(4,custaccno);                 
	p.setString(5,copy);                 

	i=p.executeUpdate();
	if(i>0)
	{
		
		response.sendRedirect("http://localhost:8080/examples/jsp/wallet/acc.htm");
	}
	
}
catch(SQLException ee){}
%>
</body>
</html>





