<?php
    SESSION_START();
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $player = mysqli_real_escape_string($conn,$_GET['id']);
    $team = $_SESSION['team'];

    $sql = "DELETE FROM fantasy_players WHERE fantasy_team = '$team' AND player = '$player'";
    $query = mysqli_query($conn, $sql);

    if(!$query){
        header("Location: ../../pages/fantasy/myTeam.php?sms=failed to sell player");
    }

    header("Location: ../../pages/fantasy/myTeam.php?sms=player sold");