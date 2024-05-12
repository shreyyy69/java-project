<%@ page language="java" session="true" import="java.sql.*" %>
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

       	int ii=0,jj1=0;
        String from="",dat="",tdat="",msg="";


         Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        String sq=("select * from inbox" );
         PreparedStatement p=cc.prepareStatement(sq);
        ResultSet rs=p.executeQuery();	  
        out.println("<table border=1 align='center' >");
        out.println("<th>MsgFrom</th>"+"<th>Date</th>"+"<th>Msg</th>"); 

        while(rs.next())
	{
		 out.println("<tr>");
 	    from=rs.getString("msgfrom");
 	    dat=rs.getString("dat");
 	    msg=rs.getString("msg");
	    jj1=dat.indexOf(" ");  
            tdat=dat.substring(0,jj1);		
	    
             out.println("<td>"+from+"</td>");
             out.println("<td>"+tdat+"</td>");
             out.println("<td>"+msg+"</td>");
                out.println("</tr>");
        
	
	}
         out.println("</table>");
}
catch(SQLException es){}        
	

%>
</body>
</html>


