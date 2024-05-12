<%@ page language="java" %>
<%
	
    //String accno=(String)session.getValue("ano");  
    
    String bename=request.getParameter("T1");
    String ddamt=request.getParameter("T2");
    String appdate=request.getParameter("T3");
    String city=request.getParameter("T4");
    String state=request.getParameter("T5");
    out.println(bename);out.println(ddamt);
    out.println(appdate);out.println(city);out.println(state);//out.println(accno);
	
%>

