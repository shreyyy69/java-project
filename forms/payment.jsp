<%@ page language="java" session="true" import="java.sql.*;" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
 String accno=(String)session.getValue("ano");	
    String cash=request.getParameter("T1");
    String transaccno=request.getParameter("T2");    
    String transamt=request.getParameter("T3");
    String chqno=request.getParameter("T4");
    String bankname=request.getParameter("T5");
    String dat=request.getParameter("T6");
    String chqamt=request.getParameter("T7");
    String cname=request.getParameter("T8");
    String acctype=request.getParameter("R1");
    String others=request.getParameter("T9");          
    int i=0; 
    Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	
	String sq=("insert into pay(accno,cash,transaccno,transamt,chqno,bankname,dat,chqamt,cname,acctype,others)  values(?,?,?,?,?,?,?,?,?,?,?)");   
      	PreparedStatement p=cc.prepareStatement(sq);
        p.setInt(1,Integer.parseInt(accno));
	p.setInt(2,Integer.parseInt(cash));
	p.setString(3,transaccno);
	p.setInt(4,Integer.parseInt(transamt));
        p.setString(5,chqno);
	p.setString(6,bankname);
	p.setString(7,dat);
	p.setInt(8,Integer.parseInt(chqamt));
	p.setString(9,cname);
	p.setString(10,acctype);
	p.setString(11,others);
	i=p.executeUpdate();
	if(i>0)
	{
	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/atmcard.htm");
	}
	

    
%>
</body>
</html>



