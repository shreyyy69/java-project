<% response.setContentType("text/vnd.wap.wml");%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" 
     "http://www.wapforum.org/DTD/wml13.dtd"> 
<%@ page language="java" session="true" import="java.sql.*" %>
<%@ include file="date1.jsp" %>

<wml>
<card>
<p>
<%
 try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try{
        int ch=0,balance=0,jj=0;
        String dat="",typ="",tdat1=""; 
	String accno=(String)session.getValue("ano"); 
       	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p=cc.prepareStatement("select tdate,type,bal from trans where accno=? ");
	p.setString(1,accno);
          
        
ResultSet rs=p.executeQuery();	  
	out.println("<table border=1>");
	//out.println("<td> DATE </th>"+"<th> TYPE </th>"+"<th> BALANCE </th>");
        while(rs.next())
	{
		ch=1;	
		out.println("<tr>");
		      
                dat=rs.getString("tdate");
                typ=rs.getString("type");
       		balance=rs.getInt("bal");  
                jj=dat.indexOf(" ");  
                tdat1=dat.substring(0,jj);
		out.println("<td> DATE </td><td>"+ tdat1+"</td>");
		out.println("<td> TYPE </td><td>"+typ+"</td>");
		out.println("<td> BALANCE </td><td>"+balance+"</td>");
		out.println("</tr>");
	}
        if(ch==1)
	{
		out.println("UR  CURRENT BALANCE IS   "+balance+"<hr>");
	}
	else
	{
		out.println("UR ACC NO DOESNOT EXISTS");
	}
 	out.println("</table>");
}
catch(SQLException ex){}
%>
</p>
</card>
</wml>


