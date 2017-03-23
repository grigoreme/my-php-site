<div class="container">
    <div class="row">	
        <div class="col-md-3">
			
		
            <p class="lead"><?php echo translate_get($_SESSION['lang'],"filter");?></p>
            <div class="list-group">
			<!-- TIP(column left) !-->
			<!--
				<a href="#" id="btn-1" class="list-group-item" data-toggle="collapse" data-target="#submenu1" aria-expanded="false">Brand</a>
				<ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn-1">
					<div class="list-group-item">
						<li><a href="#"><input type="checkbox">Apple</a></li>
						<li><a href="#"><input type="checkbox">Dell</a></li>
						<li><a href="#"><input type="checkbox">Asus</a></li>
						<li><a href="#"><input type="checkbox">HP</a></li>
						<li><a href="#"><input type="checkbox">Lenovo</a></li>
						<li><a href="#"><input type="checkbox">Samsung</a></li>
						<li><a href="#"><input type="checkbox">MSI</a></li>
						<li><a href="#"><input type="checkbox">Toshiba</a></li>
						<li><a href="#"><input type="checkbox">Fujitsu</a></li>
					</div>
				</ul>
			!-->
            </div>
        </div>

        <div class="col-md-9">
			<!--
			<nav class="nav row">
				<ul class="nav col-sm-12">
				<?php/*
					$db = new Db("clopotel_md");
					$rows = $db -> select("SELECT Nume from clopotel_md.Subcategorie WHERE ID_Categorie=".intval($_GET['type']),"clopotel_md");
					foreach($rows as $row){
						echo '<li><a class="col-sm-3 list-group-item">'.$row['Nume'].'</a></li>';
					}*/
				?>
				</ul>
			</nav>
			!-->
			
            <div class="row nav mb20">
				<a href="#" id="btn-sort" class="list-group-item" data-toggle="collapse" data-target="#submenusort" aria-expanded="true"><?php echo translate_get($_SESSION['lang'],"sort"); ?></a>
				<ul class="nav collapse col-sm-12" id="submenusort" role="menu" aria-labelledby="btn-sort">
					<div class="list-group">
						<li><a href="javascript:goToUrl(window.location.href,'sort','Viewed')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"popularity"); ?></a></li>
						<li><a href="javascript:goToUrl(window.location.href,'sort','Rate')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"rating"); ?></a></li>
						<li><a href="javascript:goToUrl(window.location.href,'sort','PriceA')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"Price"); ?>(<?php echo translate_get($_SESSION['lang'],"lower_up"); ?>)</a></li>
						<li><a href="javascript:goToUrl(window.location.href,'sort','PriceD')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"Price"); ?>(<?php echo translate_get($_SESSION['lang'],"upper_low"); ?>)</a></li>
						<li><a href="javascript:goToUrl(window.location.href,'sort','NameA')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"name"); ?>(<?php echo translate_get($_SESSION['lang'],"az"); ?>)</a></li>
						<li><a href="javascript:goToUrl(window.location.href,'sort','NameD')" class="col-sm-4 list-group-item"><?php echo translate_get($_SESSION['lang'],"name"); ?>(<?php echo translate_get($_SESSION['lang'],"za"); ?>)</a></li>
					</div>
				</ul>
			</div>
			
			<div class="row">
				<?php
					$curr_db = $db -> select("SELECT Categorie.Database from clopotel_md.Categorie WHERE ID=".intval($_GET['type']." LIMIT 1"),"clopotel_md");
					$curr_db = $curr_db[0]['Database'];
					if($curr_db=="notebook"){
						include_once('inc/connect_notebook.php');
						$lapt = new Notebook("notebook");
						$calc = $lapt -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"");
						for($i=0;$i<count($calc);$i++){
							echo '<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="'.$calc[$i]['Cover'].'" alt="'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'">
									<div class="panel-footer">
										<h4><a href="index.php?page=item&item='.$calc[$i]['ID'].'&cat='.$_GET['type'].'">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a></h4>
										<h4 class="pull-right"><small><del>'.$calc[$i]['Price'].' lei </del></small>'.(($calc[$i]['Price'])-1).' lei</h4>
										<p></p>
										<br><br>
									
									</div>
								</div>
							</div>
							';
						}
					}
					if($curr_db=="phone"){
						include_once('inc/connect_phone.php');
						$phone = new Phone("phone");
						$ph = $phone -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"");
						for($i=0;$i<count($ph);$i++){
							echo '<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="'.$ph[$i]['Cover'].'" alt="'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'">
									<div class="panel-footer">
										<h4><a href="index.php?page=item&item='.$ph[$i]['ID'].'&cat='.$_GET['type'].'">'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'</a></h4>
										<h4 class="pull-right"><small><del>'.$ph[$i]['Price'].' lei </del></small>'.(($ph[$i]['Price'])-1).' lei</h4>
										<p></p>
										<br><br>
										<p>'.translate_get($_SESSION['lang'],"Memorie").': '.$ph[$i]['Memorie'].'</p>
										<p>'.translate_get($_SESSION['lang'],"SIM_Slots").': '.$ph[$i]['SIM_Slots'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Sistem_Operare").': '.$ph[$i]['Sistem_Operare'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Chipset").': '.$ph[$i]['Serie_Chipset'].' '.$ph[$i]['Model_Chipset'].'</p>
									</div>
								</div>
							</div>';
						}
					}
				?>
                
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>