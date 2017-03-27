<div class="container">
    <div class="row">
      <div class="col-md-12">

      <div class="nav mb20">
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

			<div class="container" id="items">
				<?php
        if(!isset($_GET['search']) || strlen($_GET['search'])<4)
          echo '<h4>'.translate_get($_SESSION['lang'],"search_rule").'</h4>';
        else{
          $k=0;
						include_once('inc/connect_notebook.php');
						$lapt = new Notebook("notebook");
						$calc = $lapt -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"","",isset($_GET['search'])?$_GET['search']:"");
            for($i=0;$i<count($calc);$i++){
              $k++;
							echo '<div class="col-sm-3 col-lg-3 col-md-3">
								<div class="thumbnail">
									<img src="'.$calc[$i]['Cover'].'" alt="'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'">
									<div class="panel-footer">
										<h4><a href="index.php?page=item&item='.$calc[$i]['ID'].'&cat=1">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a></h4>
										<h4 class="pull-right"><small><del>'.$calc[$i]['Price'].' lei </del></small>'.(($calc[$i]['Price'])-1).' lei</h4>
										<p></p>
										<br><br>

									</div>
								</div>
							</div>
							';
						}
						include_once('inc/connect_phone.php');
						$phone = new Phone("phone");
						$ph = $phone -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"","",isset($_GET['search'])?$_GET['search']:"");
						for($i=0;$i<count($ph);$i++){
              $k++;
							echo '<div class="col-sm-3 col-lg-3 col-md-3"">
								<div class="thumbnail">
									<img src="'.$ph[$i]['Cover'].'" alt="'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'">
									<div class="panel-footer">
										<h4><a href="index.php?page=item&item='.$ph[$i]['ID'].'&cat=2">'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'</a></h4>
										<h4 class="pull-right"><small><del>'.$ph[$i]['Price'].' lei </del></small>'.(($ph[$i]['Price'])-1).' lei</h4>
										<p></p>
										<br><br>
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
