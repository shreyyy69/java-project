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
        String d="";
	int j=0,i=0,balance=0,ii=0,jj=0,c=0,jj1=0,amt=0,amt1=0,deamt=0,wdamt=0,ano=0;
	String d1=" ",d2="",typ1="",typ2="",tdat="",tdat1="",tdat2="";
	String month=request.getParameter("T1");
        String typ=request.getParameter("D1");

        if(typ.equals("Demand Draft"))
         {typ1="dd";j=1;
		}
	if(typ.equals("Bankers cheque"))
         {typ1="cheque";j=1;
		}
	if(typ.equals("Fund Transfer"))
         {typ1="fund transfer";j=1;
		}
	if(typ.equals("Bill pay"))
         {typ1="billpay";j=1;
		}
  	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();

        PreparedStatement p=cc.prepareStatement("select tdate from trans");

        ResultSet rs=p.executeQuery();	  
        while(rs.next())
	{
	      d=rs.getString("tdate");


	}

out.println("<b>"+"<pre>"+"  Date: "+x+"</pre>"+"</b>");
        if(j==1)
	{
	out.println("<table border=2 bordercolorlight='#008000' bordercolordark='#008000' bgcolor='#FFFFCC'  bordercolor='#000000' cellspacing='0' cellpadding='2'>"); 
        out.println("<th>Date</th>"+"<th>Accno</th>"+"<th>Narration</th>"+"<th>Date of Transaction</th>"+"<th>Debit</th>"+"<th>Credit</th>"+"<th>Balance</th>"); 
      	PreparedStatement p1=cc.prepareStatement("select accno,tdate,type,damt,wamt,bal from trans where  tdate<=? and type=? ");

	p1.setString(1,d);
        p1.setString(2,typ1);
        ResultSet rs1=p1.executeQuery();	  
        while(rs1.next())
	{   
		out.println("<tr>"); 
		ano=rs1.getInt("accno");
	        tdat=rs1.getString("tdate");
        	 deamt=rs1.getInt("damt"); 
                wdamt=rs1.getInt("wamt"); 
 	        balance=rs1.getInt("bal");
                i=tdat.indexOf("-");
                d1=tdat.substring(i+1,i+3);
		if(month.equals(d1))
 		{
                  c=1;
                  d2=tdat;
	   	  jj1=d2.indexOf(" ");  
                  tdat2=d2.substring(0,jj1);		
                  out.println("<td>"+tdat2+"</td>");
		  out.println("<td>"+ano+"</td>");
                  out.println("<td>"+typ1+"</td>");
		  out.println("<td>"+tdat2+"</td>");
                  out.println("<td>"+deamt+"</td>");
                  out.println("<td>"+wdamt+"</td>");
                  out.println("<td>"+balance+"</td>");
                  out.println("</tr>");
	        }
	}
	out.println("</table>");
	}
        else
	{
	
	out.println("<table border=2 bordercolorlight='#008000' bordercolordark='#008000' bgcolor='#FFFFCC'  bordercolor='#000000' cellspacing='0' cellpadding='2'>");
        out.println("<th>Date</th>"+"<th>Accno</th>"+"<th>Narration</th>"+"<th>Date of Transaction</th>"+"<th>Debit</th>"+"<th>Credit</th>"+"<th>Balance</th>"); 
	PreparedStatement p2=cc.prepareStatement("select accno,tdate,type,damt,wamt,bal from trans where  tdate<=? ");

	p2.setString(1,d);
        ResultSet rs2=p2.executeQuery();	  
        while(rs2.next())
	{   
              out.println("<tr>");
		ano=rs2.getInt("accno");
              tdat=rs2.getString("tdate");
       	      typ2=rs2.getString("type");
	      deamt=rs2.getInt("damt"); 
               wdamt=rs2.getInt("wamt"); 
 	      balance=rs2.getInt("bal");
              i=tdat.indexOf("-");
              d1=tdat.substring(i+1,i+3);
              if(month.equals(d1))
		{
		 c=1;
		 d2=tdat;                
	   	 jj1=d2.indexOf(" ");  
                 tdat2=d2.substring(0,jj1);
                 out.println("<td>"+tdat2+"</td>");
                 out.println("<td>"+ano+"</td>");
                 out.println("<td>"+typ2+"</td>");
        	out.println("<td>"+tdat2+"</td>");
                 out.println("<td>"+deamt+"</td>");
                 out.println("<td>"+wdamt+"</td>");
                 out.println("<td>"+balance+"</td>");    
                 out.println("</tr>");		
	        }
	}
	out.println("</table>");
       }
         
	if(c==0)
	{            out.println("NO TRANSACTION IS DONE ON THE SPECIFIED MONTH");
	}

}
catch(SQLException es){}
%>

</body>
</html>		


