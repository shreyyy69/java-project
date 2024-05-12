<!@ page language="java" session="true"%>
<html>

<body>
<%
 String accno=(String)session.getValue("ano");
 String ccode=(String)session.getValue("code"); %>
<form 

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font size="1">Code:&nbsp;&nbsp;</font> <% out.println(ccode);%>
</p>
  <p><font size="1">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  Acc No:&nbsp;</font><% out.println(accno); %></p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="billpay.jsp">BILLPAY</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://localhost:8080/examples/jsp/frames/fundtransfer.jsp">FUNDTRANSFER</p>
  <p>&nbsp;</p>

</form>

</body>

</html>


