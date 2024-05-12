<%@ page language="java" session="true" import="java.sql.*;" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{       String accno=(String)session.getValue("ano");
        String cardno=request.getParameter("T1");
        String card=request.getParameter("R1");    
        String cardchoice=request.getParameter("R2");    
        int i=0; 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	String sq=("insert into atmcard values(?,?,?,?)");                 
        PreparedStatement p=cc.prepareStatement(sq);
        p.setInt(1,Integer.parseInt(accno));
	p.setString(2,cardno);
	p.setString(3,card);
	p.setString(4,cardchoice);
	i=p.executeUpdate();
	if(i>0)
	{
	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/mobile.htm");
	}
	
}
catch(SQLException ee){}
	
    
%>
</body>
</html>





