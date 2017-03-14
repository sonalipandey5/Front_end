<?php include 'header.php';?>
<div>
<center>
<h2><font face="Lucida Handwriting" size="+2" color="#F00">Confirm Order</font></h2>
<br>
<?php
if(isset($_POST['finish']))
{
$cus=mysqli_query($con,"SELECT * FROM customer ORDER By customerID desc limit 0,1");
$fcu=mysqli_fetch_array($cus);
$id=$fcu['customerID']+1;
$cust=mysqli_query($con,"INSERT INTO customer VALUES('$id','$_POST[fname]','$_POST[lname]','$_POST[mobile]','$_POST[email]','$_POST[address]')");
$ship=mysqli_query($con,"INSERT INTO shipping VALUES('$_POST[orderid]','0','','$_POST[address]','$id')");
echo mysqli_error($con);
echo "
<br>
<br>
<br>
<br>
<h3>Your order is confirmed. Thank you for shopping with us</h3>
<br>
<br>
<br>
<br>
";
header("refresh:2; url=index.php");
}
else
{
?>
<form action="" method="post">
<table style='width:100%'>
<tr style='background:#000; color:#fff;'>
<th style='padding:5px'>Item Name</th>
<th>Quantity</th>
<th>Price</th>
<th>Amount</th>
</tr>
<?php
//$orderid=$_POST['orderid'];
$amt=$qt=0;
$product=mysqli_query($con,"SELECT product.*,salestatement.*,orders.* FROM product,salestatement,orders WHERE product.ProductID=salestatement.ProductID AND orders.SaleID=salestatement.SaleID AND orders.OrderID='$orderid' ORDER BY salestatement.OrderLine DESC");
while($arr=mysqli_fetch_array($product))
{
$amount=$arr['SaleQuantity']*$arr['Rate'];
$amt+=$amount;
$qt+=$arr['SaleQuantity'];
echo 
"<tr style='text-align:center;'>
<td>$arr[productName]</td>
<td>$arr[SaleQuantity]</td>
<td>$arr[Rate]</td>
<td>$amount</td>
</tr>";
}
echo 
"
<tr><td colspan=4><br></td></tr>
<tr style='text-align:center; background:#000; color:#fff;'>
<td style='padding:5px'>Total</td>
<td>$qt</td>
<td></td>
<td>$amt</td>
</tr>
<input type='hidden' name='orderid' value='$orderid'>
";
?>
</center>
</table>
<br>
<br>
<b>Buyer Details</b><br>
First Name: <input required type='text' name='fname'><br><br>
First Name: <input required type='text' name='lname'><br><br>
Mobile Number: <input required type='text' name='mobile'><br><br>
Email Address: <input required type='email' name='email'><br><br>
Shipping Address: <textarea required name='address'></textarea><br><br>
<br>
<center><input type='submit' name='finish' value='Confirm'></center>
</form>
<?php
}
?>
<br>
<br>
<br>
</div>
<?php include 'footer.php';?>
