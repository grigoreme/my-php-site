<?php
	include_once('inc/translate.php');
  include_once('inc/filter.php');

  function in_filters($filters,$filter){//aray,string // similar to in_array()
    $k=0;
    foreach($filters as $filt){
      if($filt->getFilter() == $filter)
        return $k;
      $k++; //return position in array
    }
    return -1;
  }

  function addFilter(&$filters,$filter,$option){ //array,string,string
    if(in_filters($filters,$filter)!=-1 ){
      $filters[in_filters($filters,$filter)]->addOptions($option);
    }
    else{
      $filters[]=new Filter($filter,$option);
    }
  }

  function filtersToSQL($filters){
    $SQL="";
    $k=0;
    $len = count($filters);
    foreach($filters as $filter){
      $end=$k != $len - 1?' AND ':'';
      if(is_array($filter->getOptions()))
        //$SQL=$SQL . "(".implode(',', $filter->getOptions()) .") IN ".$filter->getFilter().".".$filter->getFilter().$end;
        $SQL=$SQL . $filter->getFilter().".".$filter->getFilter()." IN ('".implode('\',\'', $filter->getOptions()) ."') ".$end;
      else{
        $SQL=$SQL . "'".$filter->getOptions() ."' = ".$filter->getFilter().".".$filter->getFilter().$end;
      }
      $k++;
    }
    return $SQL;
  }

  $filters=array();
  $filter=new Filter(); //needed only for some functions

  $db = new Db("clopotel_md");
  $curr_db = $db -> select("SELECT Categorie.Database from Categorie WHERE Categorie.ID=".intval($_GET['type']." LIMIT 1"),"clopotel_md"); //find current database ex: phone/notebook
  $arrayOfFilters=$filter->getFilters($_GET['filter']); //culoare==>Black,culoare==>White //transform string to array

  foreach($arrayOfFilters as $f){
    $f=$filter->getFilterFromString($f);
    addFilter($filters,$f[0],$f[1]); //array of all filters, $filter(string), $option(string)  //add array to Object array (final transformation)
  }


  $filterSQL = filtersToSQL($filters); //prepare SQL to send to the database

  $proceed=false;//control point if we should integrate SQL or not

  if(Count($filters>=0))
    if($filters[0]->getOptions()!=null)
      $proceed=true;


  $curr_db=$curr_db[0]['Database'];
  ?>
  <div class="container" id="items">
    <?php
      if($curr_db=="notebook"){
        include_once('inc/connect_notebook.php');
        $lapt = new Notebook("notebook");
        $calc = $lapt -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"",$proceed?$filterSQL:'');

				//var_dump($_GET['sort']);

        if(Count($lapt)==0){
          echo '<div class="container"><p class="h2">'.translate_get('EN','nothing_found').'</p></div>';
        }
        else
        for($i=0;$i<count($calc);$i++){
          echo '<div class="col-sm-3 col-lg-3 col-md-3"">
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
        $ph = $phone -> extract_toArray(isset($_GET['sort'])?$_GET['sort']:"",$proceed?$filterSQL:'');

        if(Count($ph)==0){
          echo '<div class="container"><p class="h2">'.translate_get('EN','nothing_found').'</p></div>';
        }
        else
        for($i=0;$i<count($ph);$i++){
          echo '<div class="col-sm-3 col-lg-3 col-md-3"">
            <div class="thumbnail">
              <img src="'.$ph[$i]['Cover'].'" alt="'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'">
              <div class="panel-footer">
                <h4><a href="index.php?page=item&item='.$ph[$i]['ID'].'&cat='.$_GET['type'].'">'.$ph[$i]['Firma'].' '.$ph[$i]['Serie'].' '.$ph[$i]['Model'].'</a></h4>
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
