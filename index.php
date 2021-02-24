<?php
require_once 'core/init.php';
include 'includes/head.php';
include 'includes/navigation.php';
include 'includes/headerFull.php';
include 'includes/leftSideBar.php';


//retrieve feedback

$sql="SELECT * FROM  feedback";
  $result = $db->query($sql);


$sql="SELECT * FROM  products WHERE featured = 1 AND deleted = 0";
$featured = $db->query($sql);
?>
      <!--MAIN CONTENT-->
      <div class="col-md-8">
        <div class="row">
          <h2 class="text-center">Feature Products</h2>
          <?php
            while ($product = mysqli_fetch_assoc($featured)): ?>
          <div class="col-md-3 text-center" style="margin-top:12px;">
            <div style="border: 1px solid #333;
							background-color: #f1f1f1;
							border-radius: 5px;
							padding: 16px;
							height:  350px;" align="center">
            <h4><?= $product['title'];  ?></h4>
            <?php $photos = explode(',',$product['image']);?>
            <img src="<?= $photos[0]; ?>" alt="<?= $product['title'];?>" width=150 height=150>
            <p class="list-price text-danger">List price: <s><?= money($product['list_price']);  ?></s></p>
            <p class="price">Our price: <?= money($product['price']);  ?></p>
            <button type="button" class="btn btn-sm btn-success" onclick="detailsModal(<?= $product['id']; ?>)">Details</button>
            </div>
          </div>
        <?php endwhile; ?>
        </div>
        <hr>
         <div class="row">
          <h2 class="text-center">Customer feedbacks</h2>
          <div>
  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide" data-ride="carousel" id="quote-carousel">
      
<!-- Bottom Carousel Indicators -->
<ol class="carousel-indicators">
  <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
  <li data-target="#quote-carousel" data-slide-to="1"></li>
  <!--<li data-target="#quote-carousel" data-slide-to="2"></li>-->
</ol>
        
<!-- Carousel Slides / Quotes -->
<div class="carousel-inner">


    <!-- Quote 1 -->
<div class="item active">
  <div class="row">
    <div class="col-sm-12">
      <p class="text-center">I had an AWESOME experience at MHDstore,<br> 
      Anna my sale rep knew a lot about the car I was looking at and was very helpful in guiding me to my purchase</p>
      <div class="text-center">-- <small><strong>Tsepo</strong></small> --</div>
    </div>
  </div>
</div>

<!-- Quote 2 -->
 <?php while($row = $result->fetch_assoc()):?>
<div class="item">
      <div class="row">
        <div class="col-sm-12">
          <p class="text-center">&ldquo; <?= $row["fd_message"];?> &rdquo;</p>
          <div class="text-center">-- <small><strong><?php echo $row["fd_name"];?></strong></small> --</div>
        </div>
      </div>
    </div>
 <?php endwhile;?>
    
</div><!--carousel inner-->
        
      </div>                          
    </div>
  </div>
  <p>&nbsp;</p>

  <div class="text-center" ><button style="background-color: #ffd600; color: #000; font-size:36px; font-family:'Trattatello'; border-radius:10px;" 
  data-toggle="modal" data-target="#feedback">Leave feedback</button></div>
</div>
        </div>
      </div>
      
      <?php

      //MODAL DETAILS

      //RIGHT SIDE BAR
      include 'includes/rightSideBar.php';
      //FOOTER
      include 'includes/footer.php';
       ?>
       
       <?php 
       
        //   if(isset($_POST["fdbk_name"])){
              
        //       $fdbk_name = $_POST["fdbk_name"];
        //       $fdbk_message = $_POST["fdbk_message"];
              
        //       $inserSql = "INSERT INTO feedback (`fd_name`, `fd_message`) VALUES('$fdbk_name', '$fdbk_message')";
        
        //     //   $db->query($inserSql);
              
        //       if($db->query($inserSql)){
                  
        //         //   header("Location: index.php");
                
        //         echo "Your feedback has been added!..";
        //       }
        //   }
       ?>
       
       <!-- Modal -->
<div class="modal fade" id="feedback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add feedback</h4>
      </div>
      <div class="modal-body">
           <!-- START MODEL BODY -->
           <form id="feedback_form" autocomplete="off">
              <div class="form-group">
                <label>Your Name*</label>
                <input type="text" class="form-control" name="fdbk_name" placeholder="e.g Nokana" required>
                <small class="form-text text-muted" id="cat_error"></small>
              </div>
              <div class="form-group">
                <label>Message*</label>
                <textarea class="form-control" name="fdbk_message" required></textarea>
                <!--<input type="file" name="cat_photo" id="cat_photo" class="form-control">-->
              </div>
             
                <button type="submit" class="btn btn-primary" >Save</button>
            </form>
          <!-- END MODEL BODY -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script>
    $(document).ready(function(){
        
        $("#feedback_form").submit(function(){
            
            //alert("submiteed");
            
            $.ajax({
                
                url: "process.php", 
                method: "post",
                data:  $("#feedback_form").serialize(),
                success: function(response){
                    
                    alert(response);
                  
                    window.location.href="";
                }
            })
        })
        
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</script>
