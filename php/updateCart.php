<?php
  include_once('inc/translate.php');
  include_once('inc/connect.inc.php');
  $db = new Db("secure_login");
  $userID=$_GET['user'];
  $catID=$_GET['cat'];
  $itemID=$_GET['item'];
  $count=$_GET['count'];
  if($count<1){
    echo '<p class="bg-danger">'.translate_get($_GET['lang'],'negativeCartUpdate').'</p>';
  }else
  if(isset($userID,$catID,$itemID)){
    $delete = $db -> query ("UPDATE Cart SET Count='$count' WHERE category='$catID' AND item='$itemID' AND members='$userID'","clopotel_md");
  }
?>
