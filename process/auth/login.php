<?php
    require_once "../../config/errorReporting.php";
    require_once "../../config/databaseConnection.php";

    $username = mysqli_real_escape_string($conn,$_POST['username']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);

    $query = "SELECT * FROM users WHERE username = '$username'";
    $data = mysqli_query($conn, $query);
    $rows = mysqli_num_rows($data);

    if($rows === 0){ 
        $msg = base64_encode('wrong username or password');
        header("location: ../../pages/auth/login.php?msg=$msg&f"); 
        die();
    };

    $user = mysqli_fetch_array($data);
    $db_password = $user['password'];

    if(!password_verify($password, $db_password)){ 
        $msg = base64_encode('wrong username or password');
        header("location: ../../pages/auth/login.php?msg=$msg&f"); 
        die();
    };

    SESSION_START();
    $user_id = $user['id'];
    $_SESSION["user_id"] = $user_id;
    header("location: ../../pages/fantasy/fantasy.php");
