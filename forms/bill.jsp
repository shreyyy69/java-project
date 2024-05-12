<%@ page language="java" session="true" import="java.sql.*" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}
try
{  
    String billno="";
    String accno=(String)session.getValue("ano");
    String elecname=request.getParameter("T1");
    String esname=request.getParameter("T2");    
    String ecity=request.getParameter("T3");
    String ecustidno=request.getParameter("T4");
    String eunitno=request.getParameter("T5");
    String telname=request.getParameter("T6");
    String telsname=request.getParameter("T7");
    String telcity=request.getParameter("T8");
    String telphoneno=request.getParameter("T9");
    String telcaccno=request.getParameter("T10");
    String telregin=request.getParameter("T11");
    String cellname=request.getParameter("T12");
    String cellsname=request.getParameter("T13");
    String cellcity=request.getParameter("T14");
    String cellcaccno=request.getParameter("T15"); 
    String cellno=request.getParameter("T16");
    String insname=request.getParameter("T17");
    String inssname=request.getParameter("T18");
    String inscity=request.getParameter("T19");
    String inspno=request.getParameter("T20");
    String insamt=request.getParameter("T21");
    String insfreq=request.getParameter("T22");
	int i=0;
       Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	String sq=("insert into bill(accno,elecname,esname,ecity,ecustidno,eunitno,telname,telsname,telcity,telphoneno,telcaccno,telregin,cellname,cellsname,cellcity,cellcaccno,cellno,insname,inssname,inscity,inspno,insamt,insfreq)                                                                          values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement p=cc.prepareStatement(sq);
        p.setInt(1,Integer.parseInt(accno));
	p.setString(2,elecname);
	p.setString(3,esname);
	p.setString(4,ecity);
	p.setString(5,ecustidno);
	p.setString(6,eunitno);
	p.setString(7,telname);
	p.setString(8,telsname);
	p.setString(9,telcity);
	p.setString(10,telphoneno);
	p.setString(11,telcaccno);
	p.setString(12,telregin);
	p.setString(13,cellname);
	p.setString(14,cellsname);
	p.setString(15,cellcity);
	p.setString(16,cellcaccno);
	p.setString(17,cellno);
	p.setString(18,insname);
	p.setString(19,inssname);
	p.setString(20,inscity);
	p.setString(21,inspno);
	p.setInt(22,Integer.parseInt(insamt));
	p.setString(23,insfreq);
     /*   session.putValue("billno",String.valueOf(eunitno));
	session.putValue("telno",String.valueOf(eunitno));
	session.putValue("cellno",String.valueOf(eunitno));
	session.putValue("policyno",String.valueOf(eunitno));*/
	i=p.executeUpdate();
	if(i>0)
	{
	response.sendRedirect("http://localhost:8080/examples/jsp/wallet/bankdet.htm");
	}
	
	
}
catch(SQLException ee){}
%>
</body>
</html>

