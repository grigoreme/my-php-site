    <?php
    if (!empty($error_msg)) {
        echo $error_msg;
    }
    ?>
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey"><?php echo translate_get($_SESSION['lang'],"registration");?></h3>
				<form class="form-horizontal" action='<?php echo esc_url($_SERVER['REQUEST_URI']); ?>' method="POST" name="registration_form">
					<div class="form-group col-lg-12">
						<label><?php echo translate_get($_SESSION['lang'],"username");?></label>
						<input type="username" name="username" class="form-control" id="username" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label><?php echo translate_get($_SESSION['lang'],"pass");?></label>
						<input type="password" name="password" class="form-control" id="password" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label><?php echo translate_get($_SESSION['lang'],"repeat_pass");?></label>
						<input type="password" name="confirmpwd" class="form-control" id="confirmpwd" value="">
					</div>
									
					<div class="form-group col-lg-6">
						<label><?php echo translate_get($_SESSION['lang'],"email");?></label>
						<input type="email" name="email" class="form-control" id="email" value="">
					</div>
					
					<div class="form-group col-lg-6">
						<label><?php echo translate_get($_SESSION['lang'],"repeat_email");?></label>
						<input type="confirmemail" name="confirmemail" class="form-control" id="confirmemail" value="">
					</div>			
					
					<div class="col-sm-6">
						<input type="checkbox" class="checkbox" /><?php echo translate_get($_SESSION['lang'],"sign_up_news");?>
					</div>
	
					<div class="col-sm-6">
						<input type="checkbox" class="checkbox" /><?php echo translate_get($_SESSION['lang'],"send_notif");?>
					</div>				
					
					<button type="submit" class="btn btn-primary" onclick="return regformhash(this.form,
                               this.form.username,
                               this.form.email,
                               this.form.confirmemail,
                               this.form.password,
                               this.form.confirmpwd);"><?php echo translate_get($_SESSION['lang'],"register");?></button>
				</form>
			</div>
		
			<div class="col-md-6">
				<h3 class="dark-grey"><?php echo translate_get($_SESSION['lang'],"rules");?></h3>
				<ul>
					<li><?php echo translate_get($_SESSION['lang'],"rule1");?></li>
					<li><?php echo translate_get($_SESSION['lang'],"rul32");?></li>
					<li><?php echo translate_get($_SESSION['lang'],"rule3");?></li>
					<li><?php echo translate_get($_SESSION['lang'],"rule4");?>
						<ul>
							<li><?php echo translate_get($_SESSION['lang'],"rule5");?></li>
							<li><?php echo translate_get($_SESSION['lang'],"rule6");?></li>
							<li><?php echo translate_get($_SESSION['lang'],"rule7");?></li>
						</ul>
					</li>
					<li><?php echo translate_get($_SESSION['lang'],"rule8");?></li>
				</ul>
				<p><a href="index.php"><?php echo translate_get($_SESSION['lang'],"back_to_login");?></a>.</p>
			</div>
		</div>
	</section>
</div>
