<?php require '../../components/head.php'; ?>

<?php 
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
    <div>Budget: 100</div>
    <a href="../../pages/fantasy/players.php">Buy players</a>
    <?php require '../../components/footer.php'; ?>
</body>
</html>  