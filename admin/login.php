<?php
 require_once $_SERVER['DOCUMENT_ROOT'].'/eCommerce/core/init.php';
 include 'includes/head.php';

 //created by Gedeon Gibango Pretoria South Africa January 2018
$email = ((isset($_POST['email']))?sanitize($_POST['email']):'');
$email = trim($email);
$password = ((isset($_POST['password']))?sanitize($_POST['password']):'');
$password = trim($password);
//$hashed = password_hash($password, PASSWORD_DEFAULT);
$errors = array();
 ?>
 <style>
   body{
     background-image: url("/eCommerce/images/headerlogo/logo_mhd.png");
     background-size: 50vw 50vh;
   }
 </style>
 <div id="login-form">
   <div class="">
     <?php
            if ($_POST) {
              # form validation
              if (empty($_POST['email']) || empty($_POST['password']) ) {
                $errors[] = 'You must provide  email and password.';
              }

              //validate email
              if (!Filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $errors[]= 'You must enter a valid email.';
              }

              //password is more than 6 characters
              if (strlen($password) < 6) {
                $errors[] = 'Password must be at least 6 characters.';
              }


              //check if email exist in the database
              $query = $db->query("SELECT * FROM users WHERE email = '$email' AND featured = 1");
              $user = mysqli_fetch_assoc($query);
              $userCount = mysqli_num_rows($query);
              if ($userCount < 1) {
                $errors[] ='That email doesn\'t exist in our database';
              }

              if (!password_verify($password, $user['password'])) {
                $errors[] = 'The password does not match our records. Please try again.';
              }

              //check for errors
              if (!empty($errors)) {
                echo display_errors($errors);
              }else {
                //log user in
                $user_id = $user['id'];
                login($user_id);
                
                header('Location: index.php');
                echo "<h3><a href='index.php'>Click to start</a></h3>";
                exit();
              }
            }
           ?>
   </div>
   <h2 class="text-center">Login</h2>
   <form action="login.php" method="post">
   
     <div class="form-group">
       <label for="email">Email:</label>
       <input type="text" name="email" id="email" class="form-control" value="<?= $email;?>" >
     </div>
     <div class="form-group">
       <label for="password">Password:</label>
       <input type="password" name="password" id="password" class="form-control" value="<?= $password;?>" >
     </div>
     <div class="form-group">
       <input type="submit" class="btn btn-primary" value="Login" >
     </div>
   </form>
   <p class="text-right"><a href="../index.php" title="Clicck to visit">Visit web here</a> </p>
 </div>
 <?php include 'includes/footer.php'; ?>
 
 
 
<script>
    
    //  $(document).ready(function(){
        
    //   $("#login_form").submit(function(){
            
    //         //alert("submiteed");
            
    //         $.ajax({
                
    //             url: "../process.php", 
    //             method: "post",
    //             data:  $("#login_form").serialize(),
    //             success: function(response){
                    
    //                 alert(response);
                  
    //                 window.location.href="index.php";
    //             }
    //         })
    //     })
 
    //  });
</script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
