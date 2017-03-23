<?php
	include_once 'inc/register.inc.php';
	include_once 'inc/functions.inc.php';
	
	ob_start();
	if (login_check($mysqli) == true) {
		$logged = 'in';
		$user=$_SESSION['username'];
	} else {
		$logged = 'out';
	}	
	if(!isset($_GET['adress'])){//daca nu e setat
		echo '<p class="text-danger">'.translate_get($_SESSION['lang'],"error").'</p>';
		die();
	}
	else if(ctype_space($_GET['adress']) || strlen($_GET['adress'])<1){//daca e doar space sau e gol
		echo '<p class="text-danger">'.translate_get($_SESSION['lang'],"pass_must_match").'</p>';
		die();
	}
	else if($_GET['adress']!="a1" && $_GET['adress']!="a2" && $_GET['adress']!="b1" 
			&& $_GET['adress']!="b2"){// Daca nu corespunde sintaxei a1,a2,b1,b2 == adress1,adress2,billingadress1,billingadress2
		echo '<p class="text-danger">'.translate_get($_SESSION['lang'],"pass_must_match").'</p>';
		die();
	}
	$region="";
	$city="";
	$pcode="";
	$fax="";
	$street="";
	$build="";
	$door="";
	$id=0;
?>
<div class="container">
	<div class="row col-sm-12">
		<h4 class="text-primary">
		<?php
			$show_add="";//adress displayed
			if($_GET['adress']=='a1') {
				$show_add=translate_get($_SESSION['lang'],"adress")." 1";
			}
			else if($_GET['adress']=='a2'){
				$show_add=translate_get($_SESSION['lang'],"adress")." 2";
			}
			else if($_GET['adress']=='b1'){
				$show_add=translate_get($_SESSION['lang'],"billing_adress")." 1";
			}
			else if($_GET['adress']=='b2'){
				$show_add=translate_get($_SESSION['lang'],"billing_adress")." 2";
			}
			echo $show_add.":";
			$work_add=preg_replace('/\s+/', '', $show_add);//show_add fara space-uri (ex:Billing Adress1 = BillingAdress1)
		?>
		</h4>
		<div class="mr10">
		<?php
			
			if($logged=='in'){
				if(isset($_POST['region'])){
					$id=0;
					$region=$_POST['region'];
					$city=$_POST['city'];
					$pcode=$_POST['pcode'];
					$fax=$_POST['fax'];
					$street=$_POST['street'];
					$build=$_POST['build'];
					$door=$_POST['door'];
					if(strlen($street)<1 || ctype_space($street) || 
					strlen($build)<1 || ctype_space($build) || 
					strlen($door)<1 || ctype_space($door) ||
					strlen($region)<1 || ctype_space($region) ||
					strlen($city)<1 || ctype_space($city) ||
					strlen($pcode)<1 || ctype_space($pcode)){
						echo translate_get($_SESSION['lang'],"complete_right").translate_get($_SESSION['lang'],"star_obligatory");
					}
					else{
						$DoorID = $db -> select("SELECT ID FROM secure_login.Door WHERE (Street='$street') AND (Build='$build') AND (Door='$door') LIMIT 1","secure_login");
						
						$DoorID = intval($DoorID[0]['ID']);
						
						if($DoorID==0){
							if ($add_Door = $mysqli->prepare("INSERT INTO secure_login.Door(Street,Build,Door) VALUES(?,?,?);")) {
								$add_Door->bind_param('sss', $street,$build,$door);
								$add_Door->execute();    // Add new row with door adress
								$DoorID=$add_Door->insert_id;
							}	
							else{
								die();
							}
						}
						
						$AdressID = $db -> select("SELECT ID,Fax,DoorID as Door FROM secure_login.Adress WHERE (Region='$region') AND (City='$city') AND (PostalCode='$pcode') LIMIT 1","secure_login");
						
						$new_fax = $AdressID[0]['Fax'];
						$old_door = $AdressID[0]['Door'];
						$AdressID = intval($AdressID[0]['ID']);
						
						if(($AdressID!=0 && $fax!=$new_fax) || ($AdressID!=0 && $old_door!=$DoorID)){
							if ($update_adress = $mysqli->prepare("UPDATE secure_login.Adress SET Region='$region',City='$city',PostalCode='$pcode',Fax='$fax',DoorID='$DoorID' WHERE ID='$AdressID';")) {
								$update_adress->execute();    // update row with adress
								$AdressID=$update_adress->insert_id;
							}	
							else{
								die();
							}
						}
						else if($AdressID==0){
							if($add_Adress = $mysqli->prepare("INSERT INTO secure_login.Adress(Region,City,PostalCode,Fax,DoorID) VALUES('$region','$city','$pcode','$fax','$DoorID');")) {
								$add_Adress->execute();    // Add new row with adress
								$AdressID=$add_Adress->insert_id;
							}	
							else{
								die();
							}
						}
						
						$UserAdress = $db -> select("SELECT ".$work_add." FROM secure_login.members WHERE username='$user' LIMIT 1","secure_login");
						
						$UserAdress = intval($UserAdress[0][$work_add]);
						
						if($UserAdress != $AdressID){
							if($set_Adress = $mysqli->prepare("UPDATE secure_login.members SET $work_add='$AdressID' WHERE username='$user';")) {
								$set_Adress->execute();    // Add new row with adress
								$UserAdress=$set_Adress->insert_id;
							}	
							else{
								die();
							}
						}
						$id=$UserAdress;
					}
				}
				else{
					if ($stmt = $mysqli->prepare("SELECT 
					Adress.Region,Adress.City,Adress.PostalCode,Adress.Fax,
					Door.Street,Door.Build,Door.Door 
					FROM Adress,Door,members 
					WHERE (Adress.ID=members.$work_add) AND (Door.ID=Adress.DoorID) AND members.username = ?")) {
						$stmt->bind_param('s', $user);
						$stmt->execute();    // Execute the prepared query.
						$stmt->store_result();

						// get variables from result.
						$stmt->bind_result($region,$city,$pcode,$fax,$street,$build,$door);
						$stmt->fetch();
					}
					else{
						echo "SQL ERROR";
					}
				}
				echo '
						<form action="" class="form" role="form" method="post" name="reset_form">                      
							'.translate_get($_SESSION['lang'],"region").':* <input value="'.$region.'" class="form-control" type="text" name="region"/>
							'.translate_get($_SESSION['lang'],"city").':* <input value="'.$city.'" class="form-control" type="text" name="city"/>
							'.translate_get($_SESSION['lang'],"postal_code").':* <input value="'.$pcode.'" class="form-control" type="text" name="pcode"/>
							Fax: <input value="'.$fax.'" class="form-control" type="text" name="fax"/>
							'.translate_get($_SESSION['lang'],"street").':* <input value="'.$street.'" class="form-control" type="text" name="street"/>
							'.translate_get($_SESSION['lang'],"build").':* <input value="'.$build.'" class="form-control" type="text" name="build"/>
							'.translate_get($_SESSION['lang'],"door").':* <input value="'.$door.'" class="form-control" type="text" name="door"/>
							<button type="submit" class="btn btn-primary btn-block" onclick="goToUrl(window.location.href,\'done\',\'1\')">'.translate_get($_SESSION['lang'],"change_adress").'</button>
						</form>';
						echo '<button type="button" onclick="goToUrl(window.location.href,\'page\',\'account\')" class="btn btn-primary btn-block">'.translate_get($_SESSION['lang'],"back_to_acc").'</button>';
				
			}
		?>
		</div>
	</div>
</div>