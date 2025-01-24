<?php
date_default_timezone_set('Africa/Dar_es_Salaam');
$conn = mysqli_connect("localhost","root","","bongo_fantasy_league");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}