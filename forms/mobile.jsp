<%@ page language="java" session="true" import="java.sql.*" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{   	String accno=(String)session.getValue("ano");
	String mailid=request.getParameter("T1");
    	String cellno=request.getParameter("T2");
    	String corpname=request.getParameter("T3");
        String city=request.getParameter("T4");
	int i=0;int x=1; 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	
	String sq=("insert into mobile values(?,?,?,?,?)");     
        PreparedStatement p=cc.prepareStatement(sq);
        p.setInt(1,Integer.parseInt(accno));

	p.setString(2,mailid);
	p.setString(3,cellno);
	p.setString(4,corpname);                 
	p.setString(5,city);                 
	i=p.executeUpdate();
	if(i>0)
	{
	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/bill.htm");
	}	
}
catch(SQLException ex)
{}
%>
</body>
</html>


