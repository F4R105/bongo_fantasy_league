<?php require "../../components/head.php"; ?>
<body>
    <?php require "../../components/navbar.php"; ?>
    
    <form action="../../process/fantasy/createTeam.php" method="POST">
        <input type="text" name="name" placeholder="Your team name">
        <button type="submit">Create team</button>
    </form>

    <?php if(isset($_GET["msg"])) { ?>
        <p><?php echo base64_decode($_GET["msg"]); ?></p>
    <?php }; ?>

    <?php require "../../components/footer.php"; ?>
</body>
</html>