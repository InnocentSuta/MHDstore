<?php
 require_once $_SERVER['DOCUMENT_ROOT'].'/eCommerce/core/init.php';
 if (!is_logged_in()) {
   loggin_error_redirect();
 }
 include 'includes/head.php';
 include 'includes/navigation.php';
 //Delete  Products
 if (isset($_GET['delete'])) {
   $id = sanitize($_GET['delete']);
   $db->query("UPDATE products SET deleted = 1 WHERE id= '$id'");
   header('Location: products.php');
 }
 $dbpath= '';
 if (isset($_GET['add']) || isset($_GET['edit'])) {
    $brandQuery = $db->query("SELECT * FROM brand ORDER BY brand");
    $parentQuery = $db->query("SELECT * FROM categories WHERE parent = 0 ORDER BY category");
    $title = ((isset($_POST['title']) && $_POST['title']!= '')?sanitize($_POST['title']):'');
    $brand = ((isset($_POST['brand']) && !empty($_POST['brand']))?sanitize($_POST['brand']):'');
    $parent= ((isset($_POST['parent']) && !empty($_POST['parent']))?sanitize($_POST['parent']):'');
    $category= ((isset($_POST['child']) && !empty($_POST['child']))?sanitize($_POST['child']):'');
    $price = ((isset($_POST['price']) && $_POST['price']!= '')?sanitize($_POST['price']):'');
    $list_price = ((isset($_POST['list_price']) && $_POST['list_price']!= '')?sanitize($_POST['list_price']):'');
    $description = ((isset($_POST['description']) && $_POST['description']!= '')?sanitize($_POST['description']):'');
    $sizes = ((isset($_POST['sizes']) && $_POST['sizes']!= '')?sanitize($_POST['sizes']):'');
    $sizes = rtrim($sizes, ',');
    $saved_image = '';
   if (isset($_GET['edit'])) {
      $edit_id = (int)$_GET['edit'];
      $productResult = $db->query("SELECT * FROM products WHERE id = '$edit_id'");
      $proRow = mysqli_fetch_assoc($productResult);
        if (isset($_GET['delete_image'])) {
            $imgi = (int)$_GET['imgi'] - 1;
            $images = explode(',',$proRow['image']);
            $image_url = $_SERVER['DOCUMENT_ROOT'].$images[$imgi];
            unlink($image_url);
            unset($images[$imgi]);
            $imageString = implode(',',$images);
            $db->query("UPDATE products SET image = '{$imageString}' WHERE id= '$edit_id'");
            header('Location: products.php?edit='.$edit_id);
        }
        $category = ((isset($_POST['child']) && $_POST['child']!= '')?sanitize($_POST['child']):$proRow['categories']);
        $title = ((isset($_POST['title']) && $_POST['title']!= '')?sanitize($_POST['title']):$proRow['title']);
        $brand = ((isset($_POST['brand']) && $_POST['brand']!= '')?sanitize($_POST['brand']):$proRow['brand']);
        $parentQ= $db->query("SELECT * FROM categories WHERE id ='$category'");
        $parentResult = mysqli_fetch_assoc($parentQ);
        $parent = ((isset($_POST['parent']) && $_POST['parent']!= '')?sanitize($_POST['parent']):$parentResult['parent']);
        $price = ((isset($_POST['price']) && $_POST['price']!= '')?sanitize($_POST['price']):$proRow['price']);
        $list_price = ((isset($_POST['list_price']) && $_POST['list_price']!= '')?sanitize($_POST['list_price']):$proRow['list_price']);
        $description = ((isset($_POST['description']) && $_POST['description']!= '')?sanitize($_POST['description']):$proRow['description']);
        $sizes = ((isset($_POST['sizes']) && $_POST['sizes']!= '')?sanitize($_POST['sizes']):$proRow['sizes']);
        $sizes = rtrim($sizes, ',');
        $saved_image = (($proRow['image'] != '')?$proRow['image']:'');
        $dbpath = $saved_image;
   }
   if (!empty($sizes)) {
     $sizeString = sanitize($sizes);
     $sizeString = rtrim($sizeString,',');
     $sizesArray = explode(',',$sizeString);
     $sArray = array();
     $qArray = array();
     $tArray = array();
     foreach ($sizesArray as $ss) {
       $s = explode(':', $ss);
       $sArray[] = $s[0];
       $qArray[] = $s[1];
       $tArray[] = $s[2];
     }
   }else {
     $sizesArray = array();
   }

   if ($_POST) {
     //$dbpath = '';
     $errors =array();
     $required = array('title', 'brand', 'price', 'parent', 'child');
     $allowed = array('png', 'jpg', 'jpeg', 'gif');
     $tmpLoc = array();
     $uploadPath = array();
     foreach ($required as $field) {
       if ($_POST[$field] == '') {
            $errors[] = 'All field With and Asterisk are required';
            break;
       }
     }
     $photoCount = count($_FILES['photo']['name']);
     if ($photoCount > 0) {
        for ($i=0; $i < $photoCount; $i++) {
          $name = $_FILES['photo']['name'][$i];
          $nameArray = explode('.',$name);
          $fileName = $nameArray[0];
          $fileExt =$nameArray[1];
          $mine = explode('/',$_FILES['photo']['type'][$i]);
          $mineType = $mine[0];
          $mineExt = $mine[1];
          $tmpLoc[] = $_FILES['photo']['tmp_name'][$i];
          $fileSize = $_FILES['photo']['size'][$i];
          $uploadName = md5(microtime()).'.'.$fileExt;
          $uploadPath[] = '../images/products/'.$uploadName;
          if ($i != 0) {
            $dbpath .= ',';
          }
          $dbpath .= '/eCommerce/images/products/'.$uploadName;
        if ($mineType != 'image') {
          $errors[] = 'The file must be the image.';
        }
        if (!in_array($fileExt, $allowed)) {
           $errors[] = 'The file extension must be a png, jpg, or jpeg';
        }
        if ($fileSize > 15000000) {
          $errors[] = 'The file size must be under 15MB';
        }
        if ($fileExt != $mineExt && ($mineExt == 'jpeg' && $fileExt != 'jpg')) {
          $errors[] = 'The file extension does not match the file.';
        }
  }//end for
     }
     if (!empty($errors)) {
       echo display_errors($errors);
     }else {
       //update database
       if ($photoCount > 0) {
         for ($i=0; $i < $photoCount; $i++) {
          move_uploaded_file($tmpLoc[$i], $uploadPath[$i]);
      }
    }
       $inserSql = "INSERT INTO products (`title`, `price`, `list_price`, `brand`, `categories`, `sizes`, `image`, `description`)
        VALUES('$title', '$price', '$list_price', '$brand', '$category', '$sizes', '$dbpath', '$description')";
        if (isset($_GET['edit'])) {
           $inserSql ="UPDATE products SET title = '$title', price = '$price', list_price = '$list_price', brand = '$brand',
           categories = '$category', sizes = '$sizes', image = '$dbpath', description = '$description' WHERE id = '$edit_id'";
        }
        $db->query($inserSql);
       header('Location: products.php');
     }
   }
   ?>
   <h2 class="text-center"><?= ((isset($_GET['edit']))?'Edit ':'Add A New ');?> Product</h2><hr>
   <form action="products.php?<?= ((isset($_GET['edit']))?'edit='.$edit_id:'add=1');?> " method="post" enctype="multipart/form-data">
     <div class="form-group col-md-3">
      <label for="title">Title*:</label>
      <input type="text" class="form-control" name="title" id="title" value="<?= $title ;?>">
     </div>
     <div class="form-group col-md-3">
       <label for="brand">Brand*:</label>
       <select class="form-control" id="brand" name="brand">
         <option value=""<?= (($brand== '')?' Selected':'');?>></option>
         <?php while ($brand_row = mysqli_fetch_assoc($brandQuery)):?>
           <option value="<?= $brand_row['id'];?>"<?= (($brand == $brand_row['id'])?' Selected':'');?>><?= $brand_row['brand'];?></option>
         <?php endwhile; ?>
       </select>
     </div>
     <div class="form-group col-md-3">
       <label for="parent">Parent Category*:</label>
      <select class="form-control" name="parent" id="parent">
        <option value=""<?= (($parent == '')?' selected':'');?>></option>
        <?php while($parent_row = mysqli_fetch_assoc($parentQuery)): ?>
          <option value="<?= $parent_row['id'];?>"<?= (($parent == $parent_row['id'])?' selected':'');?>><?= $parent_row['category'];?></option>
        <?php endwhile ?>
      </select>
     </div>
     <div class="form-group col-md-3">
       <label for="child">Child Category*:</label>
      <select class="form-control" name="child" id="child">
      </select>
     </div>
     <div class="form-group col-md-3">
       <label for="price">Price*:</label>
       <input type="text" id="price" name="price" value="<?= $price ;?>" class="form-control">
     </div>
     <div class="form-group col-md-3">
       <label for="list_price">List Price:</label>
       <input type="text" id="list_price" name="list_price" value="<?= $list_price ;?>" class="form-control">
     </div>
     <div class="form-group col-md-3">
       <label>Quantity & Sizes*:</label>
       <button class="btn btn-default form-control" onclick="jQuery('#sizesModal').modal('toggle'); return false">Quantity & Sizes</button>
     </div>
     <div class="form-group col-md-3">
       <label for="sizes">Sizes & Qty Preview</label>
       <input type="text" class="form-control" name="sizes" id="sizes" value="<?=$sizes ;?>" readonly>
     </div>
     <div class="form-group col-md-6">
       <?php if($saved_image != ''):?>
         <?php
             $imgi = 1;
             $images = explode(',', $saved_image);
          ?>
          <?php foreach($images as $image): ?>
         <div class="saved-image col-md-4">
           <img src="<?= $image ;?>" alt="saved image"><br>
           <a href="products.php?delete_image=1&edit=<?= $edit_id ;?>&imgi=<?=$imgi ;?>" class="text-danger">Delete image</a>
         </div>
       <?php
           $imgi++;
     endforeach;
       ?>
       <?php else: ?>
        <label for="photo">Product Photo:</label>
       <input type="file" name="photo[]" id="photo" class="form-control" value="" multiple>
       <?php endif; ?>
     </div>
     <div class="form-group col-md-6">
       <label for="description">Description:</label>
       <textarea id="description" name="description" class="form-control" rows="8" cols="80"><?=$description ;?></textarea>
     </div>
     <div class="form-group pull-right">
       <a href="products.php" class="btn btn-default">Back</a>
       <input type="submit" value="<?= ((isset($_GET['edit']))?'Edit ':'Add A New');?> Product" class="btn btn-success">
     </div><div class="clearfix"></div>
   </form>
   <!-- Modal -->
<div class="modal fade" id="sizesModal" tabindex="-1" role="dialog" aria-labelledby="sizesModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="sizesModalLabel">Size & Quantity</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <?php for ($i = 1; $i <= 12 ; $i++): ?>
            <div class="form-group col-md-2">
              <label for="size<?= $i ;?>">Size:</label>
              <input type="text" name="size<?= $i ;?>" id="size<?= $i;?>" value="<?= ((!empty($sArray[$i-1]))?$sArray[$i-1]:'') ;?>" class="form-control">
            </div>
            <div class="form-group col-md-2">
              <label for="qty<?= $i;?>">Quantity:</label>
              <input type="number" name="qty<?= $i;?>" id="qty<?= $i;?>" value="<?= ((!empty($qArray[$i-1]))?$qArray[$i-1]:'') ;?>" min="0" class="form-control">
            </div>
            <div class="form-group col-md-2">
              <label for="threshold<?= $i;?>">Threshold:</label>
              <input type="number" name="threshold<?= $i;?>" id="threshold<?= $i;?>" value="<?= ((!empty($tArray[$i-1]))?$tArray[$i-1]:'') ;?>" min="0" class="form-control">
            </div>
          <?php endfor; ?>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="updateSizes();jQuery('#sizesModal').modal('toggle'); return false">Save changes</button>
      </div>
    </div>
  </div>
</div>
<?php }else {
 $product_sql="SELECT * FROM products WHERE deleted = 0";
 $product_result = $db->query($product_sql);
 if (isset($_GET['featured'])){
   $id = (int)$_GET['id'];
   $featured= (int)$_GET['featured'];
   $featureSql="UPDATE products SET featured = '$featured' WHERE id = '$id'";
   $db->query( $featureSql);
   header('Location: products.php');
 }
 ?>
 <h2 class="text-center">Products</h2>
 <a href="products.php?add=" class="btn btn-success pull-right" id="add-product-btn">Add Product</a>
 <div class="clearfix"></div>
 <hr>
 <table class="table table-bordered table-condensed table-striped">
   <thead class="text-cente">
     <th></th>
     <th>Product</th>
     <th>Price</th>
     <th>Category</th>
     <th>Featured</th>
     <th>Sold</th>
   </thead>
   <tbody>
     <?php while($product_row = mysqli_fetch_assoc($product_result)):
       $childID = $product_row['categories'];
       $catSql = "SELECT * FROM categories WHERE id = '$childID'";
       $cat_result = $db->query($catSql);
       $child = mysqli_fetch_assoc($cat_result);
       $parentID = $child['parent'];
       $parentSql ="SELECT * FROM categories WHERE id = '$parentID'";
        $parent_result = $db->query($parentSql);
       $parent = mysqli_fetch_assoc($parent_result);
       $category = $parent['category']. '-'.  $child['category'];
       ?>
       <tr>
         <td>
           <a href="products.php?edit=<?= $product_row['id'];?>" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-pencil"></span></a>
           <a href="products.php?delete=<?= $product_row['id'];?>" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-remove"></span></a>
         </td>
         <td><?= $product_row['title'];?></td>
         <td><?= money($product_row['price']) ; ?></td>
         <td><?= $category ;?></td>
         <td><a href="products.php?featured=<?= (($product_row['featured'] == 0)?'1':'0');?>&id=<?= $product_row['id'];?>" class="btn btn-xs btn-default">
           <span class="glyphicon glyphicon-<?= (($product_row['featured'] == 1)?'minus':'plus'); ?>"></span>
         </a>&nbsp;<?= (($product_row['featured'] == 1)?'Featured Product':'');?></td>
         <td><?= $product_row['deleted'];?></td>
       </tr>
     <?php endwhile;?>
   </tbody>
 </table>
<?php } include 'includes/footer.php';  ?>
<script>
  jQuery('document').ready(function(){
    get_child_options('<?= $category ;?>')
  });
</script>
