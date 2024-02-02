<?php 
    session_start();
    $cate = $_POST['category'];
    $catid = $_POST['cate_id'];
    $conn=new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
    $sql="UPDATE category SET name='$cate' WHERE id=$catid";
    $stmt = $conn->prepare("UPDATE category SET name=:name WHERE id=:id");
    $stmt->bindParam(':name', $cate);
    $stmt->bindParam(':id', $catid);
    $stmt->execute();
    $conn=null;
    $_SESSION['setcat'] = 'edit';
    header("location:category.php");
    die();
?>