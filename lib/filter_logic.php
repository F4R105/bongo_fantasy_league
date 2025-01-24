<?php 
    // Initialize variables
    $whereClauses = [];
    $orderByClause = "";

    // Filter by Team
    if (isset($_GET['team']) && $_GET['team'] != 'all') { // Check if not 'all'
        $team = mysqli_real_escape_string($conn, $_GET['team']);
        $whereClauses[] = "teams.id = '$team'"; // Assuming your team ID column is named 'team_id'
    }

    // Filter by Cost
    if (isset($_GET['cost']) && is_numeric($_GET['cost']) && $_GET['cost'] >= 0 && $_GET['cost'] <= 15) {
        $cost = mysqli_real_escape_string($conn, $_GET['cost']);
        $whereClauses[] = "cost <= '$cost'"; // Filter players with cost less than or equal to the selected value
    }

    // Ordering
    if (isset($_GET['order'])) {
        $orderBy = mysqli_real_escape_string($conn, $_GET['order']);
        $allowedOrderBy = ['cost', 'points']; // Whitelist allowed columns
        if (in_array($orderBy, $allowedOrderBy)) { // Check if the order by column is valid
            $direction = isset($_GET['direction']) && strtoupper($_GET['direction']) == 'DESC' ? 'DESC' : 'ASC';
            $orderByClause = "ORDER BY $orderBy $direction";
        } else {
            // Handle invalid order by column (e.g., log an error, set a default)
            echo "Invalid order by column.";
            $orderByClause = "ORDER BY cost ASC"; // Default order
        }
    } else {
        $orderByClause = "ORDER BY cost DESC"; // Default order
    }

    // Build the WHERE clause
    $whereClause = "";
    if (!empty($whereClauses)) {
        $whereClause = "WHERE " . implode(" AND ", $whereClauses);
    }