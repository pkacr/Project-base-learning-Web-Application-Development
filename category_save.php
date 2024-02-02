<?php
    session_start();
    $catn=$_POST['names'];

    $conn=new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
    $sql="INSERT INTO category (name) VALUES ('$catn')";
    $conn->exec($sql);
    $conn = NULL;
    $_SESSION['setcat']='add';
    header("location:category.php");
    die();
?>