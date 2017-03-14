<?php include 'header.php';?>
<form name="f1">
<input type="hidden" name="h1" value="0" />
</form>
<div><br/><center><h2><font face="Lucida Handwriting"  color="#000">Latest Products</font></h2></center></div>
<form action="order.php" method="post">
<?php
$product=mysqli_query($con,"SELECT * FROM product");
while($fproduct=mysqli_fetch_array($product))
{
echo "
<div style='width:30%; text-align:center; border:1px solid #000; padding:5px'>
<img src='itempics/$fproduct[ProductID].jpg' width='200' height='200'><br>
$fproduct[productName]<br>
Rs. $fproduct[Price]<br>
<hr/>
<b><input type='checkbox' name='product[]' value='$fproduct[ProductID]'> Add to Cart</b>
</div>
<br><br>
";
}
?>
<center><input type='submit' name='buy' value='Buy Now'></center>
<br><br>
</form>
<?php include 'footer.php';?>
