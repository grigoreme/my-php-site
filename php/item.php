<div class="container">
  <div class="row">
    <div class="col-md-12">
			<div class="row">
				<?php
					$curr_db = $db -> select("SELECT Categorie.Database from clopotel_md.Categorie WHERE ID=".intval($_GET['cat']." LIMIT 1"),"clopotel_md");
					$curr_db = $curr_db[0]['Database'];
          if($logged=='in'){
            $userID=$_SESSION['user_id'];
            $catID=$_GET['cat'];
            $itemID=$_GET['item'];
            $date = date('Y-m-d H:i:s');
            if(isset($catID,$itemID,$userID)){
              $insert = $db -> query("INSERT INTO View VALUES(null,'$userID','$catID','$itemID','$date')","secure_login");
            }
          }
          //
					if($curr_db=="notebook"){
						include_once('inc/connect_notebook.php');
						$lapt = new Notebook("notebook");
						$calc = $lapt -> extract_toArray("ID");
						for($i=0;$i<count($calc);$i++){
							echo '<div class="thumbnail">
									<div class="col-sm-4 col-lg-4 col-md-4">
									<img class="img-responsive" src="'.$calc[$i]['Cover'].'" alt="">
									</div>
									<div class="caption-full container">
										<h3 class="text-danger pull-right">'.$calc[$i]['Price'].' Lei</h3>
										<h4><a href="#">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a>
										</h4>
										<p><small>'.translate_get($_SESSION['lang'],"Firma")."</small>: ".$calc[$i]["Firma"].'</p>
										<p><small>'.translate_get($_SESSION['lang'],"Model")."</small>: ".$calc[$i]["Model"].'</p>
										<p><small>'.translate_get($_SESSION['lang'],"Serie")."</small>: ".$calc[$i]["Serie"].'</p>
										<p><small>'.translate_get($_SESSION['lang'],"Culoare")."</small>: ".$calc[$i]["Culoare"].'</p>
										<p><small>'.translate_get($_SESSION['lang'],"Procesor")."</small>: ".$calc[$i]["Procesor"].'</p>
										<p><small>'.translate_get($_SESSION['lang'],"Model_Procesor")."</small>: ".$calc[$i]["Model_Procesor"].'</p>
                    <button style="display: block; width: 100%;" class = "btn btn-default" data-toggle="collapse" data-target="#more">More Information</button>
                    <div id="more" class="collapse container caption-full">
                      <div class="col-md-3 col-md-offset-3">
    										<p><small>'.translate_get($_SESSION['lang'],"Nuclee")."</small>: ".$calc[$i]["Nuclee"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Frecventa")."</small>: ".$calc[$i]["Frecventa"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Tip_Procesor")."</small>: ".$calc[$i]["Tip_Procesor"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Display")."</small>: ".$calc[$i]["Display"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Rezolutie")."</small>: ".$calc[$i]["Rezolutie"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Diagonala")."</small>: ".$calc[$i]["Diagonala"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Alimentare")."</small>: ".$calc[$i]["Alimentare"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Sistem_Operare")."</small>: ".$calc[$i]["Sistem_Operare"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Dimensiune")."</small>: ".$calc[$i]["Dimensiune"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Greutate")."</small>: ".$calc[$i]["Greutate"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"RAM")."</small>: ".$calc[$i]["RAM"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Capacitate")."</small>: ".$calc[$i]["Capacitate"].'</p>
      									<p><small>'.translate_get($_SESSION['lang'],"Tip_capacitate")."</small>: ".$calc[$i]["Tip_capacitate"].'</p>
      									<p><small>'.translate_get($_SESSION['lang'],"Video")."</small>: ".$calc[$i]["Video"].'</p>
                      </div>
                      <div class="col-md-3 col-md-offset-1">
    										<p><small>'.translate_get($_SESSION['lang'],"Capacitate_Video")."</small>: ".$calc[$i]["Capacitate_Video"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Bluetooth")."</small>: ".$calc[$i]["Bluetooth"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Wifi")."</small>: ".$calc[$i]["Wifi"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"USB2_0")."</small>: ".$calc[$i]["USB2_0"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"USB3_0")."</small>: ".$calc[$i]["USB3_0"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"HDMI")."</small>: ".$calc[$i]["HDMI"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"VGA")."</small>: ".$calc[$i]["VGA"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"RJ_45")."</small>: ".$calc[$i]["RJ_45"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Audio")."</small>: ".$calc[$i]["Audio"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"DVD")."</small>: ".$calc[$i]["DVD"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Camera")."</small>: ".$calc[$i]["Camera"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Microfon")."</small>: ".$calc[$i]["Microfon"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Card_reader")."</small>: ".$calc[$i]["Card_reader"].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Num_pad")."</small>: ".$calc[$i]["Num_pad"].'</p>
                      </div>
                    </div>
									</div>
									<div class="ratings">

                    </div>
                </div><br><Br>
								<br><Br>';
						}
					}
					if($curr_db=="phone"){
						include_once('inc/connect_phone.php');
							$phone = new Phone("phone");
							$ph = $phone -> extract_toArray("ID");
							for($i=0;$i<count($ph);$i++){
								echo '<div class="thumbnail">
									<div class="col-sm-4 col-lg-4 col-md-4">
									<img class="img-responsive" src="'.$ph[$i]['Cover'].'" alt="">
									</div>
									<div class="caption-full container">
										<h4 class="text-danger pull-right">'.$ph[$i]['Price'].' Lei</h4>
										<h4 class=""><a href="#">'.$ph[$i]['Firma'].' '.$ph[$i]['Model'].' '.$ph[$i]['Serie'].'</a>
										</h4>
                    <div class="col-md-3"
  										<p><small>'.translate_get($_SESSION['lang'],"Firma")."</small>: ".$ph[$i]['Firma'].'</p>
  										<p><small>'.translate_get($_SESSION['lang'],"Model")."</small>: ".$ph[$i]['Model'].'</p>
  										<p><small>'.translate_get($_SESSION['lang'],"Serie")."</small>: ".$ph[$i]['Serie'].'</p>
  										<p><small>'.translate_get($_SESSION['lang'],"Culoare")."</small>: ".$ph[$i]['Culoare'].'</p>
  										<p><small>'.translate_get($_SESSION['lang'],"Tastatura")."</small>: ".$ph[$i]['Tastatura'].'</p>
  										<p><small>'.translate_get($_SESSION['lang'],"Greutate")."</small>: ".$ph[$i]['Greutate'].'</p>
                    </div>
                    <button style="display: block; width: 100%;" class = "btn btn-default" data-toggle="collapse" data-target="#more">More Information</button>
                    <div id="more" class="collapse container caption-full">
                      <div class="col-md-3 col-md-offset-3">
                        <p><small>'.translate_get($_SESSION['lang'],"Dimensiune")."</small>: ".$ph[$i]['Dimensiune'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"2G")."</small>: ".$ph[$i]['2G'].'</p>
    										<p><small>'.translate_get($_SESSION['lan2"g'],"3G")."</small>: ".$ph[$i]['3G'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"4G")."</small>: ".$ph[$i]['4G'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"SIM")."</small>: ".$ph[$i]['SIM'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"SIM_Slots")."</small>: ".$ph[$i]['SIM_Slots'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Sistem_Operare")."</small>: ".$ph[$i]['Sistem_Operare'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"GPS")."</small>: ".$ph[$i]['GPS'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Rezolutie_Display")."</small>: ".$ph[$i]['Rezolutie_Display'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Tehnologie_Display")."</small>: ".$ph[$i]['Tehnologie_Display'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"TouchScreen")."</small>: ".$ph[$i]['TouchScreen'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Culori_K")."</small>: ".$ph[$i]['Culori_K'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Diagonala")."</small>: ".$ph[$i]['Diagonala'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"MultiTouch")."</small>: ".$ph[$i]['MultiTouch'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"SlotMemorie")."</small>: ".$ph[$i]['SlotMemorie'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"SlotMemorie_Limit")."</small>: ".$ph[$i]['SlotMemorie_Limit'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Memorie")."</small>: ".$ph[$i]['Memorie'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"RAM")."</small>: ".$ph[$i]['RAM'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"GPRS")."</small>: ".$ph[$i]['GPRS'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Bluetooth")."</small>: ".$ph[$i]['Bluetooth'].'</p>
                      </div>
                      <div class="col-md-3 col-md-offset-1">
    										<p><small>'.translate_get($_SESSION['lang'],"Wifi")."</small>: ".$ph[$i]['WIFI'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"NFC")."</small>: ".$ph[$i]['NFC'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"USB")."</small>: ".$ph[$i]['USB'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Audio_Jack")."</small>: ".$ph[$i]['Audio_Jack'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Camera")."</small>: ".$ph[$i]['Camera'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Rezoltie_Camera")."</small>: ".$ph[$i]['Rezoltie_Camera'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Rezolutie_Foto")."</small>: ".$ph[$i]['Rezolutie_Foto'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Rezolutie_Video")."</small>: ".$ph[$i]['Rezolutie_Video'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Blitz")."</small>: ".$ph[$i]['Blitz'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Camera_Frontala")."</small>: ".$ph[$i]['Camera_Frontala'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Blitz_Frontal")."</small>: ".$ph[$i]['Blitz_Frontal'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Sensor_Frontal")."</small>: ".$ph[$i]['Sensor_Frontal'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Baterie")."</small>: ".$ph[$i]['Baterie'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Capacitate_Baterie")."</small>: ".$ph[$i]['Capacitate_Baterie'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Radio")."</small>: ".$ph[$i]['Radio'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Producator_Chipset")."</small>: ".$ph[$i]['Producator_Chipset'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Serie_Chipset")."</small>: ".$ph[$i]['Serie_Chipset'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"Model_Chipset")."</small>: ".$ph[$i]['Model_Chipset'].'</p>
    										<p><small>'.translate_get($_SESSION['lang'],"FingerPrint")."</small>: ".$ph[$i]['FingerPrint'].'</p>
                      </div>
                    </div>
									</div>
									<div class="ratings">

											</div>
							</div><br><Br>
								<br><Br>';
						}
					}
				?>

            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>
