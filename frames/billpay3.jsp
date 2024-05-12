<%@ page language="java" session="true" import="java.sql.*" %>
<HTML>
<BODY>
<% String eno=(String)session.getValue("billno"); %>
<% String tno=(String)session.getValue("telno"); %>
<% String cno=(String)session.getValue("cellno"); %>
<% String pno=(String)session.getValue("policyno"); %>
<% String no="" %>
<FORM Method="POST" Action="http://localhost:8080/examples/jsp/forms/bpay.jsp">
<P><FONT 
size=1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<B>&nbsp; <U>BILL&nbsp; PAYMENT</U></B></FONT></P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ToAccount 
No:&nbsp;&nbsp;&nbsp; <INPUT name=T1></P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Payment For:&nbsp;&nbsp;&nbsp; <SELECT name=D1 size=1> <OPTION 
  selected>Electricity Bill</OPTION> <OPTION>Telephone Bill</OPTION> 
  <OPTION>Mobile Bill</OPTION> <OPTION>Insurance 
Policy</OPTION></SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

<% if(D1.value.equals("Electricity Bill"))
    {
       no=Integer.parseInt(eno);
}
if(D1.value.equals("Telephone Bill"))
    {
       no=Integer.parseInt(tno);
}
if(D1.value.equals("Mobile Bill"))
    {
       no=Integer.parseInt(cno);
}
if(D1.value.equals("Insurance Policy"))
    {
       no=Integer.parseInt(pno);
}%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No:&nbsp;&nbsp;&nbsp; 
<INPUT name=T3 value=<%=no %>
> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Amount:&nbsp;&nbsp;&nbsp; <INPUT name=T4></P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<INPUT name=B1 type=submit value=Submit><INPUT name=B2 type=reset value=Reset></P>
<P>&nbsp;</P></FORM></BODY></HTML>


