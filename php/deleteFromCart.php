<?php
  include_once('inc/translate.php');
  include_once('inc/connect.inc.php');
    $db = new Db("secure_login");
  $userID=$_GET['user'];
  $catID=$_GET['cat'];
  $itemID=$_GET['item'];
  var_dump($userID,$catID,$itemID);
  if(isset($userID,$catID,$itemID)){
    $delete = $db -> query ("DELETE FROM Cart WHERE category='$catID' AND item='$itemID' AND members='$userID'","clopotel_md");
  }
  
?>
