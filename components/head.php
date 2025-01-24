<?php 
    SESSION_START(); 
    $basePath = $rootDir ? "./" : "../../";
    $title = isset($title) ? $title : "Bongo fantasy league";
    $description = isset($description) ? $description : "Default description text goes here.";
    $keywords = isset($keywords) ? $keywords : ["Season Master Adventures", "Season Master", "Kilimanjaro Tour Companies", "Tourism in Tanzania", "Tanzania Safari Adventure", "WildBeest Migration"];

    require_once "$basePath"."config/errorReporting.php";
    require_once "$basePath"."config/databaseConnection.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title; ?></title>
</head>