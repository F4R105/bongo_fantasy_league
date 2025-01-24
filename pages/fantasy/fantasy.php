<?php require '../../components/head.php'; ?>

<?php 
    // VERIFY AUTH
    if(!isset($_SESSION['user_id'])) header('location: ../../pages/auth/login.php');
    $user = $_SESSION['user_id'];

    // VERIFY TEAM AVAILABILITY
    $sql = "SELECT * FROM fantasy_teams WHERE user = '$user'";
    $query = mysqli_query($conn, $sql);
    $verify_team = mysqli_num_rows($query);
    if($verify_team == 0) header('location: ../../pages/fantasy/createTeam.php');
?>

<body>
    <?php require '../../components/navbar.php'; ?>
    <h1>Points: 50</h1>
    <a href="../../pages/fantasy/myTeam.php">My team</a>
    <a href="../../pages/fantasy/transfers.php">Transfers</a>
    <?php require '../../components/footer.php'; ?>
</body>
</html>  