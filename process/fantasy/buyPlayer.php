<?php
    SESSION_START();
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $player = mysqli_real_escape_string($conn,$_GET['id']);
    $team = $_SESSION['team'];

    // BUY PLAYER
    $query = "INSERT INTO fantasy_players(`fantasy_team`,`player`) VALUES('$team','$player')";
    $buy_player = mysqli_query($conn, $query);

    // CHECK IF PLAYER BOUGHT
    if(!$buy_player){ 
        $msg = base64_encode('Failed to buy player!..');
        header("location: ../../pages/fantasy/players.php?msg=$msg&f"); 
        die();
    }

    header("location: ../../pages/fantasy/myTeam.php");
