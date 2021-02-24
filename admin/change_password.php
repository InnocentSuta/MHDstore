<?php
 require_once $_SERVER['DOCUMENT_ROOT'].'/eCommerce/core/init.php';
 if (!is_logged_in()) {
   loggin_error_redirect();
 }
 include 'includes/head.php';
 //created by Gedeon Gibango Pretoria South Africa January 2018
 $hashed = $user_data['password'];
 $old_password = ((isset($_POST['old_password']))?sanitize($_POST['old_password']):'');
 $old_password = trim($old_password);

 $password = ((isset($_POST['password']))?sanitize($_POST['password']):'');
 $password = trim($password);

 $confirm = ((isset($_POST['confirm']))?sanitize($_POST['confirm']):'');
 $confirm = trim($confirm);
 $new_hashed = password_hash($password, PASSWORD_DEFAULT);
 $user_id = $user_data['id'];
 $errors = array();
 ?>
 <style>
   body{
     background-image: url("/eCommerce/images/headerlogo/bg.jpg");
     background-size: 100vw 200vh;
   }
 </style>
 <div id="login-form">
   <div class="">
     <?php
            if ($_POST) {
              # form validation
              if (empty($_POST['old_password']) || empty($_POST['password']) || empty($_POST['confirm'])) {
                $errors[] = 'You must fill out all field.';
              }

              //password is more than 6 characters
              if (strlen($password) < 6) {
                $errors[] = 'Password must be at least 6 characters.';
              }

              //check if new password match Confirm
              if ($password != $confirm) {
                $errors[]= 'The new password and confirm new password does not match';
              }
              if (!password_verify($old_password, $hashed)) {
                $errors[] = 'Your old password does not match our records.';
              }

              //check for errors
              if (!empty($errors)) {
                echo display_errors($errors);
              }else {
                //change PASSWORD
                $db->query("UPDATE users SET password = '$new_hashed' WHERE id = '$user_id'");
                $_SESSION['success_flash'] ='Your password has been updated!';
                header('Location: index.php');
              }
            }
           ?>
   </div>
   <h2 class="text-center">Change Your password here</h2>
   <form action="change_password.php" method="post">
     <div class="form-group has-feedback">
             <input type="password" name="old_password" class="form-control" placeholder="Old password"  value="<?=$old_password;?>"/>
             <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           </div>
           <div class="form-group has-feedback">
             <input type="password" name="password"  class="form-control" placeholder="New Password" value="<?=$password ;?>"/>
             <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           </div>
           <div class="form-group has-feedback">
             <input type="password" name="confirm"  class="form-control" placeholder="Confirm new password" value="<?=$confirm ;?>"/>
             <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           </div>
          <div class="form-group text-center">
            <a href="index.php" class="btn btn-default">Cancel</a>
            <button type="submit" class="btn btn-primary">Change</button>
          </div>

   </form>
   <p class="text-right"><a href="../index.php" title="Clicck to visit">Visit web here</a> </p>
 </div>
 <?php include 'includes/footer.php'; ?>
