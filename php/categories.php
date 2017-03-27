<div class="container">
    <div class="row">
        <div class="col-md-3">
            <p class="lead"><?php echo translate_get($_SESSION['lang'],"filter");?></p>
            <div class="list-group " id="filters">

          <?php
            $curr_db = $db -> select("SELECT Categorie.Database from clopotel_md.Categorie WHERE ID=".intval($_GET['type']." LIMIT 1"),"clopotel_md");
            $curr_db = $curr_db[0]['Database'];
            if($curr_db=="notebook"){
  						include_once('inc/connect_notebook.php');
  						$lapt = new Notebook("notebook");
              $filters = $lapt->getFilters();
              foreach($filters as $filter ) {
                if($key!="ID"){
                  echo '<a href="#" id="btn-'.$filter->getId().'" class="list-group-item" data-toggle="collapse" data-target="#'.$filter->getId().'" aria-expanded="false">'.$filter->getFilter().'</a>';
                  echo '
                  <ul class="nav collapse" id="'.$filter->getId().'" role="menu" aria-labelledby="btn-'.$filter->getId().'">
                    <div class="list-group-item" id="'.$filter->getFilter().'">
                      ';
                      foreach($filter->getOptions() as $option){
                        echo '<label><input type="checkbox" name="checkbox" value="'.$option.'">'.$option.'</label></br>';
                      }
                  echo '</div>
                  </ul>
                  ';
                }
              }
            }
            else if($curr_db=="phone"){
              include_once('inc/connect_phone.php');
  						$phone = new Phone("phone");
              $filters = $phone->getFilters();
              foreach($filters as $filter ) {
                if($key!="ID"){
                  echo '<a href="#" id="btn-'.$filter->getId().'" class="list-group-item" data-toggle="collapse" data-target="#'.$filter->getId().'" aria-expanded="false">'.$filter->getFilter().'</a>';
                  echo '
                  <ul class="nav collapse" id="'.$filter->getId().'" role="menu" aria-labelledby="btn-'.$filter->getId().'">
                    <div class="list-group-item" id="'.$filter->getFilter().'">
                      ';
                      foreach($filter->getOptions() as $option){
                      echo '<label><input type="checkbox" name="checkbox" value="'.$option.'">'.$option.'</label></br>';
                      }
                  echo '</div>
                  </ul>
                  ';
                }
              }
            }
          ?>
          <!--
            <button type="button" onclick="filterConfirm()" class="btn btn-default full-width btn-block">CONFIRM</button>
          !-->
            </div>
        </div>

        <div class="col-md-9">

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

			<div class="row" id="items">
				<?php
					if($curr_db=="notebook"){
						include_once('inc/connect_notebook.php');
						$lapt = new Notebook("notebook");
						$calc = $lapt -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"");
            if(count($calc)==0) echo 'nothing found';
						for($i=0;$i<count($calc);$i++){
							echo '<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="thumbnail">
									<img src="'.$calc[$i]['Cover'].'" alt="'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'">
									<div class="panel-footer">
  										<h4><a href="index.php?page=item&item='.$calc[$i]['ID'].'&cat='.$_GET['type'].'">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a>
                      <input onclick="addToCart(\''.$_GET['type'].'\',\''.$calc[$i]['ID'].'\',\''.$_SESSION['user_id'].'\',\'1\')" width="30" height="30" type="image" src="img/add-to-cart.png"></input></h4>
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
							echo '<div class="col-sm-4 col-lg-4 col-md-4"">
								<div class="thumbnail">
									<img src="'.$ph[$i]['Cover'].'" alt="'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'">
									<div class="panel-footer">
										<h4><a href="index.php?page=item&item='.$ph[$i]['ID'].'&cat='.$_GET['type'].'">'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'</a>
                    <input onclick="addToCart(\''.$_GET['type'].'\',\''.$ph[$i]['ID'].'\',\''.$_SESSION['user_id'].'\',\'1\')" width="30" height="30" type="image" src="img/add-to-cart.png"></input></h4>
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
