<?php

require_once 'dbconfig.php';

$sql = $conn->prepare("INSERT INTO user_input_log (user_input, field, user_ip, date_created) VALUES (? ,? ,?, CURRENT_TIMESTAMP)");
// use bind param to avoid sql injection
$sql->bindParam(1, $_POST['input']);
$sql->bindParam(2, $_POST['field']);
$sql->bindParam(3, $_SERVER['REMOTE_ADDR']);
$sql->execute();

$conn = null; // disconnect

echo "done";
exit;