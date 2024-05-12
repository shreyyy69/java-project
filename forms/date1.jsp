<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.*" %>
<%
Calendar g=Calendar.getInstance();
int mon=g.get(Calendar.MONTH);
mon++;
  
int dt=g.get(Calendar.DATE);
int ye=g.get(Calendar.YEAR);
String x;
StringBuffer sb=new StringBuffer();
x=sb.append(String.valueOf(mon)).append("/").append(String.valueOf(dt)).append("/").append(String.valueOf(ye)).toString();


%>






