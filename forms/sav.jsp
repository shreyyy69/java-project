<%@ page language="java" session="true" import="java.sql.*" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%

  
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{
    String accno=(String)session.getValue("ano");
    String savaccount=request.getParameter("R1");
    String amount=request.getParameter("T1");

	
        int i=0; 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	String sq=("insert into saving values(?,?,?)"); 
        PreparedStatement p=cc.prepareStatement(sq);
	p.setInt(1,Integer.parseInt(accno));
        p.setString(2,savaccount);	
	p.setInt(3,Integer.parseInt(amount));	
	i=p.executeUpdate();
	if(i>0)
	{
           
//	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/payment.htm");
       out.println("THANK U");
	}
}
catch(SQLException ee){}
	
%>
</body>
</html>

