</div><br><br>

<div class="col-md-12 text-center navbar navbar-inverse navbar-static-bottom">
  <div class="container">
    <div class="navbar-text pull-left">
      &copy; 2019 MHDstore
    </div>
    <div class=" navbar-text pull-right">
      <p>Powered by <i>MHD<i> <span></span> </p>
      </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
<script>
function updateSizes(){
  var sizeString = '';
  for (var i = 1; i <= 12; i++) {
    if (jQuery('#size' + i).val()!= '') {
      sizeString += jQuery('#size'+i).val()+':'+ jQuery('#qty'+i).val()+':'+jQuery('#threshold'+i).val()+',';
    }
  }
  jQuery('#sizes').val(sizeString);
}

function get_child_options(selected){
  if (typeof selected === 'undefined') {
    var selected ='';
  }
  var parentID = jQuery('#parent').val();
  jQuery.ajax({
    url:'/eCommerce/admin/parsers/child_categories.php',
    type: 'POST',
    data: {parentID : parentID, selected: selected},
    success: function(data){
      jQuery('#child').html(data);
    },
    error : function(){alert("Something went wrong with the child option.")}
  });
}
  jQuery('select[name="parent"]').change(function(){
    get_child_options();
  });
</script>
﻿  </body>
﻿</html>
