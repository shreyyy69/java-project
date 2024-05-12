<%@ page language="java" session="true" import="java.sql.*" %>
<%@ include file="date1.jsp" %>
<%
 try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

}catch(ClassNotFoundException ex){}

try
{
	int en=0,balance=0,i=0,auto=0,no=0,depamt=0,n=0,balance1=0,check=0;
	int f=0,f1=0,f2=0;
	String atype="",type="cheque",y="",paye="";
    String accno=(String)session.getValue("ano"); 
    String bname=request.getParameter("T1");
    String chqamt=request.getParameter("T2");
  	int chqamt1=Integer.parseInt(chqamt);
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
	         if(chqamt1>balance)
		{
			check=1;
		out.println("cannot pass.ur bal is"+ balance);
		}
		else
		{	
			balance1=balance-chqamt1;
		}		

		
/* ddno increment*/
 	if(check!=1)
           {
	 ResultSet rs2=s.executeQuery("select * from bccheque");

         while(rs2.next())
	{
 		no=rs2.getInt("bcno");

         	if(auto<no)
		{
	      		auto=no;
	 	}
	}
	auto=auto+1;

/* Inserting BCCHEQUE*/
	String sq=("insert into bccheque values(?,?,?,?,?)");                       			
PreparedStatement p3=cc.prepareStatement(sq);
	p3.setInt(1,Integer.parseInt(accno));
	p3.setInt(2,auto);
	p3.setString(3,bname);
	p3.setString(4,x);                 
	p3.setInt(5,chqamt1);                 
	i=p3.executeUpdate();
	if(i>0)
	{
		
		f=1;
	}
/* Inserting Trans*/
        	
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
	p2.setInt(12,chqamt1);
	p2.setInt(13,balance1);
         int j=p2.executeUpdate();
	if(j>0)
	{
		f1=1;
	}       
/* INserting WDRAW */
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
	p4.setInt(12,chqamt1);
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
		//response.sendRedirect("http://localhost:8080/examples/jsp/frames/final.htm");
	} 
  }
}
catch(SQLException ex){}


%>


