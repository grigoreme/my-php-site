<div class="container">
    <div class="row">	
        
        <div class="col-md-12">
		
			<div class="row">
				<?php
					$curr_db = $db -> select("SELECT Categorie.Database from clopotel_md.Categorie WHERE ID=".intval($_GET['cat']." LIMIT 1"),"clopotel_md");
					$curr_db = $curr_db[0]['Database'];
					if($curr_db=="notebook"){
						include_once('inc/connect_notebook.php');
						$lapt = new Notebook("notebook");
						$calc = $lapt -> extract_toArray("ID");
						for($i=0;$i<count($calc);$i++){
							echo '<div class="thumbnail">
									<div class="col-sm-4 col-lg-4 col-md-4">
									<img class="img-responsive" src="'.$calc[$i]['Cover'].'" alt="">
									</div>
									<div class="caption-full">
										<h4 class="pull-right">'.$calc[$i]['Price'].' Lei</h4>
										<h4><a href="#">'.$calc[$i]['Firma'].' '.$calc[$i]['Model'].' '.$calc[$i]['Serie'].'</a>
										</h4>
										<p>'.translate_get($_SESSION['lang'],"Firma").": ".$calc[$i]["Firma"].'</p>
										<p>'.translate_get($_SESSION['lang'],"Model").": ".$calc[$i]["Model"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Serie").": ".$calc[$i]["Serie"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Culoare").": ".$calc[$i]["Culoare"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Procesor").": ".$calc[$i]["Procesor"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Model_Procesor").": ".$calc[$i]["Model_Procesor"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Nuclee").": ".$calc[$i]["Nuclee"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Frecventa").": ".$calc[$i]["Frecventa"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Tip_Procesor").": ".$calc[$i]["Tip_Procesor"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Display").": ".$calc[$i]["Display"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Rezolutie").": ".$calc[$i]["Rezolutie"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Diagonala").": ".$calc[$i]["Diagonala"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Alimentare").": ".$calc[$i]["Alimentare"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Sistem_Operare").": ".$calc[$i]["Sistem_Operare"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Dimensiune").": ".$calc[$i]["Dimensiune"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Greutate").": ".$calc[$i]["Greutate"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"RAM").": ".$calc[$i]["RAM"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Capacitate").": ".$calc[$i]["Capacitate"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Tip_capacitate").": ".$calc[$i]["Tip_capacitate"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Video").": ".$calc[$i]["Video"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Capacitate_Video").": ".$calc[$i]["Capacitate_Video"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Bluetooth").": ".$calc[$i]["Bluetooth"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Wifi").": ".$calc[$i]["Wifi"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"USB2_0").": ".$calc[$i]["USB2_0"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"USB3_0").": ".$calc[$i]["USB3_0"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"HDMI").": ".$calc[$i]["HDMI"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"VGA").": ".$calc[$i]["VGA"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"RJ_45").": ".$calc[$i]["RJ_45"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Audio").": ".$calc[$i]["Audio"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"DVD").": ".$calc[$i]["DVD"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Camera").": ".$calc[$i]["Camera"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Microfon").": ".$calc[$i]["Microfon"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Card_reader").": ".$calc[$i]["Card_reader"].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Num_pad").": ".$calc[$i]["Num_pad"].'</p>
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
									<div class="caption-full">
										<h4 class="pull-right">'.$ph[$i]['Price'].' Lei</h4>
										<h4><a href="#">'.$ph[$i]['Firma'].' '.$ph[$i]['Model'].' '.$ph[$i]['Serie'].'</a>
										</h4>
										<p>'.translate_get($_SESSION['lang'],"Firma").": ".$ph[$i]['Firma'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Model").": ".$ph[$i]['Model'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Serie").": ".$ph[$i]['Serie'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Culoare").": ".$ph[$i]['Culoare'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Tastatura").": ".$ph[$i]['Tastatura'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Greutate").": ".$ph[$i]['Greutate'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Dimensiune").": ".$ph[$i]['Dimensiune'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"2G").": ".$ph[$i]['2G'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"3G").": ".$ph[$i]['3G'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"4G").": ".$ph[$i]['4G'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"SIM").": ".$ph[$i]['SIM'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"SIM_Slots").": ".$ph[$i]['SIM_Slots'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Sistem_Operare").": ".$ph[$i]['Sistem_Operare'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"GPS").": ".$ph[$i]['GPS'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Rezolutie_Display").": ".$ph[$i]['Rezolutie_Display'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Tehnologie_Display").": ".$ph[$i]['Tehnologie_Display'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"TouchScreen").": ".$ph[$i]['TouchScreen'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Culori_K").": ".$ph[$i]['Culori_K'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Diagonala").": ".$ph[$i]['Diagonala'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"MultiTouch").": ".$ph[$i]['MultiTouch'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"SlotMemorie").": ".$ph[$i]['SlotMemorie'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"SlotMemorie_Limit").": ".$ph[$i]['SlotMemorie_Limit'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Memorie").": ".$ph[$i]['Memorie'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"RAM").": ".$ph[$i]['RAM'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"GPRS").": ".$ph[$i]['GPRS'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Bluetooth").": ".$ph[$i]['Bluetooth'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Wifi").": ".$ph[$i]['WIFI'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"NFC").": ".$ph[$i]['NFC'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"USB").": ".$ph[$i]['USB'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Audio_Jack").": ".$ph[$i]['Audio_Jack'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Camera").": ".$ph[$i]['Camera'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Rezoltie_Camera").": ".$ph[$i]['Rezoltie_Camera'].'</p>	
										<p>'.translate_get($_SESSION['lang'],"Rezolutie_Foto").": ".$ph[$i]['Rezolutie_Foto'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Rezolutie_Video").": ".$ph[$i]['Rezolutie_Video'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Blitz").": ".$ph[$i]['Blitz'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Camera_Frontala").": ".$ph[$i]['Camera_Frontala'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Blitz_Frontal").": ".$ph[$i]['Blitz_Frontal'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Sensor_Frontal").": ".$ph[$i]['Sensor_Frontal'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Baterie").": ".$ph[$i]['Baterie'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Capacitate_Baterie").": ".$ph[$i]['Capacitate_Baterie'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Radio").": ".$ph[$i]['Radio'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Producator_Chipset").": ".$ph[$i]['Producator_Chipset'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Serie_Chipset").": ".$ph[$i]['Serie_Chipset'].'</p>
										<p>'.translate_get($_SESSION['lang'],"Model_Chipset").": ".$ph[$i]['Model_Chipset'].'</p>
										<p>'.translate_get($_SESSION['lang'],"FingerPrint").": ".$ph[$i]['FingerPrint'].'</p>
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