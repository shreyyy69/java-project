<%@ page language="java" import="java.sql.*" %>
<%@ include file="date1.jsp" %>
<%
try 
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{	
	int ii=0;
	String x1=request.getParameter("s1");
	
	String z1=request.getParameter("s3");
	String a=(String)session.getValue("ano");
	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
	String sq=("insert into inbox(msgto,msgfrom,dat,msg) values(?,?,?,?)");
	PreparedStatement p=cc.prepareStatement(sq);
	p.setString(1,x1);
	p.setString(2,a);
	p.setString(3,x);
	p.setString(4,z1);
	int i=p.executeUpdate();
	if(i>0)
	{

	out.println("<h1>"+"message sent to"+"</h1>"+"<h3>"+x1+"</h3>");
	}
	
	
}catch(SQLException ee){}
%>



