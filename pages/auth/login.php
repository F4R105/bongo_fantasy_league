<?php
    SESSION_START();
    if(isset($_SESSION['user_id'])){ 
        header("location: ../../pages/fantasy/fantasy.php");
    }
?>

<?php require "../../components/head.php"; ?>
<body>
    <?php require "../../components/navbar.php"; ?>
    
    <form action="../../process/auth/login.php" method="POST">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">Login</button>
    </form>

    <?php if(isset($_GET["msg"])) { ?>
        <p><?php echo base64_decode($_GET["msg"]); ?></p>
    <?php }; ?>

    <?php require "../../components/footer.php"; ?>
</body>
</html>