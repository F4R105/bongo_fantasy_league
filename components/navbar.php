<nav>
    <a href="<?php echo $basePath; ?>index.php"><h1>Fantasy League</h1></a>
    <ul>
        <li>About us</li>
        <?php if(isset($_SESSION['user_id'])){ ?>
            <li>
                <a href="../../pages/fantasy/fantasy.php">Home</a>
            </li>
            <li>
                <a href="../../pages/fantasy/myTeam.php">My team</a>
            </li>
            <li>
                <a href="../../pages/user/editUser.php">
                <?php 
                    $user_id = $_SESSION['user_id'];
                    $user = mysqli_fetch_array(mysqli_query($conn, "SELECT `name` FROM users WHERE id = $user_id"));
                    $name = $user["name"];
                    echo $name;
                ?>
                </a>
            </li>
            <li><a href="../../process/auth/logout.php">Logout</a></li>
        <?php } ?>
    </ul>
</nav>