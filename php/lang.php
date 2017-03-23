<?php
	$base_url = ( isset($_SERVER['HTTPS']) && $_SERVER['HTTPS']=='on' ? 'https' : 'http' ) . '://' .  $_SERVER['HTTP_HOST'];
	$url = $base_url . $_SERVER["REQUEST_URI"];
	if($_GET['lang']==1)
		$_SESSION['lang']="EN";
	else if($_GET['lang']==2)
		$_SESSION['lang']="RO";
	else if($_GET['lang']==3)
		$_SESSION['lang']="RU";
	header('Location: index.php');
?>