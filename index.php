<?php
include('files/login.php'); // Includes Login Script

if(isset($_SESSION['login_user'])){
header("location: files/profile.php");
}
?>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Acceuil</title>
  <link rel="stylesheet" href="stylesheets/style.css">
</head>

<body>
  <body>
    <form  action="files/login.php" method="post">
      <div class="login">
        <div class="login-screen">
            <div class="login-logo">
              <img src="images/logo.png" alt="logo">
            </div>

          <div class="login-form">
            <div class="control-group">
            <input type="text" name="num_omrane" class="login-field" placeholder="ID omrane" id="login-name">
            </div>

            <div class="control-group">
            <input type="password" name="password" class="login-field" placeholder="Mot de passe" id="login-pass">
            </div>
            <button class="btn btn-primary btn-large btn-block" type="submit" name="submit">Connexion</button>


          </div>
        </div>
      </div>

    </form>

</body>


</body>
</html>
