<?php
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $perPage = 21; // Number of rows per page
    $offset = ($page - 1) * $perPage;