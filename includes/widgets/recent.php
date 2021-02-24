
<?php
  $transQ = $db->query("SELECT * FROM cart WHERE paid = 1 ORDER BY id DESC LIMIT 5");
  $results = array();
  while ($row = mysqli_fetch_assoc($transQ)) {
    $results[] = $row;
  }
  $row_count = $transQ->num_rows;
  $used_ids = array();
  for ($i=0; $i < $row_count; $i++) {
    $json_items = $results[$i]['items'];
    $items = json_decode($json_items,true);
    foreach ($items as $item) {
      if (!in_array($item['id'], $used_ids)) {
      $used_ids[] = $item['id'];
      }
    }
  }
 ?>
 <h3 class="text-center"></h3>
<div id="recent_widget" style="border: 1px solid #333;
              background-color: #64dd17;
              border-radius: 5px;
              padding: 16px;
              height:  350px;" align="center">
  <table class="table table-condensed">
    <?php /*foreach ($used_ids as $id):
        $productQ = $db->query("SELECT  id, title FROM products WHERE id = '{$id}'");
        $product = mysqli_fetch_assoc($productQ);*/
      ?>
        <tr>
          
            <marquee direction="down" behavior="alternate"S>
              <marquee behavior="alternate">Advert1</marquee>
            </marquee>
          
          
          <td><marquee>Advert2</marquee></td>
        </tr>
     
        
    <?php //endforeach ?>
  </table>
  

 
</div>

<!-- <div class="fotorama">
         
     <div class="center-block ">
       <img src="ad.jpg" alt="" class="" width = 200 height = 100>
     </div>
     
</div> -->
