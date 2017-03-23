<?php
/**
 * These are the database login details
 */  
$config = parse_ini_file('config.ini'); 

//acces - 0 = user,1-vip,2-helper,3-helper_leader,4-moderator,5-moderator_leader,6-administrator,7-administrator_leader,8-Owner,9-Developer
$access = array('user','vip,helper','helper_leader','moderator','moderator_leader','administrator','administrator_leader','Owner','Developer');
				
define("HOST", "localhost");     // The host you want to connect to.
define("USER", $config['username']);    // The database username. 
define("PASSWORD", $config['password']);    // The database password. 
define("DATABASE", "secure_login");    // The database name.
 
define("CAN_REGISTER", "any");
define("DEFAULT_ROLE", "member");
 
define("SECURE", FALSE);    // FOR DEVELOPMENT ONLY!!!!

?>