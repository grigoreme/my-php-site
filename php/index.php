<div class="container" id="content">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body text-center hot-text"><?php echo translate_get($_SESSION['lang'],"top_sale"); ?> <?php echo translate_get($_SESSION['lang'],"notebooks"); ?></div>
		</div>
		<?php
			include_once('inc/connect_notebook.php');
			$lapt = new Notebook("notebook");
			$calc = $lapt -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"");
			for($i=0;$i<count($calc);$i++){
				echo '<div class="col-sm-6 col-lg-4 col-md-4 col-xs-10 col-sm-3">
					<div class="thumbnail">
						<img src="'.$calc[$i]['Cover'].'" alt="'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'">
						<div class="panel-footer">
							<h4><a href="index.php?page=item&item='.$calc[$i]['ID'].'&cat=1">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a>
							<input onclick="addToCart(\'1\',\''.$calc[$i]['ID'].'\',\''.$_SESSION['user_id'].'\',\'1\')" width="30" height="30" type="image" src="img/add-to-cart.png"></input></h4>
							<h4 class="pull-right"><small><del>'.$calc[$i]['Price'].' lei </del></small><a class="text-danger">'.(($calc[$i]['Price'])-1).' lei</a></h4>
							<p></p>
							<br><br>
							<p><small>'.translate_get($_SESSION['lang'],"Memorie").'</small>: '.$calc[$i]['Capacitate'].' '.$calc[$i]['Tip_capacitate'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"Culoare").'</small>: '.$calc[$i]['Culoare'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"Sistem_Operare").'</small>: '.$calc[$i]['Sistem_Operare'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"Procesor").'</small>: '.$calc[$i]['Procesor'].' '.$calc[$i]['Tip_Procesor'].' '.$calc[$i]['Model_Procesor'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"RAM").'</small>: '.$calc[$i]['RAM'].'</p>
						</div>
					</div>
				</div>
				';
			}
		?>
	</div>

	<div class="panel panel-default">
			<div class="panel-body text-center hot-text"><?php echo translate_get($_SESSION['lang'],"top_sale"); ?> <?php echo translate_get($_SESSION['lang'],"phones"); ?></div>
		</div>
		<?php
			include_once('inc/connect_phone.php');
			$phone = new Phone("phone");
			$ph = $phone -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"");
			for($i=0;$i<count($ph);$i++){
				echo '<div class="col-sm-3 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="'.$ph[$i]['Cover'].'" alt="'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'">
						<div class="panel-footer">
							<h4><a href="index.php?page=item&item='.$ph[$i]['ID'].'&cat=2">'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'</a>
							<input onclick="addToCart(\'2\',\''.$calc[$i]['ID'].'\',\''.$_SESSION['user_id'].'\',\'1\')" width="30" height="30" type="image" src="img/add-to-cart.png"></input></h4>
							<h4 class="pull-right"><small><del>'.$ph[$i]['Price'].' lei </del></small><a class="text-danger">'.(($ph[$i]['Price'])-1).' lei</a></h4>
							<p></p>
							<br><br>
							<p><small>'.translate_get($_SESSION['lang'],"Memorie").'</small>: '.$ph[$i]['Memorie'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"SIM_Slots").'</small>: '.$ph[$i]['SIM_Slots'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"Sistem_Operare").'</small>: '.$ph[$i]['Sistem_Operare'].'</p>
							<p><small>'.translate_get($_SESSION['lang'],"Chipset").'</small>: '.$ph[$i]['Serie_Chipset'].' '.$ph[$i]['Model_Chipset'].'</p>
						</div>
					</div>
				</div>
				';
			}
		?>
</div>
