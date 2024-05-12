<%@ page language="java"  session="true" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="date1.jsp" %>
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
        String curaccount=request.getParameter("R1");
        String amount=request.getParameter("T1");    
       String choice=request.getParameter("R2");    
        int auto=0,no=0;
	String y=" ";int n=0;
	String payee="self";
        int i=0; 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	String sq=("insert into curr values(?,?,?,?)"); 
        PreparedStatement p=cc.prepareStatement(sq);
	p.setInt(1,Integer.parseInt(accno));
	p.setString(2,curaccount);	
	p.setInt(3,Integer.parseInt(amount));
	p.setString(4,choice);

        Statement s=cc.createStatement();
	ResultSet rs=s.executeQuery("select * from trans");
              while(rs.next())
		{    
		no=rs.getInt(1);
		if(auto<no)
		{
	      		auto=no;
	 	}
		}
	auto++;  
	
       String sq1=("insert into trans(encode,accno,acctype,tdate,type,chno,vdate,payer,damt,payee,toacc,wamt,bal) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement p1=cc.prepareStatement(sq1);
	p1.setInt(1,auto);
	p1.setInt(2,Integer.parseInt(accno));
	p1.setString(3,curaccount);
	p1.setString(4,x);
	p1.setString(5,y);
	p1.setString(6,y);
	p1.setString(7,x);
	p1.setString(8,y);
	p1.setInt(9,Integer.parseInt(amount));
	p1.setString(10,payee);	
	p1.setString(11,y);
	p1.setInt(12,n);
	p1.setInt(13,Integer.parseInt(amount));
        p1.executeUpdate();

	String sq2=("insert into deposit(encode,accno,acctype,tdate,type,chno,vdate,payer,damt,payee,toacc,wamt,bal,fraccno) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement p2=cc.prepareStatement(sq2);
	p2.setInt(1,auto);
	p2.setInt(2,Integer.parseInt(accno));
	p2.setString(3,curaccount);
	p2.setString(4,x);
	p2.setString(5,y);
	p2.setString(6,y);
	p2.setString(7,x);
	p2.setString(8,y);
	p2.setInt(9,Integer.parseInt(amount));
	p2.setString(10,payee);
	p2.setString(11,y);
	p2.setInt(12,n);
	p2.setInt(13,Integer.parseInt(amount));
	p2.setInt(14,n);
        p2.executeUpdate();           
       i=p.executeUpdate();
	if(i>0)
	{
         
response.sendRedirect("http://localhost:8080/examples/jsp/wallet/payment.htm");
	}
}
catch(SQLException ex){}	

%>
</body>
</html>




