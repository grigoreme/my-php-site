<?php
class Db {
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
}
?>