<?php
require_once 'core/init.php';
include 'includes/head.php';
include 'includes/navigation.php';
include 'includes/headerpartial.php';
include 'includes/leftSideBar.php';

$sql= "SELECT * FROM products";
$cat_id = (($_POST['cat'] != '')?sanitize($_POST['cat']):'');

if ($cat_id == '') {
  $sql .= ' WHERE deleted = 0';
}else {
  $sql .= " WHERE categories = '{$cat_id}' AND deleted = 0";
}
$price_sort = (($_POST['price_sort'] != '')?sanitize($_POST['price_sort']):'');
$min_price = (($_POST['min_price'] != '')?sanitize($_POST['min_price']):'');
$max_price = (($_POST['max_price'] != '')?sanitize($_POST['max_price']):'');
$brand = (($_POST['brand'] != '')?sanitize($_POST['brand']):'');
if ($min_price != '') {
  $sql .= " AND price  >= '{$min_price}'";
}
if ($max_price != '') {
  $sql .= " AND price <= '{$max_price}'";
}
if ($brand != '') {
  $sql .=" AND brand = '{$brand}'";
}
if ($price_sort == 'low') {
  $sql .=" ORDER BY price";
}
if ($price_sort == 'high') {
    $sql .=" ORDER BY price DESC";
}
$productQ = $db->query($sql);
$category = get_category($cat_id);
?>
      <!--MAIN CONTENT-->
      <div class="col-md-8">
        <div class="row">
          <?php if ($cat_id != ''): ?>
            <h2 class="text-center"><?= $category['parent'].' '.$category['child'];?></h2>
          <?php else: ?>
            <h2 class="text-center">MHDstore</h2>
          <?php endif; ?>
          <?php while($product = mysqli_fetch_assoc($productQ)): ?>
            <div class="col-md-3 text-center" style="margin-top:12px;">
            <div style="border: 1px solid #333;
							background-color: #f1f1f1;
							border-radius: 5px;
							padding: 16px;
							height:  350px;" align="center">
              <h4><?= $product['title'];  ?></h4>
              <?php $photos = explode(',',$product['image']);?>
              <img src="<?=  $photos[0]; ?>" alt="<?= $product['title'];  ?>" width=150 height=150>
            <p class="list-price text-danger">List price: <s>$<?= $product['list_price'];  ?></s></p>
            <p class="price">Our price: $<?= $product['price'];  ?></p>
            <button type="button" class="btn btn-sm btn-success" onclick="detailsModal(<?= $product['id']; ?>)">Details</button>
            </div>
          </div>
        <?php endwhile; ?>
        </div>
      </div>
      <?php
      //RIGHT SIDE BAR
      include 'includes/rightSideBar.php';
      //FOOTER
      include 'includes/footer.php';
       ?>
