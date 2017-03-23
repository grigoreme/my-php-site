<?php
	//rename all id's by ID_+nume tabel
	$db = new Db("clopotel_md");
	$rows = $db -> select("SELECT * from clopotel_md.Categorie","clopotel_md");
	$cat_name;
	foreach($rows as $row){
		if($row['ID']==$_GET['type']){
			$cat_name=strtolower($row['Database']);
		}
	}
	echo '<div class="container" id="dbmanage">
	<div class="row">';
	foreach($rows as $row){
		echo '<input class="col-centered text-center btn btn-success col-sm-4" value="'.implode(" ",array_slice($row,1,1)).'" type="button" onclick="goToUrlDiv(window.location.href,\'type\',\''.implode(" ",array_slice($row,0,1)).'\',dbmanage)"></input>';
	}
	if(isset($_GET['type'])){
		$all_Tables = new Db($cat_name);
		$all_Tables_arr = $all_Tables -> select("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='".$cat_name."' ",$cat_name);
		echo '
		<div class="panel-group mt20">
			<div class="panel panel-default">
			<div class="panel-heading">';
			echo $cat_name;
			echo '</div>
				<div class="panel-body">';
				if($all_Tables_arr){
					foreach($all_Tables_arr as $val){
						echo '<input class="col-centered text-center btn btn-default col-sm-4" value="'.implode(" ",array_slice($val,0,1)).'" type="button" onclick="goToUrlDiv(window.location.href,\'table\',\''.implode(" ",array_slice($val,0,1)).'\',dbmanage)"></input>';
					}
				}
				else{
					echo "Database not found!";
				}


				if(isset($_GET['table'])){
					echo '<div class="table-responsive">
							<table class="table table-striped table-bordered mt20">
								<thead><tr>';
									$all_columns = new Db($cat_name);
									$all_columns_arr = $all_columns -> select("DESCRIBE ".$cat_name.".".$_GET['table'],$cat_name);
									//var_dump($all_columns_arr);
									if($all_columns_arr){
										foreach($all_columns_arr as $column){
											echo "<td>";
											echo implode(" ",array_slice($column,0,1));
											echo "</td>";
										}
									}
									else {
										echo "Table not found!";
									}
					echo '		</tr></thead>
								<tbody>';
									$all_rows = new Db($cat_name);
									$all_rows_arr = $all_rows -> select("select * FROM ".$cat_name.".".$_GET['table'],$cat_name);
									$t_all_rows_arr = $all_rows -> select("DESCRIBE ".$cat_name.".".$_GET['table'],$cat_name);
									$k=0;
									foreach($t_all_rows_arr as $t_all_rows_arr_t){
										$rows_types[$k]=$t_all_rows_arr_t["Type"];
										$k++;
									}
									if($all_rows_arr){
										foreach($all_rows_arr as $a_row){
											$a_row_keys = array_keys($a_row);
											echo "<tr>";
											foreach($a_row as $a_row_val){
												echo "<td>";
												echo $a_row_val;
												echo "</td>";
											}
											echo "</tr>";
										}
										echo "<tr>";
									}
									else{
										echo "Table not found!";
									}

									$k=0;
									if($all_columns_arr)
									foreach($all_columns_arr as $column){
										echo "<td>";
										if($column['Field']!="ID")
										echo '<input id="input_'.$k.'" name="'.$rows_types[$k].'" type="text">';
										echo "</td>";
										$k++;
									}
									echo "</tr>";
					echo 		'</tbody>
					</table>
					<input type="button" class="col-centered text-center btn btn-success" onclick="add_element(\''.$cat_name.'\',\''.$_GET['table'].'\')" value="Adauga '.$cat_name.' > '.$_GET['table'].'" id="add_row">
					</div>
					<div id="result" class="row">
					</div>';
				}
				echo '</div>
			</div>
		</div>';
		echo '</div>';
		echo '</div>';
	}
?>
