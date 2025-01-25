<?php
    SESSION_START();
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $player = mysqli_real_escape_string($conn,$_GET['id']);
    $team = $_SESSION['team'];
    $user = $_SESSION['user_id'];

    // GET REMAINING BUDGET
    $sql = "SELECT bank FROM fantasy_teams WHERE user = '$user'";
    $banks_query = mysqli_query($conn, $sql);
    if(!$banks_query) { header("location: ../../pages/fantasy/myTeam.php?sms=remaining budget"); die(); }
    $bank = mysqli_fetch_assoc($banks_query);
    $budget = $bank['bank'];

    // GET PLAYER PRICE
    $sql = "SELECT cost FROM players WHERE id = '$player'";
    $price_query = mysqli_query($conn, $sql);
    if(!$price_query) { header("location: ../../pages/fantasy/myTeam.php?sms=player price"); die(); }
    $price = mysqli_fetch_assoc($price_query);
    $player_price = $price['cost'];

    $updated_budget = $budget + $player_price;

    // UPDATE BUDGET
    $sql = "UPDATE fantasy_teams SET bank = '$updated_budget' WHERE user = '$user'";
    $update_budget = mysqli_query($conn, $sql);
    if(!$update_budget) { header("location: ../../pages/fantasy/myTeam.php?sms=update budget"); die(); }

    // SELL PLAYER
    $sql = "DELETE FROM fantasy_players WHERE fantasy_team = '$team' AND player = '$player'";
    $query = mysqli_query($conn, $sql);
    if(!$query){
        $sql = "UPDATE fantasy_teams SET bank = '$budget' WHERE user = '$user'";
        $update_budget = mysqli_query($conn, $sql);
        if(!$update_budget) { header("location: ../../pages/fantasy/myTeam.php?sms=update budget"); die(); }
        header("Location: ../../pages/fantasy/myTeam.php?sms=failed to sell player");
    }

    header("Location: ../../pages/fantasy/myTeam.php?sms=player sold");