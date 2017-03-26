<?php
	include_once('inc/connect.inc.php');
	//var_dump($_GET);
	$cat=filter_input(INPUT_GET, 'cat', $filter = FILTER_SANITIZE_STRING);
	$table=filter_input(INPUT_GET, 'table', $filter = FILTER_SANITIZE_STRING);
	$args=implode("','",array_slice($_GET, 2));
	$add_new = new Db($cat);
	$query="INSERT INTO ".$table." VALUES ('null','$args');";
	echo $query;
?>
