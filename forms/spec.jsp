<%@ page language="java" session="true" import="java.sql.*" %>
<%@ include file="date1.jsp" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
 try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try{
        String d="",tdat="";int debit=0;
	int j=0,i=0,balance=0,ii=0,jj=0,check=0,k=0,K1=0,amt=0,wdamt=0,deamt=0,amt1=0;
	String d1=" ",typ1="",typ2="",d2="",tdat1="";
	String st=request.getParameter("T1");
	String en=request.getParameter("T2");
        String typ=request.getParameter("D1");
        String accno=(String)session.getValue("ano"); 
        if(typ.equals("Demand Draft"))
         {typ1="dd";j=1;k=1;
		}
	if(typ.equals("Bankers Cheque"))
         {typ1="cheque";j=1;k=1;
		}
	if(typ.equals("Fund Transfer"))
         {typ1="fund transfer";j=1;k=1;
		}
	if(typ.equals("Bill Pay"))
         {typ1="billpay";j=1;k=1;
		}
  	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p=cc.prepareStatement("select  amount from curr where accno=?  ");
	p.setString(1,accno);
        ResultSet rs=p.executeQuery();
	while(rs.next())
	{
		amt=rs.getInt("amount");
	}
	PreparedStatement p3=cc.prepareStatement("select  bal from trans where accno=?  ");
	p3.setString(1,accno);
        ResultSet rs3=p3.executeQuery();
	while(rs3.next())
	{
		amt1=rs3.getInt("bal");
	}
	out.println("<b>"+"<pre>"+"  Date: "+x+"                         Opening Balance:"+amt+"</pre>"+"</b>");
	out.println("<b>"+"<pre>"+"                                          Current Balance:"+amt1+"</pre>"+"</b>");
        if(j==1)
	{
        out.println("<BLOCKQUOTE>"+"<table border=2 bordercolorlight='#008000' bordercolordark='#008000' bgcolor='#FFFFCC'  bordercolor='#000000' cellspacing='0' cellpadding='2'>"+"</BLOCKQUOTE>");	
        out.println("<th>Date</th>"+"<th>Narration</th>"+"<th>Date of Transaction</th>"+"<th>Debit</th>"+"<th>Credit</th>"+"<th>Balance</th>"); 
	PreparedStatement p1=cc.prepareStatement("select  tdate,type,damt,wamt,bal from trans where accno=? and tdate>=? and tdate<=? and type=? ");
	p1.setString(1,accno);
	p1.setString(2,st);
        p1.setString(3,en);
        p1.setString(4,typ1);
        ResultSet rs1=p1.executeQuery();	  
        while(rs1.next())
	{  
               
            tdat=rs1.getString("tdate");           
            deamt=rs1.getInt("damt"); 
            wdamt=rs1.getInt("wamt"); 
 	    balance=rs1.getInt("bal");
             jj=tdat.indexOf(" ");  
             tdat1=tdat.substring(0,jj);
		out.println("<tr>");
             out.println("<td>"+tdat1+"</td>");
             out.println("<td>"+typ1+"</td>");
             out.println("<td>"+tdat1+"</td>");
             out.println("<td>"+deamt+"</td>");
             out.println("<td>"+wdamt+"</td>");   
             out.println("<td>"+balance+"</td>");
                out.println("</tr>");
              check=1;
	}
	out.println("</table>");        	
	}
        else
	{
	
        out.println("<BLOCKQUOTE>"+"<table border=2 bordercolorlight='#008000' bordercolordark='#008000' bgcolor='#FFFFCC'  bordercolor='#000000' cellspacing='0' cellpadding='2'>"+"</BLOCKQUOTE>");	
        out.println("<th>Date</th>"+"<th>Narration</th>"+"<th>Date of Transaction</th>"+"<th>Debit</th>"+"<th>Credit</th>"+"<th>Balance</th>");        
        
	PreparedStatement p2=cc.prepareStatement("select tdate,type,damt,wamt,bal from trans where accno=? and tdate>=? and tdate<=?");
	p2.setString(1,accno);
	p2.setString(2,st);
        p2.setString(3,en);
        ResultSet rs2=p2.executeQuery();	  
        while(rs2.next())
	{ 
	    tdat=rs2.getString("tdate"); 
	    typ2=rs2.getString("type");           
            deamt=rs2.getInt("damt"); 
            wdamt=rs2.getInt("wamt"); 
 	    balance=rs2.getInt("bal");
             jj=tdat.indexOf(" ");  
             tdat1=tdat.substring(0,jj); 	
        	   out.println("<tr>");
             out.println("<td>"+tdat1+"</td>");
             out.println("<td>"+typ2+"</td>");
             out.println("<td>"+tdat1+"</td>");
             out.println("<td>"+deamt+"</td>");
             out.println("<td>"+wdamt+"</td>");
             out.println("<td>"+balance+"</td>");    
                out.println("</tr>");		
              check=1;
	}
	 out.println("</table>");		

	}
       

		
         if(k==1 && check==0)
	{
            out.println("NO"+typ1+" TRANSACTION IS DONE ");
             K1=1;
	}
	
	if(check==0 && K1==0)
	{
             out.println("NO TRANSACTION IS DONE IN THE SPECIFIED DATE ");
	}
}
catch(SQLException es){}
%>

</body>
</html>		


