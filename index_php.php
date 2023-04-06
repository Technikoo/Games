<!DOCTYPE html>
    <html lang="en" >
        <head>  
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Spielauswahl</title>
	      <link rel="stylesheet" href="CSS/index.css">
        <link rel="stylesheet" href="CSS/style.css">
        </head>

        <body>
          <div class="Containers">
          <h1>Tetris</h1> 
          <div class="imgs">
            <img src="images\Tetris.png" alt="Error" draggable="false">
            <div class="imgs-Buttons">
              <a href="Games\Tetris.html" class="imgs-link link">
                <button type="button" class="imgs-btn btn btn-success">Play</button>
              </a>
              <a href="Anleitungen\AnleitungTetris.html" class="imgs-Help-link link">
                <button type="button" class="imgs-btn btn btn-info">Help</button>
              </a>
            </div>
          </div>
          <footer > <!--  Will be changed to dynamic -->
            <table id="Highscore-Tetris">
              <?php  
 // Connect to database
 // Run the query
 // Display a message that it was successful or not
 $servername = "localhost";
 $username = "Games";
 $password = "Games";
 $dbname = "Games";
 try {
 $conn = new mysqli($servername, $username, $password, $dbname);
 if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
 } 
 
  $result = $conn->query("SELECT u.name, g.name, ug.Dauer, ug.Highscore FROM game AS g, user AS u,usergame AS ug
  WHERE ug.UserID = u.ID 
  AND ug.GameID = g.ID
  AND g.ID = 1 ORDER BY Highscore DESC");
 if ($result->num_rows > 0) {
 echo '<tr><td>Platzierung</td><td>Highscore</td><td>Name</td></tr>';
 // output data of each row
 while($row = $result->fetch_assoc()) {
 echo "<tr><th id='first'>1.</th><td>" . $row["ug.Highscore"]. "</td><td>" . $row["u.name"]."</td></tr>";
 }
 } else {
 echo "0 results";
 }
 
 $conn->close();
 echo "Connection closed";
 } catch (Exception $ex) {
 echo '<p class="warn">' . $ex->getMessage() . '</p>'; 
 }
              ?>
            </table>
          </footer>
        </div>
        <div class="Containers">
        <h1>TicTacToe</h1>
          <div class="imgs">
            <img src="images\TicTacToe.png" alt="Error" draggable="false">
            <div class="imgs-Buttons">
              <a href="Games\TicTacToe.html" class="imgs-link link">
                <button type="button" class="imgs-btn btn btn-success">Play</button>
              </a>
              <a href="Anleitungen\AnleitungTicTacToe.html" class="imgs-Help-link link">
                <button type="button" class="imgs-btn btn btn-info">Help</button>
              </a>
            </div>
          </div>
        </div>
        <div class="Containers">
          <h1>4 Gewinnt</h1>
          <div class="imgs">
            <img src="images\4-Gewinnt.png" alt="Error" draggable="false">
            <div class="imgs-Buttons">
              <a href="Games\4-Gewinnt.html" class="imgs-link link">
                <button type="button" class="imgs-btn btn btn-success">Play</button>
              </a>
              <a href="Anleitungen\Anleitung4-Gewinnt.html" class="imgs-Help-link link">
                <button type="button" class="imgs-btn btn btn-info">Help</button>
              </a>
            </div>
          </div>
        </div>
        <div class="Containers">
          <h1>2048</h1>
          <div class="imgs">
            <img src="images/2048.png" alt="Error">
            <div class="imgs-Buttons">
              <a href="Games\2048.html" class="imgs-link link" draggable="false">
                <button type="button" class="imgs-btn btn btn-success">Play</button>
              </a>
              <a href="Anleitungen\Anleitung2048.html" class="imgs-Help-link link">
                <button type="button" class="imgs-btn btn btn-info">Help</button>
              </a>
            </div>
          </div>
          <footer > <!--  Will be changed to dynamic -->
            <table id="Highscore-TicTacToe">
              <tr>
                <td>
                  Platzierung
                </td>
                <td>
                  Highscore
                </td>
                <td>
                  Name
                </td>
              </tr>
              <tr>
                <th id="first">
                  1.
                </th>
                <td>
                  37.912
                </td>
                <td>
                  SandigerSand
                </td>
              </tr>
              <tr>
                <th id="second">
                  2.
                </th>
                <td>
                    34.676
                </td>
                <td>
                  GlasigesGlas
                </td>
              </tr>
              <tr>
                <th id="third">
                  3.
                </th>
                <td>
                  23.686
                </td>
                <td>
                  Techniko
                </td>
              </tr>
            </table>
          </footer>
        </div>
        </body> 
    </html>