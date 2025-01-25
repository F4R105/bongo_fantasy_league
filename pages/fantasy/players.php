<?php require '../../components/head.php'; ?>

<?php 
    // VERIFY AUTH
    if(!isset($_SESSION['user_id'])) header('location: ../../pages/auth/login.php');
    $team = $_SESSION['team'];
    $user = $_SESSION['user_id'];

    // FILTER LOGIC
    require '../../lib/filter_logic.php';

    // PAGINATION
    require '../../lib/pagination_logic.php';
    
    // QUERIES
    $sql = "SELECT *, players.id AS player_id FROM players JOIN teams ON players.team = teams.id $whereClause $orderByClause LIMIT $perPage OFFSET $offset";
    $players_query = mysqli_query($conn, $sql);

    $sql = "SELECT * FROM players JOIN teams ON players.team = teams.id $whereClause $orderByClause";
    $pagination_query = mysqli_query($conn, $sql);
    $noOfPlayers = mysqli_num_rows($pagination_query);
    $noOfPages = round($noOfPlayers / $perPage);
    $nextPage = $page >= $noOfPages ? $noOfPages : $page + 1;
    $prevPage = ($page - 1) < 1 ? 1 : ($page - 1);

    $sql = "SELECT * FROM teams";
    $teams_query = mysqli_query($conn, $sql);

    $sql = "SELECT bank FROM fantasy_teams WHERE user = '$user'";
    $banks_query = mysqli_query($conn, $sql);
    $bank = mysqli_fetch_assoc($banks_query);
    $budget = $bank['bank'];
?>

<body>
    <?php require '../../components/navbar.php'; ?>
    <h1>Players</h1>
    <h4>Bank: <?php echo $budget; ?></h4>
    <form action="" method="GET">
        <div>
            <label for="team">Filter by team</label>
            <select name="team" id="team">
                <option value="all">All</option>
                <?php while($team = mysqli_fetch_assoc($teams_query)){ ?>
                    <option value="<?php echo $team['id']; ?>" <?php if(isset($_GET['team'])) if($_GET['team'] == $team['id']) echo "selected"; ?>><?php echo $team['name']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div>
            <label for="cost">Filter by value</label>
            <input name="cost" type="number" min="0" max="15" value="<?php if(isset($_GET['cost'])){ echo $_GET['cost'] ; }else{ echo "15"; } ?>">
        </div>
        <div>
            <label for="order">Order by</label>
            <select name="order" id="team">
                <option value="cost" <?php if(isset($_GET['order'])) if($_GET['order'] == "cost") echo "selected"; ?>>Cost</option>
                <option value="points" <?php if(isset($_GET['order'])) if($_GET['order'] == "points") echo "selected"; ?>>Points</option>
            </select>
            <select name="direction" id="direction">
                <option value="desc" <?php if(isset($_GET['direction'])) if($_GET['direction'] == "desc") echo "selected"; ?>>&darr; High to Low</option>
                <option value="asc" <?php if(isset($_GET['direction'])) if($_GET['direction'] == "asc") echo "selected"; ?>>&uarr; Low to high</option>
            </select>
        </div>
        <button type="submit" name="filter">Submit</button>
    </form>
    <?php
        $currentUrl = strtok($_SERVER["REQUEST_URI"], '?');
        $queryParams = $_GET;
        $queryParams['page'] = $nextPage;
        $nextUrl = $currentUrl.'?'.http_build_query($queryParams);
        $queryParams['page'] = $prevPage;
        $prevUrl = $currentUrl.'?'.http_build_query($queryParams);
    ?>
    <div>
        <a href="<?php echo $nextUrl; ?>">Next</a>
        <span><?php echo "$page/$noOfPages"; ?></span>
        <a href="<?php echo $prevUrl; ?>">Prev</a>
    </div>
    <table border="2">
        <thead>
            <tr>
                <th>Player</th>
                <th>Team</th>
                <th>Cost</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php while($player = mysqli_fetch_assoc($players_query)){ ?>
                <tr>
                    <td>
                        <?php
                            $firstName = $player['first_name'];
                            $lastName = $player['last_name'];
                            echo "$firstName $lastName";
                        ?>
                    </td>
                    <td><?php echo $player['name']; ?></td>
                    <td><?php echo $player['cost']; ?></td>
                    <td><a href="../../process/fantasy/buyPlayer.php?id=<?php echo $player['player_id']; ?>">Buy</a></td>
                </tr>
            <?php }; ?>
        </tbody>
    </table>
    <?php require '../../components/footer.php'; ?>
</body>
</html>  