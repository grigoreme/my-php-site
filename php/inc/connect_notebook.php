<?php
class Notebook {
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

    /**
     * Fetch the last error from the database
     *
     * @return string Database error message
     */
    public function error($db) {
        $connection = $this -> connect($db);
        return $connection -> error;
    }

    public function select($query,$db) {
        $rows = array();
        $result = $this -> query($query,$db);
        if($result === false) {
			echo $this->error($db);
            return false;
        }
        while ($row = $result -> fetch_assoc()) {
            $rows[] = $row;
        }
        return $rows;
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

	public $calc = Array(
		"ID"=>'',
		"Firma"=>'',
		"Model"=>'',
		"Serie"=>'',
		"Culoare"=>'',
		"Procesor"=>'',
		"Model_Procesor"=>'',
		"Nuclee"=>'',
		"Frecventa_Procesor"=>'',
		"Tip_Procesor"=>'',
		"Display"=>'',
		"Rezolutie"=>'',
		"Diagonala"=>'',
		"Alimentare"=>'',
		"Sistem_Operare"=>'',
		"Dimensiune"=>'',
		"Greutate"=>'',
		"RAM"=>'',
		"Capacitate"=>'',
		"Tip_capacitate"=>'',
		"Video"=>'',
		"Capacitate_Video"=>'',
		"Bluetooth"=>'',
		"Wifi"=>'',
		"USB2_0"=>'',
		"USB3_0"=>'',
		"HDMI"=>'',
		"VGA"=>'',
		"RJ_45"=>'',
		"Audio"=>'',
		"DVD"=>'',
		"Camera"=>'',
		"Microfon"=>'',
		"Card_reader"=>'',
		"Num_pad"=>'',
		"Price"=>'',
		"Cover"=>'');

	private $query= "SELECT
			Firma.Firma,
			Serie.Serie,
			Model.Model,
			Culoare.Culoare,
			Procesor.Procesor, Procesor.Nuclee, Procesor.Frecventa, Procesor.Model_Procesor, Tip_Procesor.Tip_Procesor,
			Display.Display, Display.Rezolutie, Display.Diagonala,
			Alimentare.Alimentare,
			Sistem_Operare.Sistem_Operare,
			notebook.ID, notebook.Dimensiune, notebook.Greutate, notebook.RAM, notebook.Capacitate,
			notebook.Tip_capacitate, notebook.Video, notebook.Capacitate_Video, notebook.Bluetooth,
			notebook.Wifi, notebook.USB2_0, notebook.USB3_0, notebook.HDMI, notebook.VGA, notebook.RJ_45, notebook.Price,
			notebook.Audio, notebook.DVD, notebook.Camera, notebook.Microfon, notebook.Card_reader, notebook.Num_pad, notebook.Cover
        FROM
			notebook,Sistem_Operare,Display,Alimentare,Procesor,Tip_Procesor,Culoare,Model,Serie,Firma
		WHERE
			Firma.ID = notebook.ID_Firma
			AND Serie.ID = notebook.ID_Serie
			AND Model.ID = notebook.ID_Model
			AND Culoare.ID = notebook.ID_Culoare
			AND Procesor.ID = notebook.ID_Procesor AND Procesor.Tip_Procesor = Tip_Procesor.ID
			AND Display.ID = notebook.ID_Display
			AND Alimentare.ID = notebook.ID_Alimentare
			AND Sistem_Operare.ID = notebook.ID_Sistem_Operare";


	public function extract_toArray($Sort=""){
		unset($this->calc);

		if($Sort!=""){
			if($Sort=="NameA") $this->query = $this->query." ORDER BY Firma.Firma ASC, Serie.Serie ASC, Model.Model ASC";
			else if($Sort=="NameD") $this->query = $this->query." ORDER BY Firma.Firma DESC, Serie.Serie DESC, Model.Model DESC";
			else if($Sort=="PriceA") $this->query = $this->query." ORDER BY Price ASC";
			else if($Sort=="PriceD") $this->query = $this->query." ORDER BY Price DESC";
			else if($Sort=="Viewed") { $this->query = $this->query."";}
			else if($Sort=="ID") { $this->query = $this->query." AND notebook.ID=".$_GET['item'];}
			else if($Sort=="search") { $this->query = $this->query." AND Firma.Firma LIKE '%".$_GET['search']."%' OR Serie.Serie LIKE '%".$_GET['search']."%' OR Model.Model LIKE '%".$_GET['search']."%'";}
		}
		$rows = $this->select($this->query,"notebook");
		foreach($rows as $row){
			$this->calc[]=Array(
			"ID"=>$row['ID'],
			"Firma"=>$row['Firma'],
			"Model"=>$row['Model'],
			"Serie"=>$row['Serie'],
			"Culoare"=>$row['Culoare'],
			"Procesor"=>$row['Procesor'],
			"Model_Procesor"=>$row['Model_Procesor'],
			"Nuclee"=>$row['Nuclee'],
			"Frecventa"=>$row['Frecventa'],
			"Tip_Procesor"=>$row['Tip_Procesor'],
			"Display"=>$row['Display'],
			"Rezolutie"=>$row['Rezolutie'],
			"Diagonala"=>$row['Diagonala'],
			"Alimentare"=>$row['Alimentare'],
			"Sistem_Operare"=>$row['Sistem_Operare'],
			"Dimensiune"=>$row['Dimensiune'],
			"Greutate"=>$row['Greutate'],
			"RAM"=>$row['RAM'],
			"Capacitate"=>$row['Capacitate'],
			"Tip_capacitate"=>$row['Tip_capacitate'],
			"Video"=>$row['Video'],
			"Capacitate_Video"=>$row['Capacitate_Video'],
			"Cover"=>$row['Cover'],
			"Price"=>$row['Price'],
			"Bluetooth"=>$row['Bluetooth']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"Wifi"=>$row['Wifi']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"USB2_0"=>$row['USB2_0']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"USB3_0"=>$row['USB3_0']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"HDMI"=>$row['HDMI']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"VGA"=>$row['VGA']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"RJ_45"=>$row['RJ_45']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"Audio"=>$row['Audio']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"DVD"=>$row['DVD']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"Camera"=>$row['Camera'],
			"Microfon"=>$row['Microfon']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"Card_reader"=>$row['Card_reader']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"),
			"Num_pad"=>$row['Num_pad']=="1"?translate_get($_SESSION['lang'],"yes"):translate_get($_SESSION['lang'],"no"));
		}
		//var_dump($this->calc);
		return $this->calc;
	}
}
?>
