7<%@ page language="java" session="true" import="java.sql.*" %>
    
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
    String bankused=request.getParameter("C1");
    String mainbank=request.getParameter("T1");
    String invest=request.getParameter("C2");
    String crecard=request.getParameter("R1");
    String cardsown=request.getParameter("D1");
    String noofyrs=request.getParameter("D2");
    String freqcard=request.getParameter("T2");
    String loans=request.getParameter("C3");
    String products=request.getParameter("C4");
    int i=0; 
    Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	String sq=("insert into bankdet values(?,?,?,?,?,?,?,?,?,?)");        
	PreparedStatement p=cc.prepareStatement(sq);
        p.setInt(1,Integer.parseInt(accno));
	p.setString(2,bankused);
	p.setString(3,mainbank);
	p.setString(4,invest);
        p.setString(5,crecard);
	p.setInt(6,Integer.parseInt(cardsown));
	p.setInt(7,Integer.parseInt(noofyrs));
	p.setString(8,freqcard);
	p.setString(9,loans);
	p.setString(10,products);
	i=p.executeUpdate();
	if(i>0)
	{
	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/end.htm");	
	}
	
}
catch(SQLException ee){}
	
    
%>
</body>
</html>


