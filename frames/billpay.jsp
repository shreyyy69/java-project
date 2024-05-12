<%response.setContentType("text/und.wap.wml");
<%@ page language="java" session="true" import="java.sql.*" %>

<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" 
     "http://www.wapforum.org/DTD/wml13.dtd"> 
<wml> 
<card id="card1" title="Billpay"> 


<onevent type="onenterbackward">
<refresh>
	<setvar name="T1" value=""/>
	<setvar name="T2" value=""/>
</refresh>
</onevent>	

<onevent type="onenterforward">
<refresh>
	<setvar name="T1" value=""/>
	<setvar name="T2" value=""/>
</refresh>
</onevent>
<p>
 <% String eno=" ",tno=" ",cno=" ",pno="  ",no="";%>

<do type="unknown" label="billpay">
      <go href="http://localhost:8080/examples/jsp/forms/bpay.jsp">
      <postfield  name="T1" value="$T1" />
      <postfield  name="T2" value="$T2" />
</go>
     



ToAccount No: <INPUT name=T1>
Payment For: <SELECT name=D1 size=1> 
   <OPTION selected>Electricity Bill
  </OPTION> 
  <OPTION>Telephone Bill
  </OPTION> 
  <OPTION>Mobile Bill
  </OPTION>
 <OPTION>Insurance Policy
  </OPTION>
  </SELECT>

<%
 try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try{
        String accno=(String)session.getValue("ano"); 
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p=cc.prepareStatement("select eunitno,telphoneno,cellno,inspno from bill where accno=? ");
	p.setString(1,String.valueOf(accno));
        ResultSet rs=p.executeQuery();	  
       if(rs.next())
       {   
           eno=rs.getString("eunitno");  
           tno=rs.getString("telphoneno");  
           cno=rs.getString("cellno");  
       	   pno=rs.getString("inspno");  
           
       }

}catch(SQLException ex){}
%>

  No:<SELECT name=D2 size=1>
 <OPTION   selected><%=eno %>
  
 </OPTION>
 <OPTION><%=tno %>

 </OPTION> 
  <OPTION><%=cno %>

  </OPTION>

 <OPTION><%=pno %>

 </OPTION>
</SELECT> 

 
Amount: <INPUT type="text" name="T4" size= "20"/>

</P>
</card>
</wml>


