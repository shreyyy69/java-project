<%@ page language="java" session="true" import="java.sql.*" %>
<%response.setContentType("text/vnd.wap.wml"); %>

<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" 
     "http://www.wapforum.org/DTD/wml13.dtd"> 
<wml> 
 
  
   <card id="card1" title="chequerequest"> 
<p>

<%@ include file="date1.jsp" %>

<%
 try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try{
	int stno=0,enno=0,bno=0,rno=0,i1=0;
	String accno=(String)session.getValue("ano"); 
  	Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p=cc.prepareStatement("select * from chqreq where accno=? ");
	p.setString(1,accno);
        ResultSet rs=p.executeQuery();	  
        while(rs.next())
	{
		bno=rs.getInt("chqbno");
		stno=rs.getInt("endno");
		rno=rs.getInt("refno");		
                 
	}
		enno=stno;
		stno++;
		bno++;
                rno++;
	for(i1=0;i1<10;i1++)

	{
		enno=enno+1;
	}	


        String sq=("insert into chqreq values(?,?,?,?,?,?)");                       			PreparedStatement p1=cc.prepareStatement(sq);
	p1.setInt(1,Integer.parseInt(accno));
	p1.setString(2,x);
	p1.setInt(3,bno);
        p1.setInt(4,stno);
        p1.setInt(5,enno);
        p1.setInt(6,rno);
        int i=p1.executeUpdate();
       if(i>0)
	{
		out.println("UR REFERENCE NO IS   "+rno+"<br>");
		out.println("UR CHEQUE NO STARTS FROM    "+stno+"  to  "+enno);

	}
}
catch(SQLException ex){}
%>

</p>
</card>
</wml>
