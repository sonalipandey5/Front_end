<?php
session_start();
include("config.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php
//error_reporting(1);
?>
<title>Apparel Shop</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="default.css" title="default">
</head>
<body>
<div id="WholePage">
<div id="Inner">
<div id="Container" style="border:groove; border-color:#00CCFF">
<div id="Head">
<div id="Head_left">
<div id="Name"><span class="blue">A</span><span>pparel</span>&nbsp;<span class="blue">S</span><span>hop</span> </div>
<div id="Informations">Online Faship Portal</div>
</div>
<div id="Head_right">
&nbsp;
</div>
</div>
<div id="Top_menu">
<a class="registration" href="register.php">Register</a>
<a class="log-in" href="login.php">Login</a>
<a class="home" href="index.php"><span>Home</span></a>
</div>
<div id="CentralPart">
<div id="LeftPart">
<div id="Menu">
<div id="Menu_header">
<div class="menu_header_left"> <span class="menu_text">Search</span>
</div>
<div class="menu_header_right"> </div>
<div id="Menu_content">		
		    <h5>&nbsp;</h5>
			<form method="post">
		    <input type="text" name="item" value="search" onfocus="if(this.value=='search'){this.value='';}"onBlur="if(this.value==''){this.value='search';}"/>
            <input name="search" type="submit" class="button" id="sub" value="Go" />
</form>
<h5>&nbsp;</h5>
		  <!--</form>-->
		

		<!-- End of Page Search --></span></a><br>
</div>
<div class="menu_header_right"> </div>
</div>
<div id="Menu_content">
<?php
require "config.php";// connection to database 
$q=mysqli_query($con,"select * from category");

while($n=mysqli_fetch_array($q)){
echo "<a class='menu_item' href='index.php?catg=$n[CategoryID]'>&raquo;<span>$n[CategoryName]</span></a><br>";
}
?>
</div>
</div>
</div>
<div id="RightPart">