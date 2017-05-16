<?php
include('session.php');
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Profile </title>
  </head>
  <body>
    <h1>Bonjour dans votre profile ! <i><?php echo $login_session; ?></i></h1><br>
    <b id="logout"><a href="logout.php">Déconnexion</a></b>
  </body>
</html>
