<?php
include_once('connect.inc.php');
	//$aux->Name="myaccount"; exemplu declarare
	//$aux->Text="My Account"; exemplu declarare
	//$lang_en=translate_add($lang_en,"myaccount","My account");  //adaugare element prin functie
	//echo translate_get($lang_en,"myaccount"); //exemplu apelare functie
	class Lang{
		public $Lang="";
		public $Name="";
		public $Text="";
	}

	$aux = new Lang();
	$lang=Array(new Lang());

	function translate_add($lang_name,$name,$text){
		global $lang;
		$aux=new Lang();
		$aux->Lang=$lang_name;
		$aux->Name=$name;
		$aux->Text=$text;
		$lang[]=$aux;
	}

	function translate_get($lang_name,$name){
		$result="String not found[".$name."]!";
		global $lang;
		foreach($lang as $translate){
			if(strtolower((string)$translate->Lang)==strtolower($lang_name))
			if($translate->Name==$name){
				$result=$translate->Text;
			}
		}
		return $result;
	}

	$db = new Db("clopotel_md");
	$translate_en = $db->select("SELECT Language,KeyWord,Translate FROM Translate","clopotel_md");

	foreach($translate_en as $translate){
		translate_add($translate['Language'],$translate['KeyWord'],$translate['Translate']);
	}
?>
