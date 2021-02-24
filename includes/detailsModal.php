<?php
 require_once '../core/init.php';
  $id = $_POST['id'];
  $id = (int)$id;
  $sql = "SELECT * FROM products WHERE id = '$id'";
  $result = $db->query($sql);
  $product = mysqli_fetch_assoc($result);
  $prodCatId = $product['categories'];
  
  $categoryQ = $db->query("SELECT * FROM categories WHERE id = '$prodCatId'");
  $result_cat = $categoryQ->fetch_assoc();

  $brand_id = $product['brand'];
  $sql2 = "SELECT brand FROM brand WHERE id = '$brand_id'";
  $brand_query = $db->query($sql2);
  $brand = mysqli_fetch_assoc($brand_query);
  $sizeString = $product['sizes'];
  $size_array = explode(',',$sizeString);
 ?>
<!--DETAILS MODAL-->
<?php ob_start(); ?>

  <div class="modal fade details-1" id="details-modal" tabindex="-1" role="dialog" aria-labelledby="details-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
     <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" onclick="closeModal()" aria-label="close">
            <span aria-hidden="true">&times;</span>
           </button>
           <h4 class="modal-title text-center"><?= $product['title']; ?></h4>
         </div>
         <div class="modal-body">
           <div class="container-fluid">
             <div class="row">
               <span id="modal_errors" class="bg-danger"></span>
               <div class="col-sm-6 fotorama">
                 <?php $photos = explode(',',$product['image']);
                 foreach ($photos as $photo):
                 ?>
                 <div class="center-block ">
                   <img src="<?= $photo; ?>" alt="" class="details img-thumbnail" width = 200 height = 100>
                 </div>
               <?php endforeach; ?>
               </div>
               <div class="col-sm-6">
                 <h4>Details</h4>
                 <p><?= $product['description']; ?></p>
                 <hr>
                 <p>Price: <?= money($product['price']); ?></p>
                 <p>Brand: <?= $brand['brand']; ?></p>
                 <!--<form action="add_cart.php" method="post" id="add_product_form">-->
                     <form onsubmit="return false" id="add_product_form">
                   <input type="hidden" name="product_id" value="<?= $id ;?>">
                   <!--<input type="hidden" name="available" id="available" value="100">-->
                   <div class="form-group">
                     <div class="col-xs-3">
                       <label for="quantity">Quantity:</label>
                       <input type="number" name="quantity" class="form-control"  id="quantity" min="0">
                     </div>
                    <br>
                   </div>
                   <br><br>
               
    
                   <?php if($result_cat["parent"] == 3 || $result_cat["parent"] == 60):?>
                   <div class="form-group">
                     <div class="col-xs-9">
                       <label for="size">Size:</label>
                       <select class="form-control" name="size" id="size">
                         <option value="">Please choose one</option>
                         <?php
                            foreach ($size_array as $string) {
                              $stringArray = explode(':', $string);
                              $size = $stringArray[0];
                              $available = $stringArray[1];
                              if ($available > 0) {
                                  echo '<option value="'.$size.'" data-available="'.$available.'">'.$size.' ('.$available.' Available)</option>';
                              }
                            }
                         ?>
                      </select>
                     </div>
                   </div><!--end size block-->
                   <?php endif;?>
                 </form>
               </div>
             </div>
           </div>
         </div>
         <div class="modal-footer">
           <button class="btn btn-default" onclick="closeModal()">close</button>
           <button class="btn btn-warning" onclick="add_to_cart();return false;"><span class="glyphicon glyphicon-shopping-cart"></span>Add To cart</button>
         </div>
       </div>
     </div>
</div>
 <script>
jQuery('#size').change(function(){
  var available = jQuery('#size option:selected').data("available");
  jQuery('#available').val(available);
});

$(function () {
  $('.fotorama').fotorama({'loop': true, 'autoplay':true});
});

   function closeModal(){
      jQuery('#details-modal').modal('hide');
      setTimeout(function(){
        jQuery('#details-modal').remove();
        jQuery('.modal-backdrop').remove();
      }, 500);
   }
 </script>
<?php echo ob_get_clean(); ?>
