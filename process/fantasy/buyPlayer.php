<?php
    SESSION_START();
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $player = mysqli_real_escape_string($conn,$_GET['id']);
    $team = $_SESSION['team'];
    $user = $_SESSION['user_id'];

    // 1. VERIFY NO OF PLAYERS
    $sql = "SELECT * FROM fantasy_players WHERE fantasy_team = '$team'";
    $team_query = mysqli_query($conn, $sql);
    if(!$team_query) { header("location: ../../pages/fantasy/transfers.php?sms=no of players"); die(); }
    $noOfPlayers = mysqli_num_rows($team_query);
    if($noOfPlayers == 15) { header("location: ../../pages/fantasy/transfers.php?sms=no of players"); die(); }

    // 2. VERIFY DUPLICATE
    $sql = "SELECT * FROM fantasy_players WHERE fantasy_team = '$team' AND player='$player'";
    $team_query = mysqli_query($conn, $sql);
    if(!$team_query) { header("location: ../../pages/fantasy/transfers.php?sms=no of players"); die(); }
    $noOfPlayers = mysqli_num_rows($team_query);
    if($noOfPlayers > 0) { header("location: ../../pages/fantasy/transfers.php?sms=duplicate player"); die(); }

    // 3. VERIFY ONE TEAM LIMIT
    $sql = "SELECT team FROM players WHERE id = '$player'";
    $player_query = mysqli_query($conn, $sql);
    if(!$player_query) { header("location: ../../pages/fantasy/transfers.php?sms=no of players"); die(); }
    $player = mysqli_fetch_assoc($player_query);
    $boughtPlayer_team = $player['team'];

    // 3. VERIFY ONE TEAM LIMIT
    $sql = "SELECT players.team AS team_id, COUNT(players.team) AS players, teams.name AS team_name FROM fantasy_players JOIN players ON fantasy_players.player = players.id JOIN teams ON players.team = teams.id WHERE fantasy_team = '$team' AND players.team = '$boughtPlayer_team' GROUP BY players.team";
    $team_query = mysqli_query($conn, $sql);
    if(!$team_query) { header("location: ../../pages/fantasy/transfers.php?sms=single team verif"); die(); }
    $data = mysqli_fetch_assoc($team_query);
    $noOfPlayers = $data['players'];
    if($noOfPlayers >= 3) { header("location: ../../pages/fantasy/transfers.php?sms=single team limit reached"); die(); }

    // 4. GET REMAINING BUDGET
    $sql = "SELECT bank FROM fantasy_teams WHERE user = '$user'";
    $banks_query = mysqli_query($conn, $sql);
    if(!$banks_query) { header("location: ../../pages/fantasy/transfers.php?sms=remaining budget"); die(); }
    $bank = mysqli_fetch_assoc($banks_query);
    $budget = $bank['bank'];

    // 5. GET PLAYER PRICE
    $sql = "SELECT cost FROM players WHERE id = '$player'";
    $price_query = mysqli_query($conn, $sql);
    if(!$price_query) { header("location: ../../pages/fantasy/transfers.php?sms=player price"); die(); }
    $price = mysqli_fetch_assoc($price_query);
    $player_price = $price['cost'];

    $updated_budget = $budget - $player_price;

    // 6. UPDATE BUDGET
    $sql = "UPDATE fantasy_teams SET bank = '$updated_budget' WHERE user = '$user'";
    $update_budget = mysqli_query($conn, $sql);
    if(!$update_budget) { header("location: ../../pages/fantasy/transfers.php?sms=update budget"); die(); }

    // 7. BUY PLAYER
    $sql = "INSERT INTO fantasy_players(`fantasy_team`,`player`) VALUES('$team','$player')";
    $buy_player = mysqli_query($conn, $sql);
    if(!$buy_player) {
        // update to initial budget
        $sql = "UPDATE fantasy_teams SET bank = '$budget'";
        $undo_budget = mysqli_query($conn, $sql);
        if(!$undo_query) { header("location: ../../pages/fantasy/transfers.php?sms=failed to undo"); die(); } 
        header("location: ../../pages/fantasy/transfers.php?sms=failed to buy player"); die(); 
    }

    header("location: ../../pages/fantasy/myTeam.php");
