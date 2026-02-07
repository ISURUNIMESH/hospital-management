<?php
header("Content-Type: application/json");
include "db.php";

$result = $conn->query("SELECT * FROM appointments ORDER BY id DESC");

$appointments = [];

while ($row = $result->fetch_assoc()) {
    $appointments[] = $row;
}

echo json_encode($appointments);
$conn->close();
?>
