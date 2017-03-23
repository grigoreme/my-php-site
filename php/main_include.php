<?php
	include_once 'inc/connect.inc.php';
	include_once 'inc/register.inc.php';
	include_once 'inc/functions.inc.php';

	sec_session_start();

	if(!isset($_SESSION['lang'])){
		$_SESSION['lang']="EN";
		header('Location: index.php');
	}

	if (login_check($mysqli) == true) {
		$logged = 'in';
	} else {
		$logged = 'out';
	}
?>
