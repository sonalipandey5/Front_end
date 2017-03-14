
  <form name="f1">
  <input type="hidden" name="h1" value="0" />
  </form>
  <div><br/><center><h2><font face="Lucida Handwriting"  color="#000">Latest Products</font></h2></center></div>
<?php
$product=mysqli_query($con,"SELECT count(salestatement.Quantity) as sold, product.* FROM salestatement,product WHERE salestatement.ProductId=product.ProductId);
while($fproduct=mysqli_fetch_array($product))
{
echo "
<div style='width:20%; text-align:center; border:1px solid #000; padding:5px'>
<img src='$fproduct[ImagePath]'><br>
$fproduct[productName]<br>
</div>
";
}
?>
