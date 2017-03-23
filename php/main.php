<?php
	include_once 'inc/db_connect.php';
	include_once 'inc/functions.inc.php';
	include_once 'inc/translate.php';

	function arrayInString( $inArray , $inString ){
	  if( is_array( $inArray ) ){
		foreach( $inArray as $e ){
		  if( strpos( $inString , $e )!==false )
			return true;
		}
		return false;
	  }else{
		return ( strpos( $inString , $inArray )!==false );
	  }
	}
	$page = $_GET['page'];
	$pages = glob($dir.'php/*.php');
	foreach($pages as $val){
		$pages[$val]=substr($val, 4, -4);
	}
	$restricts = array(".","~",":","/","?","#","[","]","@","!","$","&","'","(",")","*","+",";","=");
	if (!empty($page)) {
		if(isset($_GET['ajax'])){
			if($_GET['ajax']==1)
				include_once("php/".$page.".php");
		}
		else if(in_array($page,$pages)) {
			include_once('php/navbar.php');
			include_once("php/".$page.".php");
			include_once('php/footer.php');
		}else
		{
			if(arrayInString($restricts,$page)) {
				echo '
				<div class="text-center mb20">
				Try not to hack our system!
				</div>';
			}
			else{
				echo '
				<div class="text-center mb20">
				Page not found. Return to
				<a href="index.php">index</a>;
				</div>';
			}
		}
	}
	else {
		include_once('php/navbar.php');
		include_once('php/index.php');
		include_once('php/footer.php');
	}
?>
