<?php
$error = filter_input(INPUT_GET, 'err', $filter = FILTER_SANITIZE_STRING);

if (!$error) {
    $error = 'Oops! An unknown error happened.';
}
?>
<h1 class="text-center">There was a problem</h1>
<p class="error text-center""><?php echo $error; ?></p>  