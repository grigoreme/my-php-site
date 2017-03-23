	<?php
	include_once 'inc/register.inc.php';
	include_once 'inc/functions.inc.php';

	ob_start();
	if (login_check($mysqli) == true) {
		$logged = 'in';
	} else {
		$logged = 'out';
	}
	?>
	<script type="text/JavaScript" src="js/sha512.js"></script>
    <script type="text/JavaScript" src="js/forms.js"></script>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default " role="navigation">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="../index.php">Clopotel.md</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
						<?php
							$db = new Db("clopotel_md");
							$rows = $db -> select("SELECT * from clopotel_md.Categorie","clopotel_md");
							$line=0;
							foreach($rows as $row){
								if($line==0){
									echo '<li><a class="hot-text" href="?page=categories&type='.implode(" ",array_slice($row,0,1)).'">'.implode(" ",array_slice($row,1,1)).'</a></li>';
								}
								elseif($line==1){
									echo '<li><a class="hot-text" href="?page=categories&type='.implode(" ",array_slice($row,0,1)).'">'.implode(" ",array_slice($row,1,1)).'</a></li>
									<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"> '.translate_get($_SESSION['lang'],"others").' <b class="caret"></b></a>
									<ul class="dropdown-menu">';
								}
							}
							echo "</ul>
								</li>";
						?>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input id="search" type="text" class="form-control" placeholder="<?php echo translate_get($_SESSION['lang'],"search");?>">
							</div>
							<button type="button" onclick="goToUrl(updateURLParameter(window.location.href,'page','search'),'search',document.getElementById('search').value)" class="btn btn-default"><?php echo translate_get($_SESSION['lang'],"search");?></button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<?php
								if (login_check($mysqli) != true)
									echo '<li><a href="javascript:goToUrl(window.location.href,\'page\',\'register\')" id="SignUp">'.translate_get($_SESSION['lang'],"register").'</a></li>';
							?>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<?php
									if (login_check($mysqli) == true) {
										echo htmlentities($_SESSION['username']);
									}
									else
										echo translate_get($_SESSION['lang'],"login");
								?><b class="caret"></b></a>
								<ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
									<li>
								<?php
								if (isset($_GET['error'])) {
									echo '<p class="error">'.translate_get($_SESSION['lang'],"error_login").'!</p>';
								}
								if (login_check($mysqli) == true) {
									echo '<p>'.translate_get($_SESSION['lang'],"currently_logged").' '. htmlentities($_SESSION['username']) . '.</p>';
									echo '<input type="button" class="btn btn-success btn-block" value="'.translate_get($_SESSION['lang'],"myaccount").'" onclick="goToUrl(window.location.href,\'page\',\'account\')"/> ';
									echo '<input type="button" class="btn btn-success btn-block" value="'.translate_get($_SESSION['lang'],"mycart").'" onclick="goToUrl(window.location.href,\'page\',\'cart\')"/> ';
									echo '<input type="button" class="btn btn-error btn-block" value="'.translate_get($_SESSION['lang'],"logout").'"	onclick="goToUrl(window.location.href,\'page\',\'process_logout\')"/> ';
									if(isset($_SESSION['access']))
										if($_SESSION['access']==9){
											echo '<h5 class="text-center">'.translate_get($_SESSION['lang'],"admin_panel").'<a class="small">('.translate_get($_SESSION['lang'],"rights").':'.$_SESSION['access'].')</a></h5>';
											echo '<input type="button" class="btn btn-success btn-block" value="'.translate_get($_SESSION['lang'],"database_manage").'" onclick="goToUrl(window.location.href,\'page\',\'dbmanage\')"/> ';
										}
								}
								else{
									echo '
									<form action="index.php?page=process_login" class="form" role="form" method="post"  name="login_form">
									Email: <input class="form-control" type="text" name="email" />
									'.translate_get($_SESSION['lang'],"pass").': <input class="form-control" type="password"	name="password"	id="password"/><br>
									<input type="button" class="btn btn-success btn-block" value="'.translate_get($_SESSION['lang'],"login").'"	onclick="formhash(this.form, this.form.password);" />
								</form>
									';
								}
								?>

								<?php
								if (login_check($mysqli) != true) {
									echo "<p><a href='?goToUrl(window.location.href,\'page\',\'register\')'>".translate_get($_SESSION['lang'],"dont_have_account")."</a></p>";
								}
								?>

							</li>

						</ul>
						<?php
							if($_SESSION['lang']=="EN")
								echo '	<li><a class="hot-text" href="?page=lang&lang=2">'.translate_get($_SESSION['lang'],"ro").'</a></li>
										<li><a class="hot-text" href="?page=lang&lang=3">'.translate_get($_SESSION['lang'],"ru").'</a></li>';
							else if($_SESSION['lang']=="RO")
								echo '	<li><a class="hot-text" href="?page=lang&lang=1">'.translate_get($_SESSION['lang'],"en").'</a></li>
										<li><a class="hot-text" href="?page=lang&lang=3">'.translate_get($_SESSION['lang'],"ru").'</a></li>';
							else if($_SESSION['lang']=="RU")
								echo '	<li><a class="hot-text" href="?page=lang&lang=1">'.translate_get($_SESSION['lang'],"en").'</a></li>
										<li><a class="hot-text" href="?page=lang&lang=2">'.translate_get($_SESSION['lang'],"ro").'</a></li>';
							else
								echo '	<li><a class="hot-text" href="?page=lang&lang=1">'.translate_get($_SESSION['lang'],"en").'</a></li>
										<li><a class="hot-text" href="?page=lang&lang=2">'.translate_get($_SESSION['lang'],"ro").'</a></li>
										<li><a class="hot-text" href="?page=lang&lang=3">'.translate_get($_SESSION['lang'],"ru").'</a></li>';

						?>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</div>
		</div>
	</div>
	<script src="js/main.js"></script>
	<div id="wrapper">
