<?php
echo '<pre>'; print_r($_POST); echo '</pre>';
 
 // Connect to database
 // Run the query
 // Display a message that it was successful or not
 $servername = "localhost";
 $username = "GyleInf";
 $password = "GyleInf";
 $dbname = "GyleInf";
 try {
 $conn = new mysqli($servername, $username, $password, $dbname);
 if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
 } 
 
  $result = $conn->query("SELECT ID, Vorname, Nachname, Adresse FROM Schueler");
 if ($result->num_rows > 0) {
 echo '<table id="ergebnis"><tr><th>ID</th><th>Name</th></tr>';
 // output data of each row
 while($row = $result->fetch_assoc()) {
 echo "<tr><td>" . $row["ID"]. "</td><td>" . $row["Vorname"]. " " . $row["Nachname"] ."</td></tr>";
 }
 echo "</table>";
 } else {
 echo "0 results";
 }
 
 $conn->close();
 echo "Connection closed";
 } catch (Exception $ex) {
 echo '<p class="warn">' . $ex->getMessage() . '</p>'; 
 }
?>