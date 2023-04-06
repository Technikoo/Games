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
  Where name = '"$_GET["Uname"]"'");
  if ($resultpw==$_GET["Pw"]) {
    echo "accsess granted";
  } else echo "accsess denied";
 }
  $conn->close();
?>

</body>
</html> 