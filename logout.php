

<?php

//logout.php

include('config.php');


//Destroy entire session data.
session_destroy();

//redirect page to index.php
header('location:user_login.php');

?>
