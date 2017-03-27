<?php
  include_once('inc/translate.php');
  include_once('inc/filter.php');
  $db = new Db("secure_login");
  $userID=$_GET['user'];
  $count=$_GET['count'];
  $catID=$_GET['cat'];
  $itemID=$_GET['item'];
  $date = date('Y-m-d H:i:s');
  if(isset($catID,$itemID,$userID)){
    $repeat= $db->select("SELECT ID FROM Cart WHERE members='$userID' AND category='$catID' AND item='$itemID'","secure_login");
    if($repeat){ //item exist // update row
      $update = $db -> query("UPDATE Cart SET Count=Count+1 WHERE members='$userID' AND category='$catID' AND item='$itemID'","secure_login");
    }
    else{ //insert new row
      $insert = $db -> query("INSERT INTO Cart VALUES(null,'$userID','$catID','$itemID','$count','$date')","secure_login");
    }
  }
?>
