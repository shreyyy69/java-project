<% response.setContentType("text/vnd.wap.wml"); %>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.3//EN" 
     "http://www.wapforum.org/DTD/wml13.dtd"> 
<wml> 
<card> 
  <do type="Accept" label="compose">
<go  href="http://localhost:8080/examples/jsp/forms/trans.jsp">
<postfield name="s1" value="$s1" /><br/>
<postfield name="s3" value="$s3" />
</go>
</do>
<p>
 TO <INPUT TYPE="TEXT" name="s1"   SIZE="40"/>

MSG <INPUT TYPE="TEXT" name="s3" maxlenth="100"  SIZE="40"/>

</p>
</card>
</wml>