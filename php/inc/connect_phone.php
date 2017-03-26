<?php
include_once('filter.php');
class Phone {
    // The database connection
    protected static $connection;
	protected static $database;

	function __construct($db) {
		self::$database=$db;
	}

    /**
     * Connect to the database
     *
     * @return bool false on failure / mysqli MySQLi object instance on success
     */
    public function connect($database) {
        // Try and connect to the database
        if(!isset(self::$connection)) {
            // Load configuration as an array. Use the actual location of your configuration file
            $config = parse_ini_file('config.ini');
            self::$connection = new mysqli('localhost',$config['username'],$config['password'],$database);
        }

        // If connection was not successful, handle the error
        if(self::$connection === false) {
            // Handle error - notify administrator, log to a file, show an error screen, etc.
            return false;
        }
        return self::$connection;
    }

    public function getFilters(){
      $filters = $this->select("SELECT TABLE_NAME AS 'Filter' FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='phone' AND TABLE_NAME!='phone'  ORDER BY TABLE_NAME ASC ",'phone');
      $temp = array();
      for($k=0;$k<Count($filters);$k++){
        if($filters[$k]['Filter']!='Camera'){
          $_options=$this->select('SELECT DISTINCT '.$filters[$k]['Filter'].' FROM '.$filters[$k]['Filter'] .' ORDER BY '.$filters[$k]['Filter'].' ASC','phone');
          if($_options){
            $temp[$k]=new Filter($filters[$k]['Filter'],array());
            $temp[$k]->setId($k);
            foreach($_options as $option){
              $temp[$k]->addOptions($option[$filters[$k]['Filter']]);
            }
          }
        }
      }
      return $temp;
    }

    /**
     * Query the database
     *
     * @param $query The query string
     * @return mixed The result of the mysqli::query() function
     */
    public function query($query,$db) {
        // Connect to the database

        $connection = $this -> connect($db);

        // Query the database
        $result = $connection -> query($query);

        return $result;
    }

