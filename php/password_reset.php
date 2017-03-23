<div class="container">
	<div class="row col-sm-4">
		<h4 class="text-primary"><?php echo translate_get($_SESSION['lang'],"change_pass");?>:</h4>
			<div class="mr10">
			<?php
				include_once 'inc/register.inc.php';
				include_once 'inc/functions.inc.php';
				
				ob_start();
				$err=true;
				if (login_check($mysqli) == true) {
					$logged = 'in';
				} else {
					$logged = 'out';
				}
				if($logged=='in'){
					if(isset($_POST['p']) && isset($_POST['new1']) && isset($_POST['new2'])){
						$old = $_POST['p'];						
						$new = $_POST['new1'];
						$new2 = $_POST['new2'];
						if($new==$old){
							echo '<p class="text-danger">'.translate_get($_SESSION['lang'],"pass_must_match").'</p>';
						}
						else{
							$user = $_SESSION['username'];
							if ($stmt = $mysqli->prepare("SELECT salt,password FROM members WHERE username = ? LIMIT 1 ")) {
								$stmt->bind_param('s', $user);
								$stmt->execute();    // Execute the prepared query.
								$stmt->store_result();

								// get variables from result.
								$stmt->bind_result($salt,$db_pass);
								$stmt->fetch();

								// hash the password with the unique salt.
								$old = hash('sha512', $old . $salt);
								if($old==$db_pass){
									$password = hash('sha512', $new . $salt);
									$err=false;
									if ($pass_change = $mysqli->prepare("UPDATE members SET password = '$password' WHERE username=?")) {
										$pass_change->bind_param('s', $user);
										$pass_change->execute();    // Execute the prepared query.
									}
									else{
										header("Location: ?page=error&err=Database error: Password");
										exit();
									}
									echo '<p class="text-danger">Your password was successfully changed.</p>';
								}
								else{
									echo '<p class="text-danger">Your old password is wrong!</p>';
								}
							}
						}
					}
					
					echo '</form>';
					
					echo '
						<form action="index.php?page=password_reset" class="form" role="form" method="post" name="reset_form">                      
							'.translate_get($_SESSION['lang'],"old_pass").': <input class="form-control" type="password" name="old" id="old"/>
							'.translate_get($_SESSION['lang'],"pass").': <input class="form-control" type="password"	name="new1"	id="new1"/><br>
							'.translate_get($_SESSION['lang'],"repeat_pass").': <input class="form-control" type="password"	name="new2"	id="new2"/><br>
							<input type="button" class="btn btn-success btn-block" value="'.translate_get($_SESSION['lang'],"change_pass").'" onclick="formhash2(this.form, this.form.old, this.form.new1, this.form.new2);" /> 
						</form>';
				}

			?>
			
			</div>
	</div>
</div>