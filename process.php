<?php 
require_once 'core/init.php';

     if(isset($_POST["fdbk_name"])){
              
              $fdbk_name = $_POST["fdbk_name"];
              $fdbk_message = $_POST["fdbk_message"];
              
              $inserSql = "INSERT INTO feedback (`fd_name`, `fd_message`) VALUES('$fdbk_name', '$fdbk_message')";
        
            //   $db->query($inserSql);
              
              if($db->query($inserSql)){
                  
                //   header("Location: index.php");
                
                echo "Your feedback has been added!..";
              }
              
              exit();
          }
          
    // if (isset($_POST['email'])) {
        
    //     echo "okayyyyyyyyyyyy";
    // }

 ?>