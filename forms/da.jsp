<%@ page language="java" session="true" import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="date1.jsp" %>
<html>
<body>


<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}

try
{

	String name="then";

	String dateString = x;
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		java.util.Date d;
		try {
			d = dateFormat.parse(dateString);
			dateFormat.applyPattern("yyyy-MM-dd");
			dateString = dateFormat.format(d);
		     } catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		java.sql.Date date = java.sql.Date.valueOf(dateString);
        out.println(date);
         Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
         PreparedStatement p=cc.prepareStatement("insert into da(name,dat) values(?,?)");
         p.setString(1,name);
         p.setDate(2,date);


         int ii=p.executeUpdate();
        if(ii>0)
	{ 
            out.println("insert");
	}
}
catch(SQLException e){}
%>
</body>
</html>
       
    
         


