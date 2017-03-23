<?php
include_once '/inc/db_connect.php';
include_once '/inc/functions.inc.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.

if (isset($_POST['email'], $_POST['p'])) {
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $password = $_POST['p']; // The hashed password.
    
    if (login($email, $password, $mysqli) == true) {
        // Login success 
        header("Location: ?page=index");
        exit();
    } else {
        // Login failed 
        header('Location: index.php?page=error&err=Login or password wrong');
        exit();
    }
} else {
    // The correct POST variables were not sent to this page. 
    header('Location: ?page=error&err=Could not process login');
    exit();
}