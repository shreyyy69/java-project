<%@ page language="java" session="true" import="java.sql.*" %>
<%@ include file="date1.jsp" %>
<%
 try 
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 
}catch(ClassNotFoundException ex){}
try{

	int f=0,f1=0,f2=0;
	int en=0,balance=0,i=0,auto=0,no=0,depamt=0,n=0,balance1=0,check=0;
	String atype="",type="dd",y="",paye="";
    String accno=(String)session.getValue("ano"); 
    out.println(accno);
    String bename=request.getParameter("T1");
    String ddamt=request.getParameter("T2");
  	String appdate=request.getParameter("T3");
	String city=request.getParameter("T4");
	String state=request.getParameter("T5");
    out.println(bename);out.println(ddamt);
    out.println(appdate);out.println(city);out.println(state);
	int ddamt1=Integer.parseInt(ddamt);
    Connection cc=null;
	cc=DriverManager.getConnection("jdbc:odbc:wallet","sa","");
	Statement s=cc.createStatement();
        PreparedStatement p=cc.prepareStatement("select encode,bal from trans where accno=? ");
	p.setString(1,accno);
        ResultSet rs=p.executeQuery();	  
	int ent=0;
        while(rs.next())
	{
		
             en=rs.getInt("encode");
		if(ent<en)
		{
			ent=en;
        		balance=rs.getInt("bal");  
		}

	}
	ent=ent+1;
		
        PreparedStatement p1=cc.prepareStatement("select acctype,damt,payee from trans where accno=? ");
	p1.setString(1,accno);
        ResultSet rs1=p1.executeQuery();	  
	while(rs1.next())
	{
		atype=rs1.getString("acctype");
		depamt=rs1.getInt("damt");
		paye=rs1.getString("payee");
	}
	         if(ddamt1>balance)
		{
		check=1; 
		out.println("cannot pass.ur bal is"+ balance);
		}
		else
		{	
			balance1=balance-ddamt1;
		}		

		
out.println("ddno increment");
	if(check!=1)
	{
	 ResultSet rs2=s.executeQuery("select *  from dd");

         while(rs2.next())
	{
 		no=rs2.getInt("ddno");

         	if(auto<no)
		{
	      		auto=no;
	 	}
	}
	auto=auto+1;
	
out.println(" Inserting dd");
	String sq=("insert into dd values(?,?,?,?,?,?,?)");                       		
	PreparedStatement p3=cc.prepareStatement(sq);
	p3.setInt(1,Integer.parseInt(accno));
	p3.setString(2,bename);
	p3.setInt(3,auto);
	p3.setInt(4,ddamt1);                 
	p3.setString(5,appdate);                 
        p3.setString(6,city);
	p3.setString(7,state);
	i=p3.executeUpdate();
	if(i>0)
	{
		
		f=1;
	}
 out.println("Inserting Trans");
        	
String sq2=("insert into trans values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement p2=cc.prepareStatement(sq2);
	p2.setInt(1,ent);
	p2.setInt(2,Integer.parseInt(accno));
	p2.setString(3,atype);
	p2.setString(4,x);
	p2.setString(5,type);
	p2.setString(6,y);
	p2.setString(7,x);
	p2.setString(8,y);
	p2.setInt(9,n);
	p2.setString(10,paye);
	p2.setString(11,y);
	p2.setInt(12,ddamt1);
	p2.setInt(13,balance1);
         int j=p2.executeUpdate();
	if(j>0)
	{
		f1=1;
	}       
String sq3=("insert into wdraw values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement p4=cc.prepareStatement(sq3);
	p4.setInt(1,ent);
	p4.setInt(2,Integer.parseInt(accno));
	p4.setString(3,atype);
	p4.setString(4,x);
	p4.setString(5,type);
	p4.setString(6,y);
	p4.setString(7,x);
	p4.setString(8,paye);
	p4.setInt(9,n);
	p4.setString(10,y);
	p4.setString(11,y);
	p4.setInt(12,ddamt1);
	p4.setInt(13,balance1);
	p4.setString(14,y);
         int jj=p4.executeUpdate();
	if(jj>0)
	{
		f2=1;
	}       
	if(f==1 && f1==1 && f2==1)
	{
       out.println("SUCCESSFULLY TRANSFERRED"); 
		
	}
	}
}catch(SQLException ex){}

%>

