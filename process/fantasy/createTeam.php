<?php
    SESSION_START();
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $team = mysqli_real_escape_string($conn,$_POST['name']);
    $user = $_SESSION['user_id'];

    // VALIDATE EMPTY FIELDS
    if(empty($team)){ 
        $msg = base64_encode('All fields are required!..');
        header("location: ../../pages/fantasy/createTeam.php?msg=$msg&f"); 
        die();
    };

    // VALIDATE DUPLICATE USER
    $query = "SELECT id FROM fantasy_teams WHERE `name`='$team'";
    $fetch_team = mysqli_query($conn,$query);
    $verify_team_id = mysqli_num_rows($fetch_team);

    if($verify_team_id !== 0){ 
        $msg = base64_encode('Team already exist!..');
        header("location: ../../pages/fantasy/createTeam.php?msg=$msg&f"); 
        die();
    }

    // ADD TEAM
    $query = "INSERT INTO 
        fantasy_teams(`name`,`user`) 
        VALUES('$team','$user')";

    $add_team = mysqli_query($conn, $query);

    // CHECK IF TEAM ADDED
    if(!$add_team){ 
        $msg = base64_encode('Failed to add guard!..');
        header("location: ../../pages/fantasy/createTeam.php?msg=$msg&f"); 
        die();
    }

    // ADD TEAM
    $sql = "SELECT id FROM fantasy_teams WHERE user = '$user'";
    $query = mysqli_query($conn, $sql);
    $team = mysqli_fetch_assoc($query);
    $_SESSION['team'] = $team['id'];

    header("location: ../../pages/fantasy/transfers.php");
