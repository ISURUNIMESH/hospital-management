<?php
header("Content-Type: application/json");
include "db.php";

$data = json_decode(file_get_contents("php://input"), true);

$patient = $data["patient"];
$phone = $data["phone"];
$doctor = $data["doctor"];
$date = $data["date"];
$problem = $data["problem"];

$sql = "INSERT INTO appointments 
(patient_name, phone, doctor, appointment_date, problem, status)
VALUES 
('$patient', '$phone', '$doctor', '$date', '$problem', 'Pending')";

if ($conn->query($sql)) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}

$conn->close();
?>
