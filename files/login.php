<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
if (empty($_POST['num_omrane']) || empty($_POST['password'])) {
$error = "ID omrane ou Mot de passe est invalide !";
}
else
{
// Define $username and $password
$num_omrane=$_POST['num_omrane'];
$password=$_POST['password'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
$connection = mysql_connect("localhost", "root", "");
// To protect MySQL injection for Security purpose
$num_omrane = stripslashes($num_omrane);
$password = stripslashes($password);
$num_omrane = mysql_real_escape_string($num_omrane);
$password = mysql_real_escape_string($password);
// Selecting Database
$db = mysql_select_db("social", $connection);
// SQL query to fetch information of registerd users and finds user match.
$query = mysql_query("select * from personnel where mdp='$password' AND 	N_omran='$num_omrane'", $connection);
$rows = mysql_num_rows($query);
if ($rows == 1) {
$_SESSION['login_user']=$num_omrane; // Initializing Session
header("location: profile.php"); // Redirecting To Other Page
} else {
$error = "ID omrane ou Mot de passe est invalide !";
}
mysql_close($connection); // Closing Connection
}
}
?>
