<?php

    SESSION_START();    
    SESSION_DESTROY();
    UNSET($_SESSION['user_id']);

    header("location: ../../pages/auth/login.php");