    /**
     * Fetch rows from the database (SELECT query)
     *
     * @param $query The query string
     * @return bool False on failure / array Database rows on success
     */
    public function insert($query,$db) {
		$connection = $this -> connect($db);
        //$result = $this -> query($query);
		if ($connection->query($query) === TRUE) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $query . "<br>" . $connection->error;
		}

	}

    public function select($query,$db) {
        $rows = array();
        $result = $this -> query($query,$db);
        if($result === false) {
            return false;
        }
        while ($row = $result -> fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
    }

    /**
     * Fetch the last error from the database
     *
     * @return string Database error message
     */
    public function error($db) {
        $connection = $this -> connect($db);
        return $connection -> error;
    }

    /**
     * Quote and escape value for use in a database query
     *
     * @param string $value The value to be quoted and escaped
     * @return string The quoted and escaped string
     */
    public function quote($value,$db) {
        $connection = $this -> connect($db);
        return "'" . $connection -> real_escape_string($value) . "'";
    }

	protected $Ids=Array("ID"=>0);

	public $Phone = Array(
		"ID"=>'',
		"Firma"=>'',
		"Model"=>'',
		"Serie"=>'',
		"Culoare"=>'',
		"Tastatura"=>'',
		"Greutate"=>'',
		"Dimensiune"=>'',
		"2G"=>'',
		"3G"=>'',
		"4G"=>'',
		"SIM"=>'',
		"SIM_Slots"=>'',
		"Sistem_Operare"=>'',
		"GPS"=>'',
		"Rezolutie_Display"=>'',
		"Tehnologie_Display"=>'',
		"TouchScreen"=>'',
		"Culori_K"=>'',
		"Diagonala"=>'',
		"MultiTouch"=>'',
		"SlotMemorie"=>'',
		"SlotMemorie_Limit"=>'',
		"Memorie"=>'',
		"RAM"=>'',
		"GPRS"=>'',
		"Bluetooth"=>'',
		"WIF"=>'',
		"NFC"=>'',
		"USB"=>'',
		"Audio_Jack"=>'',
		"Camera"=>'',
		"Rezoltie_Camera"=>'',
		"Rezolutie_Foto"=>'',
		"Rezolutie_Video"=>'',
		"Blitz"=>'',
		"Camera_Frontala"=>'',
		"Blitz_Frontal"=>'',
		"Sensor_Frontal"=>'',
		"Baterie"=>'',
		"Capacitate_Baterie"=>'',
		"Radio"=>'',
		"Producator_Chipset"=>'',
		"Serie_Chipset"=>'',
		"Model_Chipset"=>'',
		"FingerPrint"=>'',
		"Price"=>'',
		"Cover"=>'');

	/*private $query = "SELECT
						phone.ID,
						Firma.Firma,
						Serie.Serie,
						Model.Model,
						Culoare.Culoare,
						Sistem_Operare.Sistem_Operare,
						phone.Tastatura, phone.Greutate,phone.Dimensiune,phone.2G,
						phone.3G,phone.4G,phone.SIM,phone.SIM_Slots,GPS,phone.Slot_Memorie,phone.Slot_Memorie_Limit,
						phone.Memorie,phone.RAM,phone.GPRS,phone.Bluetooth,phone.WIFI,phone.NFC,phone.USB,phone.AudioJack,
						phone.Radio,phone.FingerPrint,phone.Price,phone.Cover,
						Display.Rezolutie,Display.Tehnologie,Display.TouchScreen,Display.Culori_K,Display.Diagonala,Display.Multitouch,
						Camera.Camera,Camera.Rezolutie_Sensor,Camera.Rezolutie_Foto,Camera.Rezolutie_Video,Camera.Blitz,Camera.Camera_Frontala,Camera.Blitz_Frontal,Camera.Sensor_Frontal,
						Baterie.Baterie,Baterie.Capacitate,
						Producator_Chipset.Producator,
						Model_Chipset.Model_Chipset,
						Serie_Chipset.Serie_Chipset
					FROM
						Baterie, Camera, Culoare, Display, Firma, Model, Model_Chipset, phone, Producator_Chipset, Serie, Serie_Chipset, Sistem_Operare
					WHERE
						Firma.ID = Phone.ID_Firma
						AND Serie.ID = Phone.ID_Serie
						AND Model.ID = Phone.ID_Model
						AND Culoare.ID = Phone.ID_Culoare
						AND Sistem_Operare.ID = Phone.ID_Sistem_Operare
						AND Display.ID = Phone.ID_Display
						AND Camera.ID = Phone.ID_Camera
						AND Baterie.ID = Phone.ID_Baterie
						AND Producator_Chipset.ID = Phone.ID_Producator_Chipset
						AND Serie_Chipset.ID = Phone.ID_Serie_Chipset
						AND Model_Chipset.ID = Phone.ID_Model_Chipset";

            */

  private $query = "SELECT *,phone.ID FROM phone
    INNER JOIN Firma ON phone.ID_Firma = Firma.ID
    INNER JOIN Serie ON phone.ID_Serie = Serie.ID
    INNER JOIN Model ON phone.ID_Model = Model.ID
    INNER JOIN Culoare ON phone.ID_Culoare = Culoare.ID
    INNER JOIN Sistem_Operare ON phone.ID_Sistem_Operare = Sistem_Operare.ID
    INNER JOIN Display ON phone.ID_Display = Display.ID
    INNER JOIN Camera ON phone.ID_Camera = Camera.ID
    INNER JOIN Baterie ON phone.ID_Baterie = Baterie.ID
    INNER JOIN Producator_Chipset ON phone.ID_Producator_Chipset = Producator_Chipset.ID
    INNER JOIN Serie_Chipset ON phone.ID_Serie_Chipset = Serie_Chipset.ID
    INNER JOIN Model_Chipset ON phone.ID_Model_Chipset = Model_Chipset.ID";

	public function extract_toArray($Sort="",$filter=""){
		unset($this->Phone);

    if($filter!=""){ //filter was already transformed to SQL
      if($Sort!=""){ // if sort exist put "AND"
        $this->query= $this->query . " AND " .  $filter;
      }else{//put "WHERE"
        $this->query= $this->query . " WHERE " .  $filter;
      }
    }

		if($Sort!=""){
			if($Sort=="NameA") $this->query = $this->query." ORDER BY Firma.Firma ASC, Serie.Serie ASC, Model.Model ASC";
			else if($Sort=="NameD") $this->query = $this->query." ORDER BY Firma.Firma DESC, Serie.Serie DESC, Model.Model DESC";
			else if($Sort=="PriceA") $this->query = $this->query." ORDER BY Price ASC";
			else if($Sort=="PriceD") $this->query = $this->query." ORDER BY Price DESC";
			else if($Sort=="Viewed") { $this->query = $this->query."";}
			else if($Sort=="ID") { $this->query = $this->query." AND phone.ID=".$_GET['item'];}
			else if($Sort=="search") { $this->query = $this->query." AND Firma.Firma LIKE '%".$_GET['search']."%' OR Serie.Serie LIKE '%".$_GET['search']."%' OR Model.Model LIKE '%".$_GET['search']."%'";}
      //var_dump($this->query);
		}
    
		$rows = $this->select($this->query,"phone");
    //var_dump($rows);
    //echo ($this->query);
    if($rows!=false)
  		foreach($rows as $row){
  			$this->Phone[]=Array(
  			"ID"=>$row['ID'],
  			"Firma"=>$row['Firma'],
  			"Model"=>$row['Model'],
  			"Serie"=>$row['Serie'],
  			"Culoare"=>$row['Culoare'],
  			"Tastatura"=>$row['Tastatura'],
  			"Greutate"=>$row['Greutate'],
  			"Dimensiune"=>$row['Dimensiune'],
  			"2G"=>$row['2G'],
  			"3G"=>$row['3G'],
  			"4G"=>$row['4G'],
  			"SIM"=>$row['SIM'],
  			"SIM_Slots"=>$row['SIM_Slots'],
  			"Sistem_Operare"=>$row['Sistem_Operare'],
  			"GPS"=>$row['GPS']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Rezolutie_Display"=>$row['Rezolutie'],
  			"Tehnologie_Display"=>$row['Tehnologie'],
  			"TouchScreen"=>$row['TouchScreen']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Culori_K"=>$row['Culori_K'],
  			"Diagonala"=>$row['Diagonala'],
  			"MultiTouch"=>$row['MultiTouch']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"SlotMemorie"=>$row['Slot_Memorie'],
  			"SlotMemorie_Limit"=>$row['Slot_Memorie_Limit'],
  			"Memorie"=>$row['Memorie'],
  			"RAM"=>$row['RAM'],
  			"GPRS"=>$row['GPRS']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Bluetooth"=>$row['Bluetooth']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"WIFI"=>$row['WIFI']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"NFC"=>$row['NFC']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"USB"=>$row['USB'],
  			"Audio_Jack"=>$row['Audio_Jack']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Camera"=>$row['Camera'],
  			"Rezoltie_Camera"=>$row['Rezolutie_Sensor'],
  			"Rezolutie_Foto"=>$row['Rezolutie_Foto'],
  			"Rezolutie_Video"=>$row['Rezolutie_Video'],
  			"Blitz"=>$row['Blitz'],
  			"Camera_Frontala"=>$row['Camera_Frontala'],
  			"Blitz_Frontal"=>$row['Blitz_Frontal'],
  			"Sensor_Frontal"=>$row['Sensor_Frontal'],
  			"Baterie"=>$row['Baterie'],
  			"Capacitate_Baterie"=>$row['Capacitate'],
  			"Radio"=>$row['Radio']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Producator_Chipset"=>$row['Producator'],
  			"Serie_Chipset"=>$row['Serie_Chipset'],
  			"Model_Chipset"=>$row['Model_Chipset'],
  			"FingerPrint"=>$row['FingerPrint']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
  			"Price"=>$row['Price'],
  			"Cover"=>$row['Cover']);
  		}
		return $this->Phone;
	}
}
?>
