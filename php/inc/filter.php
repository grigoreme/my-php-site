<?php
class Filter {
  private $id=0;

  private $value='';
  private $options;

  public function __construct($val="",$opt=""){
    $this->value=$val;
    $this->options=$opt;
  }

  public function getFilters($string){
    $filters = explode(',',$string);
    return $filters;
  }

  public function getFilterFromString($string){ // used in addFilter.php
    return explode('==>',$string); //return from value==>option value,option
  }

  public function setFilterFromString($string){ // used in addFilter.php
    $result=$this->getFilterFromString($string);
    $this->value=$result[0];
    $this->options[]=$result[1];
  }

  public function getFilter(){
    return $this->value;
  }

  public function setId($_id){
    $this->id=$_id;
  }

  public function getOptions(){
    return $this->options;
  }

  public function getId(){
    return $this->id;
  }

  public function addOptions(){
    if(!is_array($this->options)){
      $this->options=array($this->options);
    }
    $args = func_num_args();
    if($args>0){
      for($k=0;$k<$args;$k++)
        $this->options[]=func_get_arg($k);
      }
    else{
      $this->options[]=func_get_arg(0);
    }
  }
}
?>
