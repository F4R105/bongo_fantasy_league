<?php require '../../components/head.php'; ?>

<?php 
    // VERIFY AUTH
    if(!isset($_SESSION['user_id'])) header('location: ../../pages/auth/login.php');
    $team = $_SESSION['team'];

    // GET TEAM
    $sql = "SELECT players.id AS id, player, first_name, last_name, cost, teams.name AS team FROM fantasy_players JOIN players ON fantasy_players.player = players.id JOIN teams ON players.team = teams.id WHERE fantasy_team = '$team'";
    $query = mysqli_query($conn, $sql);
?>

<body>
    <?php require '../../components/navbar.php'; ?>
    <select name="" id="">
        <option value="">GW1</option>
    </select>
    <h3>Points: 50</h3>

    <table border="2">
        <thead>
            <th>Player</th>
            <th>Team</th>
            <th>Cost</th>
            <th>Action</th>
        </thead>
        <tbody>
            <?php while($player = mysqli_fetch_assoc($query)){ ?>
                <?php
                    $firstName = $player['first_name'];
                    $lastName = $player['last_name'];
                    $team = $player['team'];
                    $cost = $player['cost'];
                ?>
                <tr>
                    <td><?php echo "$firstName $lastName"; ?></td>
                    <td><?php echo $team; ?></td>
                    <td><?php echo $cost; ?></td>
                    <td><a href="../../process/fantasy/sellPlayer.php?id=<?php echo $player['id']; ?>">Sell</a></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <?php require '../../components/footer.php'; ?>
</body>
</html>  