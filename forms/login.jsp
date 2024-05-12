<%@ page language="java" session="true" import="java.sql.*" %>
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}

try
{	
	int flag=0;
	String ano=" ";
    String code=" ";
	String c=request.getParameter("T1");
	String pp=request.getParameter("T2");
	int ac=0;
    
	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	PreparedStatement p=cc.prepareStatement("select accno from reg where ccode=? and pwd=? ");
	p.setString(1,c);
	p.setString(2,pp);        
    ResultSet rs=p.executeQuery();
	if(rs.next())
	{
		ac=rs.getInt("accno");
        session.putValue("ano",String.valueOf(ac));
		session.putValue("code",c);	
        //out.println(c);
       //out.println(pp);
 		
  		response.sendRedirect("http://localhost:8080/examples/jsp/frames/mail.wml"); 
	}
	else
	{	
	     //response.sendRedirect("http://localhost:8080/examples/jsp/wallet/ex.htm");		
	}
       
       
		        
}catch(SQLException ex){} 
%>

