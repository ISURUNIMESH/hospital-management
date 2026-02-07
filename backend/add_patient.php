<?php
include 'db.php';

$name = $_POST['name'];
$age = $_POST['age'];
$disease = $_POST['disease'];
$phone = $_POST['phone'];

$sql = "INSERT INTO patients (name, age, disease, phone)
VALUES ('$name', '$age', '$disease', '$phone')";

if ($conn->query($sql) === TRUE) {
    echo "success";
} else {
    echo "error";
}

$conn->close();
?>
