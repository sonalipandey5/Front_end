<?php
include("config.php");
$fname=$_REQUEST['t1'];
$lname=$_REQUEST['t2'];
$id=$_REQUEST['t3'];
$pass=SHA1($_REQUEST['p1']);
$phone=$_REQUEST['t5'];
$add=$_REQUEST['t6'];
if($_REQUEST['sub'])
{
$sel=mysqli_query($con,"select id from customer where email='$id' ");
$arr=mysqli_fetch_array($sel);

if($arr['id']!=$id)
  {
   if(mysqli_query($con,"insert into customer values(NULL,'$fname','$lname','$phone','$id','$add','$pass')"))
	   {      
	     echo "<script>location.href='index.php?con=13&wel=$id'</script>";
	   }
	 }
else 
{
echo "user already exists";
}

}
?>
<html>
<head>
<script>
function fnam()
{
  var fnam=/^[a-zA-Z]{4,15}$/;
   if(document.f1.t1.value.search(fnam)==-1)
    {
	 alert("enter correct  first name");
	 document.f1.t1.focus();
	 return false;
	 }
	} 
	 
	 function lnam()
{
  var lnam=/^[a-zA-Z]{4,15}$/;
   if(document.f1.t2.value.search(lnam)==-1)
    {
	 alert("enter correct last name");
	 document.f1.t2.focus();
	 return false;
	 }
	} 
	 
function email()
{
 var email=/^[a-zA-Z0-9-_\.]+@[a-zA-Z]+\.[a-zA-Z]{2,3}$/;
   if(document.f1.t3.value.search(email)==-1)
    {
	 alert("enter correct email");
	 document.f1.t3.focus();
	 return false;
	 }
	} 
	
	function pass()
	{
	var pass=/^[a-zA-Z0-9-_]{6,16}$/;
   if(document.f1.p1.value.search(pass)==-1)
    {
	 alert("enter correct pass");
	 document.f1.p1.focus();
	 return false;
	 }
	 }
	function phone()
	{
	var phn=/^[0-9]{9,14}$/;
  if(document.f1.t5.value.search(phn)==-1)
    {
	 alert("enter correct phone no");
	 document.f1.t5.focus();
	 return false;
	 }
	 }
	
	function add()
	{
	var add=/^[a-zA-Z0-9- ]{10,150}$/;
  if(document.f1.t6.value.search(add)==-1)
    {
	 alert("enter correct address of length 10,150");
	 document.f1.t6.focus();
	 return false;
	 }
	 }
	
function vali()
{
  var nam=/^[a-zA-Z]{4,15}$/;
   var email=/^[a-zA-Z0-9-_\.]+@[a-zA-Z]+\.[a-zA-Z]{2,3}$/;
    var pass=/^[a-zA-Z0-9-_]{6,16}$/;
	 	var phn=/^[0-9]{9,14}$/;
	  var add=/^[a-zA-Z0-9 ]{10,150}$/;
	  var city=/^[a-zA-Z]{5,30}$/;
	  
   if(document.f1.t1.value.search(nam)==-1)
    {
	 alert("enter correct  first name");
	 document.f1.t1.focus();
	 return false;
	 }
	 	 
  else if(document.f1.t2.value.search(nam)==-1)
    {
	 alert("enter correct last name");
	 document.f1.t2.focus();
	 return false;
	 }
 
  else if(document.f1.t3.value.search(email)==-1)
    {
	 alert("enter correct login name");
	 document.f1.t3.focus();
	 return false;
	 }
	 
	
	
   else if(document.f1.p1.value.search(pass)==-1)
    {
	 alert("enter correct pass");
	 document.f1.p1.focus();
	 return false;
	 }
	 
	
	  else if(document.f1.t5.value.search(phn)==-1)
    {
	 alert("enter correct phone no");
	 document.f1.t5.focus();
	 return false;
	 }
	 
	
  else if(document.f1.t6.value.search(add)==-1)
    {
	 alert("enter correct address of length 10 to 150");
	 document.f1.t6.focus();
	 return false;
	 }
	
	 
	 
	 
	else if(document.f1.t7.value.search(city)==-1)
    {
	 alert("enter correct city");
	 document.f1.t7.focus();
	 return false;
	 }
	 
		else if(document.f1.t8.value.search(city)==-1)
    {
	 alert("enter correct country");
	 document.f1.t8.focus();
	 return false;
	 }
	 
	 else 
	{
	 return true;
	 }
	 }
	
	 
</script> 
</head>
<body>


<div><br/><center><h2><font face="Lucida Handwriting" size="+1" color="#00CCFF">Register Yourself</font></h2></center></div>
<br>
<div>
<center><div style="width:100%;float:right" align="center">
<fieldset style="width:50%">
<br><br>
<form method="post" name="f1" onSubmit="return vali()">
<table width="466" border="0" align="center">
  <tr>
    <td width="164"><div align="center"><font ><b> First&nbsp;Name:</b></font></div></td>
    <td width="192">
      
        <input name="t1" type="text" id="t1" onChange="return fnam()">    </td>
  </tr>
  <tr>
    <td><div align="center"><font ><strong>Last name:</strong></font></div></td>
    <td><input name="t2" type="text" id="t2" onChange="return lnam()" ></td>
  </tr>
  <tr>
    <td><div align="center"><font ><b>&nbsp;Enter Email : </b></font></div></td>
    <td><input name="t3" type="text" id="t3" onChange="return email()"></td>
  </tr>
  <tr>
    <td><div align="center"><font ><b>&nbsp;Choose a  Password:</b> </font></div></td>
    <td><input name="p1" type="text" id="p1" onChange="return pass()"></td>
  </tr>
  <tr> <td><div align="center"><font ><b>Phone no: </b></font></div></td>
    <td><input name="t5" type="text" id="t5" onChange="return phone()"></td>
  </tr>
  <tr>
    <td><div align="center"><font ><strong>Address:</strong></font></div></td>
    <td><label>
      <textarea name="t6" id="t6" value="return add()"></textarea>
    </label></td>
  </tr>
  <tr>
    <td colspan="2"><label><br>
    <center>
      <input name="sub" type="submit" id="sub" value="Create my Account">
    </center>
    </label></td>
    </tr>
 
</table>
 </form>
</fieldset>
</div>
</center>

</div>

</body>
</html>