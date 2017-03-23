<div class="container" id="content">
	<div class="row col-sm-4">
		<h4 class="text-primary"><?php echo translate_get($_SESSION['lang'],"personal_info"); ?></h4>
			<div class="mr10">
			<?php
				include_once 'inc/register.inc.php';
				include_once 'inc/functions.inc.php';
				
				ob_start();
				if (login_check($mysqli) == true) {
					$logged = 'in';
				} else {
					$logged = 'out';
				}
				if($logged=='in'){
					$user=$_SESSION['username'];
					$rows = $db -> select("SELECT * from secure_login.members WHERE username = '".$user."' LIMIT 1","secure_login");
					if(isset($rows[0]["username"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"username").': ' . $rows[0]["username"].'</p>';
					}
					if(isset($rows[0]["email"])){
						echo '<p class="text-muted">Email: ' . $rows[0]["email"].' <a href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					if(isset($rows[0]["access"])){
						if(intval($rows[0]["access"])>1)
							echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"role").': ' . $access[intval($rows[0]["access"])-1].'</p>';
					}
					if(isset($rows[0]["FirstName"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"first_name").': ' . $rows[0]["FirstName"].' <a href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					if(isset($rows[0]["LastName"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"last_name").': ' . $rows[0]["LastName"].' <a href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					if(isset($rows[0]["Phone"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"phone").': ' . $rows[0]["Phone"].' <a href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					if(isset($rows[0]["DateEntered"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"date_entered").': ' . $rows[0]["DateEntered"].'</p>';
					}
					
					echo '<button type="button" onclick="goToUrl(window.location.href,\'page\',\'password_reset\')" class="btn btn-primary btn-block">'.translate_get($_SESSION['lang'],"change_pass").'</button>';
				}
			?>
			</div>
	</div>
	
	<div class="row col-sm-4">
		<h4 class="text-primary"><?php echo translate_get($_SESSION['lang'],"adresses"); ?></h4>
			<div class="mr10">
			<?php
				if ($stmt = $mysqli->prepare("SELECT Adress.Region,Adress.City,Adress.PostalCode,Adress.Fax,
				Door.Street,Door.Build,Door.Door 
				FROM Adress,Door,members 
				WHERE (Adress.ID=members.Adress1) AND (Door.ID=Adress.DoorID) AND members.username = ?")) {
					$stmt->bind_param('s', $user);
					$stmt->execute();    // Execute the prepared query.
					$stmt->store_result();

					// get variables from result.
					$stmt->bind_result($a1_region,$a1_city,$a1_pcode,$a1_fax,$a1_street,$a1_build,$a1_door);
					$stmt->fetch();
				}
				if ($stmt = $mysqli->prepare("SELECT Adress.Region,Adress.City,Adress.PostalCode,Adress.Fax,
				Door.Street,Door.Build,Door.Door 
				FROM Adress,Door,members 
				WHERE (Adress.ID=members.Adress2) AND (Door.ID=Adress.DoorID) AND members.username = ?")) {
					$stmt->bind_param('s', $user);
					$stmt->execute();    // Execute the prepared query.
					$stmt->store_result();

					// get variables from result.
					$stmt->bind_result($a2_region,$a2_city,$a2_pcode,$a2_fax,$a2_street,$a2_build,$a2_door);
					$stmt->fetch();
				}
				if ($stmt = $mysqli->prepare("SELECT Adress.Region,Adress.City,Adress.PostalCode,Adress.Fax,
				Door.Street,Door.Build,Door.Door 
				FROM Adress,Door,members 
				WHERE (Adress.ID=members.BillingAdress1) AND (Door.ID=Adress.DoorID) AND members.username = ?")) {
					$stmt->bind_param('s', $user);
					$stmt->execute();    // Execute the prepared query.
					$stmt->store_result();

					// get variables from result.
					$stmt->bind_result($b1_region,$b1_city,$b1_pcode,$b1_fax,$b1_street,$b1_build,$b1_door);
					$stmt->fetch();
				}
				if ($stmt = $mysqli->prepare("SELECT Adress.Region,Adress.City,Adress.PostalCode,Adress.Fax,
				Door.Street,Door.Build,Door.Door 
				FROM Adress,Door,members 
				WHERE (Adress.ID=members.BillingAdress2) AND (Door.ID=Adress.DoorID) AND members.username = ?")) {
					$stmt->bind_param('s', $user);
					$stmt->execute();    // Execute the prepared query.
					$stmt->store_result();

					// get variables from result.
					$stmt->bind_result($b2_region,$b2_city,$b2_pcode,$b2_fax,$b2_street,$b2_build,$b2_door);
					$stmt->fetch();
				}
				
				if(strlen($a1_fax)>1){
					$a1_fax="Fax: ".$a1_fax;
				}
				if(strlen($a2_fax)>1){
					$a2_fax="Fax: ".$a2_fax;
				}
				if(strlen($b1_fax)>1){
					$b1_fax="Fax: ".$b1_fax;
				}
				if(strlen($b2_fax)>1){
					$b2_fax="Fax: ".$b2_fax;
				}
				
				if($logged=='in'){
					$rows = $db -> select("SELECT * from secure_login.members WHERE username = '".$user."' LIMIT 1","secure_login");
					if(isset($rows[0]["Adress1"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"adress").'1: ' . $a1_region." ".$a1_city." MD-".$a1_pcode." ".$a1_fax." str. ".$a1_street." ".$a1_build." ap.".$a1_door .' <a onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'a1\')" href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					else{
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"adress").'1: '.translate_get($_SESSION['lang'],"not_set").'. <a href="#" onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'a1\')" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"set").'</a></p>';
					}
					
					if(isset($rows[0]["Adress2"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"adress").'2: ' . $a2_region." ".$a2_city." MD-".$a2_pcode." ".$a2_fax." str. ".$a2_street." ".$a2_build." ap.".$a2_door .' <a onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'a2\')" href="#" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					else{
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"adress").'2: '.translate_get($_SESSION['lang'],"not_set").'. <a href="#" onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'a2\')" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"set").'</a></p>';
					}
				}
			?>
			</div>
	</div>
	
	<div class="row col-sm-4">
		<h4 class="text-primary"><? echo translate_get($_SESSION['lang'],"billing_adresses"); ?></h4>
			<div class="mr10">
			<?php
				if($logged=='in'){
					$rows = $db -> select("SELECT * from secure_login.members WHERE username = '".$user."' LIMIT 1","secure_login");
					if(isset($rows[0]["BillingAdress1"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"billing_adress").'1: ' . $b1_region." ".$b1_city." MD-".$b1_pcode." ".$b1_fax." str. ".$b1_street." ".$b1_build." ap.".$b1_door.' <a href="#"  onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'b1\')"class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					else{
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"billing_adress").'1: '.translate_get($_SESSION['lang'],"not_set").'. <a href="#" onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'b1\')" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"set").'</a></p>';
					}
					
					if(isset($rows[0]["BillingAdress2"])){
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"billing_adress").'2: ' . $b2_region." ".$b2_city." MD-".$b2_pcode." ".$b2_fax." str. ".$b2_street." ".$b2_build." ap.".$b2_door.' <a href="#" onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'b2\')" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"change").'</a></p>';
					}
					else{
						echo '<p class="text-muted">'.translate_get($_SESSION['lang'],"billing_adress").'2: '.translate_get($_SESSION['lang'],"not_set").'. <a href="#" onclick="goToUrl(updateURLParameter(window.location.href,\'page\',\'adress\'),\'adress\',\'b2\')" class="btn btn-info btn-xs" role="button">'.translate_get($_SESSION['lang'],"set").'</a></p>';
					}
				}
			?>
			</div>
	</div>
</div>