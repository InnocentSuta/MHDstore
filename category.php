<?php
require_once 'core/init.php';
include 'includes/head.php';
include 'includes/navigation.php';
include 'includes/headerpartial.php';
include 'includes/leftSideBar.php';

if (isset($_GET['cat'])) {
   $cat_id = sanitize($_GET['cat']);
}else {
  $cat_id = '';
}
$sql="SELECT * FROM  products WHERE categories = '$cat_id' AND featured = 1";
$productQ = $db->query($sql);
$category = get_category($cat_id);
?>
      <!--MAIN CONTENT-->
      <div class="col-md-8">
        <div class="row">
          <h2 class=" text-center"><?= $category['parent'].' '.$category['child'];?></h2>
          <?php
            while ($product = mysqli_fetch_assoc($productQ)): ?>
          <div class="col-md-3 text-center" style="margin-top:12px;">
            <div style="border: 1px solid #333;
							background-color: #f1f1f1;
							border-radius: 5px;
							padding: 16px;
							height:  350px;" align="center">
            <h4><?= $product['title'];  ?></h4>
            <?php $photos = explode(',',$product['image']);?>
            <img src="<?=  $photos[0]; ?>" alt="<?= $product['title'];  ?>" width=150 height=150>
            <p class="list-price text-danger">List price: <s><?= money($product['list_price']);  ?></s></p>
            <p class="price">Our price: <?= money($product['price']);  ?></p>
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
