<?php
    session_start();
    if (isset($_SESSION['role']) && $_SESSION['role']=='a'){
        $conn=new PDO("mysql:host=localhost;dbname=webboard;
        charset=utf8","root","");
        $sql="DELETE FROM category WHERE id=$_GET[id]";
        $conn->exec($sql);
        $_SESSION['setcat'] = 'delete';
        $conn=null;
        header("location:category.php");
        die();
    }else{
        header("location:index.php");
        die();
    }    
?>