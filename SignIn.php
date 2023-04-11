<html>
<body>
<?php  
$servername = "localhost";
 $username = "Games";
 $password = "Games";
 $dbname = "Games";
 try {
 $conn = new mysqli($servername, $username, $password, $dbname);
 if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
 } 
 
  $resultpw = $conn->query("SELECT password From user
  Where name = '".$_GET["Uname"]."'");
  if ($row = $resultpw->fetch_assoc()) {
  if ($row["password"]==$_GET["Pw"]) {
    echo "accsess granted";
    $cookie_name = "user";
    $cookie_value = $_GET["Uname"];
    setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day
    $cookie_name = "password";
    $cookie_value = $_GET["Pw"];
    setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day
  } else echo "accsess denied";
}
 } catch (Exception $e) {
   echo 'and the error is: ', $e->getMessage(), "\n";
  }
  $conn->close();
?>

</body>
</html> 