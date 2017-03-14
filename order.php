<?php include 'header.php';?>
<div>
<br/>
<center>
<h2><font face="Lucida Handwriting" size="+2" color="#F00">My Cart</font></h2>
<table style='width:100%'>
<tr style='background:#000; color:#fff;'>
<th>Item Name</th> // header to table columns 
<th>Quantity</th>
<th>Price</th>
</tr>
<form action='confirm.php' method='post'>
<?php
$qt=$amt=0;
foreach($_REQUEST['product'] as $value)
{
$product=mysqli_query($con,"SELECT * FROM product WHERE ProductID='$value'");
$arr=mysqli_fetch_array($product);
$qty=1;
$amount=$qty*$arr['Price'];
$qt+=$qty;
//$qt = $qt + $qty
$amt+=$amount;
echo 
"<tr style='text-align:center;'> //second row of table
<td>$arr[productName]</td> //coloumn
<td><input type='number' name='qty' value='$qty' style='width:50px'></td>
//the qty of order by default is one but if we change the quantity to 3 the confirm page will get the value of quantity as 3
<td>$arr[Price]</td>
</tr>";
}
echo 
"<tr style='text-align:center; background:#000; color:#fff;'>
<td colspan=3></td> 
</tr>";
?>
</center>
</table>
<br>
<center><input type='submit' name='confirm' value='Confirm'></center>
</form>
</div>
<?php include 'footer.php';?>
