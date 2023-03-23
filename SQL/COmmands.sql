--Create User
IF NOT EXISTS ( SELECT Name from User Where Name = LocalUserID )--LocalUserID should be saved locally in coockies
    INSERT INTO "User" ("Name") Values
    (UserName)--UserName will be ask if opened for the first time
    LAST_INSERT_ID()--we need to get and save the last added ID to the coockies as we have auto incrementing IDs
--Write Hightscore
IF NOT EXISTS ( SELECT Highscore from UserGame Where UserID = LocalUserID And GameID = LocalGameID )
    INSERT INTO "UserGame" ("Hightscore") Values (LocalHighscore)
ElSE UPDATE "UserGame"
SET "Highscore" = LocalHighscore
Where UserID = LocalUserID And GameID = LocalGameID
--Update Dauer
IF NOT EXISTS ( SELECT Dauer from UserGame Where UserID = LocalUserID And GameID = LocalGameID )
    INSERT INTO "UserGame" ("Dauer") Values (LocalDauer)--LocalDauer is the Time played in this session
ElSE UPDATE "UserGame"
SET "Dauer" = LocalHighscore
Where UserID = LocalUserID And GameID = LocalGameID