<% response.setContentType("text/vnd.wap.wml"); %>

<%@ page language="java" session="true" import="java.sql.*" %>

<%@ include file="date1.jsp" %>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" 
     "http://www.wapforum.org/DTD/wml13.dtd"> 
<wml> 
    
  <card id="card1" title="check">
<p> 


<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}

try
{

       	int ii=0;
        String from="",dat="",msg="";
         String accno=(String)session.getValue("ano"); 

         Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        String sq=("select * from adminbox where msgto=?" );
         PreparedStatement p=cc.prepareStatement(sq);
	p.setString(1,accno);
	     ResultSet rs=p.executeQuery();	  
        out.println("<table border=1 align='center' >");
        out.println("<th>MsgFrom</th>"+"<th>Date</th>"+"<th>Msg</th>"); 

        while(rs.next())
	{
		 out.println("<tr>");
 	    from=rs.getString("msgfrom");
 	    dat=rs.getString("dat");
 	    msg=rs.getString("msg");
	    
             out.println("<td>"+from+"</td>");
             out.println("<td>"+dat+"</td>");
             out.println("<td>"+msg+"</td>");
                out.println("</tr>");
        
	
	}
         out.println("</table>");
}
catch(SQLException es){}        
	

%>
</p>
</card>
</wml>
