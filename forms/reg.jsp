<%@ page language="java" session="true" import="java.sql.*" %>
<html>
<body background="indtextb.jpg" bgcolor="#FFFFFF" text="#000000" link="#3366CC" vlink="#666666" alink="#996600">
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}catch(ClassNotFoundException ex){}
try{
    int ii=0;
    String ano=" ";
    String ccode=request.getParameter("T1");
    String pwd=request.getParameter("T2");    
    String fname=request.getParameter("T3");
    String mname=request.getParameter("T4");
    String lname=request.getParameter("T5");
    String age=request.getParameter("T6");
    String dob=request.getParameter("T7");
    String sex=request.getParameter("R1");
    String mailaddr=request.getParameter("S1");
    String pin=request.getParameter("T8");
    String country=request.getParameter("D6");
    String mailid=request.getParameter("T9");
    String offtel=request.getParameter("T10");
    String restel=request.getParameter("T11");
    String faxno=request.getParameter("T12"); 
    String pagno=request.getParameter("T13");
    String mobno=request.getParameter("T14");
    String permaddr=request.getParameter("S2");
    String pin1=request.getParameter("T15");
    String country1=request.getParameter("D7");
    String telephone=request.getParameter("T16");
    String marstatus=request.getParameter("R2");
    String depend=request.getParameter("C1");
    String dependno=request.getParameter("D5");
    String edu=request.getParameter("R3");
    String occu=request.getParameter("R4");
    String prof=request.getParameter("R5");
    String empwith=request.getParameter("R6");
    String grade=request.getParameter("R7");
    String servyrs=request.getParameter("D4");
    String income=request.getParameter("R8");
    String assets=request.getParameter("C2");
    String vehicles=request.getParameter("R9");
    String resid=request.getParameter("R10");
	int auto=0;
        int i=0; 
	int no=0,flag=0;
        Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p1=cc.prepareStatement("select * from reg where ccode=? ");
	p1.setString(1,ccode);

        ResultSet rs1=p1.executeQuery();	       
        if(rs1.next())
	{    
              response.sendRedirect("http://localhost:8080/examples/jsp/wallet/codeex.htm"); 
        	flag=1; 
		
	}

		if(flag==0)
		{
        	ResultSet rs=s.executeQuery("select * from reg");
                while(rs.next())
 		{    
	        	no=rs.getInt("accno");
		}
		if(auto<no)
		{
	      		auto=no;
	 	}
	
	auto++;  
	if(ii==0)
	{
	String sq=("insert into reg(accno,ccode,pwd,fname,mname,lname,age,dob,sex,mailaddr,pin,country,mailid,offtel,restel,faxno,pagno,mobno,permaddr,pin1,country1,telephone,marstatus,depend,dependno,edu,occu,prof,empwith,grade,servyrs,income,assets,vehicles,resid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");              
	PreparedStatement p=cc.prepareStatement(sq);
	p.setInt(1,auto);
	p.setString(2,ccode);
	p.setString(3,pwd);
	p.setString(4,fname);
	p.setString(5,mname);
	p.setString(6,lname);
	p.setInt(7,Integer.parseInt(age));
	p.setString(8,dob);
	p.setString(9,sex);
	p.setString(10,mailaddr);
	p.setInt(11,Integer.parseInt(pin));
	p.setString(12,country);
	p.setString(13,mailid);
	p.setString(14,offtel);
	p.setString(15,restel);
	p.setString(16,faxno);
	p.setString(17,pagno);
	p.setString(18,mobno);
	p.setString(19,permaddr);
	p.setInt(20,Integer.parseInt(pin1));
	p.setString(21,country1);
	p.setString(22,telephone);
	p.setString(23,marstatus);
	p.setString(24,depend);
	p.setInt(25,Integer.parseInt(dependno));
	p.setString(26,edu);
	p.setString(27,occu);
	p.setString(28,prof);
	p.setString(29,empwith);
	p.setString(30,grade);
	p.setInt(31,Integer.parseInt(servyrs));
	p.setString(32,income);
	p.setString(33,assets);
	p.setString(34,vehicles);
	p.setString(35,resid);
	i=p.executeUpdate();
	if(i>0)
	{
        session.putValue("ano",String.valueOf(auto));
        response.sendRedirect("http://localhost:8080/examples/jsp/wallet/intro.htm");
    		
     	}
	else
	{
		response.sendRedirect("http://localhost:8080/examples/jsp/wallet/reg.htm"); 
	}
      }
}
}
catch(SQLException ex){}
%>
</body>

</html>










