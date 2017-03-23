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
?>
<div class="container">
	<div class="row col-sm-12">
		<h4 class="text-primary">
		</h4>
		<div class="mr10">
		<?php
			if($logged=='in'){
				if(isset($_POST['first_name'])){
					$first=$_POST['first_name'];
					$last=$_POST['last_name'];
					$email=$_POST['email'];
					if(strlen($first)<3 || ctype_space($first) ||
					strlen($last)<3 || ctype_space($last) ||
					strlen($email)<6 || ctype_space($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)){
						echo translate_get($_SESSION['lang'],"complete_right").translate_get($_SESSION['lang'],"star_obligatory");
					}
					else{
						if ($updateUserData = $mysqli->prepare("UPDATE secure_login.members SET FirstName='$first',LastName='$last',email='$email' WHERE username='$user';")) {
								$updateUserData->execute();    // update row with user data
              echo translate_get($_SESSION['lang'],'succes_change');
							}
							else{
								die();
						  }
					}
				}
				else{
					if ($stmt = $mysqli->prepare("SELECT FirstName,LastName,email
					FROM members
					WHERE members.username = ?")) {
						$stmt->bind_param('s', $user);
						$stmt->execute();    // Execute the prepared query.
						$stmt->store_result();

						// get variables from result.
						$stmt->bind_result($first,$last,$email);
						$stmt->fetch();
					}
					else{
						echo "SQL ERROR";
					}
				}
				echo '
						<form action="" class="form" role="form" method="post" name="change_form">
							'.translate_get($_SESSION['lang'],'first_name' ).':* <input value="'.$first.'" class="form-control" type="text" name="first_name"/>
  						'.translate_get($_SESSION['lang'],'last_name' ).':* <input value="'.$last.'" class="form-control" type="text" name="last_name"/>
              '.translate_get($_SESSION['lang'],'email' ).':* <input value="'.$email  .'" class="form-control" type="text" name="email"/>
							<button type="submit" class="btn btn-primary btn-block" onclick="goToUrl(window.location.href,\'done\',\'1\')">'.translate_get($_SESSION['lang'],'change' ).'</button>
						</form>';
						echo '<button type="button" onclick="goToUrl(window.location.href,\'page\',\'account\')" class="btn btn-primary btn-block">'.translate_get($_SESSION['lang'],"back_to_acc").'</button>';

			}
		?>
		</div>
	</div>
</div>
