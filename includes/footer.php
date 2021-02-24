</div><br><br>

<div class="col-md-12 text-center navbar navbar-inverse navbar-fixed">
  <div class="container">
    <div class="navbar-text pull-left">
      &copy; 2019 MHDstore | <a href="#" data-toggle="modal" data-target="#terms">Terms and Conditions</a>
    </div>
    <div class=" navbar-text pull-right">
      <p>Powered by <i>MHD<i> <span></span> </p>
      </div>
  </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!--<script src="js/fotorama.js"></script>-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<script>
  function detailsModal(id){
    var data = {"id" : id};
    jQuery.ajax({
     url : 'includes/detailsModal.php',
     method : "post",
     data : data,
     success: function(data){
       jQuery('body').append(data);
       jQuery('#details-modal').modal('toggle');
     },
     error: function(){
       alert("Something went wrong!");
     },
    });
  }

  function update_cart(mode, edit_id, edit_size){
    var data = {"mode": mode, "edit_id": edit_id, "edit_size": edit_size};
    jQuery.ajax({
        url    : '/eCommerce/admin/parsers/update_cart.php',
        method : "post",
        data   : data,
        success: function(){location.reload();},
        error  :function(){alert("Something went wrong!");},
    });
  }

  function add_to_cart(){
  jQuery('#modal_errors').html("");
  var size = jQuery('#size').val();
  var quantity = jQuery('#quantity').val();
  var available = jQuery('#available').val();
  var error = '';
  var data = jQuery('#add_product_form').serialize();
  if (size == '' || quantity == '' || quantity == 0) {
    error += '<p class="text-danger text-center">You must choose a size and quantity.</p>';
    jQuery('#modal_errors').html(error);
    return;
  }else if (quantity > available) {
    error += '<p class="text-danger text-center">There are only '+available+' available.</p>';
    jQuery('#modal_errors').html(error);
    return;
  }else {
    jQuery.ajax({
      url : '/eCommerce/admin/parsers/add_cart.php',
      method : 'post',
      data : data,
      success : function(){
        location.reload();
      },
      error : function(){alert('Somthing went wrong');},

    });
  }
  }

</script>
﻿  </body>
﻿</html>
﻿
﻿<!--MODAL FOR TERMS AND CONDITIONS-->
       <!-- Modal -->
<div class="modal fade" id="terms" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
      </div>
      <div class="modal-body">
           <!-- START MODEL BODY -->
           <p>* All price include vat</p>
           <p>* Faulty good must be returned to relevant mhd store</p>
           <p>* If the return of goods takes place after 48hours from the date of the invoice, a credit will be passed, provided that goods are in same condition as on purchase date, include all manual softwares, original packaging and original tax invoice. No cash under any other circumstances.</p>
           <p>* Price and specifications are subject to changes without any prior notice.</p>
           <p>* Due to the software privacy no software will be refunded or exchanged.</p>
           <p>* A 10% deposit is required </p>
           <p>* Goods not collected within 7 working days will be sold.</p>
          <!-- END MODEL BODY -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
