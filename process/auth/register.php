<?php

    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $username = mysqli_real_escape_string($conn,$_POST['username']);
    $name = mysqli_real_escape_string($conn,$_POST['name']);
    $password = password_hash(mysqli_real_escape_string($conn,$_POST['password']), PASSWORD_DEFAULT);

    // VALIDATE EMPTY FIELDS
    if(empty($username) || empty($name) || empty($password)){ 
        $msg = base64_encode('All fields are required!..');
        header("location: ../../pages/auth/register.php?msg=$msg&f"); 
        die();
    };

    // VALIDATE DUPLICATE USER
    $query = "SELECT id FROM users WHERE username='$username'";
    $fetch_user = mysqli_query($conn,$query);
    $verify_user_id = mysqli_num_rows($fetch_user);

    if($verify_user_id !== 0){ 
        $msg = base64_encode('User already exist!..');
        header("location: ../../pages/auth/register.php?msg=$msg&f"); 
        die();
    }

    // ADD USER
    $query = "INSERT INTO 
        users(`username`,`name`,`password`) 
        VALUES('$username','$name','$password')";

    $add_user = mysqli_query($conn, $query);

    // CHECK IF USER ADDED
    if(!$add_user){ 
        $msg = base64_encode('Failed to add guard!..');
        header("location: ../../pages/auth/register.php?msg=$msg&f");  
        die();
    }

    // LOGIN USER
    $query = "SELECT id, username FROM users WHERE username='$username'";
    $fetch_user = mysqli_query($conn,$query);
    $user = mysqli_fetch_assoc($fetch_user);

    SESSION_START();
    $user_id = $user['id'];
    $_SESSION["user_id"] = $user_id;
    header("location: ../../pages/fantasy/createTeam.php");
