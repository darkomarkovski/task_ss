<?php

require_once 'dbconfig.php';

$query = "SELECT * FROM odds_conversion_chart";
$data = array();

$sth = $conn->prepare($query);
$sth->execute();
$result = $sth->fetchAll();
foreach ($result as $row) {
    $data[$row['ID']] = array(
        'uk' => $row['UK'],
        'eu' => $row['EU'],
        'us' => $row['US'],
    );
}

$conn = null; // disconnect

echo json_encode($data);
exit; 
