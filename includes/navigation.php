<?php
  $sql = "SELECT * FROM categories WHERE parent = 0";
  $pQuery = $db->query($sql);
 ?>
<!--navigation-->
<header>
  <nav class="navbar navbar-inverse navbar-fixed-top">
     <div class="container">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><!--To collapse content at the top while scroulling-->
            <span class="sr-only">Toggle Navigation</span><!--the name for your toggle-->
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
       <a href="index.php" class="navbar-brand"><span style="color: #1de9b6; font-size:36px; font-family:'Trattatello'">MHD</span><span style="color: #1de9b6; font-size:20px; font-family:'Roundhand'">Store</span></a>
         <div class="navbar-collapse collapse">
           <ul class="nav navbar-nav navbar-right">
             <?php while ($parent = mysqli_fetch_assoc($pQuery)): ?>
             <?php $parent_id = $parent['id'];
                 $sql2 = "SELECT * FROM categories WHERE parent = '$parent_id'";
                 $cquery = $db->query($sql2);
             ?>
               <!-- MENU ITEMS -->
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" style="color: #64dd17" data-toggle="dropdown"><?php echo $parent['category']; ?><span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <?php while ($child = mysqli_fetch_assoc($cquery)): ?>
                <li><a style="color: #64dd17" href="category.php?cat=<?= $child['id'];?>"><?php echo $child['category']; ?></a></li>
                <?php endwhile; ?>
              </ul>
             </li>
           <?php endwhile; ?>
           <li><a href="cart.php" style="color: #ffd600"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"></span></a></li>
           </ul>
         </div>
     </div>
  </nav>
</header>
