<?php
session_start();
if (!isset($_SESSION['role']) || $_SESSION['role'] != 'a') {
    header("location:index.php");
    die();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Category</title>
    <script>
        function myFunction(){
            let r=confirm("ต้องการจะลบจริงหรือไม่");
            return r;
        }
        function edit(id,name) {
            document.getElementById('cate_id').value=id;
            document.getElementById('category').value=name;
        }
    </script>
</head>
<body>
<div class="container">
        <h1 style="text-align: center;" class="mt-3">Webboard KakKak</h1>
        <?php include "nav.php" ?>
        
    <div class="row mt-4">
    <div class="col-lg-3 col-md-2 col-sm-1"></div>
    <div class="col-lg-6 col-md-8 col-sm-10">
        <?php
                    if(isset($_SESSION['setcat'])){
                        if($_SESSION['setcat']=='add'){
                            echo "<div class='alert alert-success'>
                            เพิ่มหมวดหมู่เรียบร้อยแล้ว</div>";
                        }else if($_SESSION['setcat'] == 'edit'){
                            echo "<div class='alert alert-success'>แก้ไขหมวดหมู่เรียบร้อยแล้ว</div>";
                        }else if($_SESSION['setcat'] == 'delete'){
                            echo "<div class='alert alert-success'>ลบหมวดหมู่เรียบร้อยแล้ว</div>";
                        }
                        unset($_SESSION['setcat']);
                    }
                ?>
    <table class="table table-striped mt-3 text-center">
        
        <?php
            $conn=new PDO("mysql:host=localhost;dbname=webboard;charset=utf8","root","");
            $sql = "SELECT * FROM category";
            $result=$conn->query($sql);
            $i=1;
            echo "<tr><th>ลำดับ</th><th>ชื่อหมวดหมู่</th><th>จัดการ</th></tr>";
            while($row=$result->fetch()){
            echo "<tr ><td>$i</td><td>$row[name]</td><td>
            <button type='button' onclick=edit('$row[id]','$row[name]') class='btn btn-warning btn-sm me-2' data-bs-target='#showForm1'
            data-bs-toggle='modal'><i class='bi bi-pencil-fill'></i></button>
            
            <a href=deletecategory.php?id=$row[id] class='btn btn-danger btn-sm ' onclick='return myFunction()'>
            <i class='bi bi-trash'></i></a></td></tr>";
            $i+=1;    

            }
            $conn=null;
        ?>

                
    </table>
     <!-- แก้ไข -->
    <div class='modal fade' id='showForm1'>
            <form action='editcategory.php' method='post'>  
            <input type="hidden" name="cate_id" id="cate_id">
                <div class='modal-dialog'>
                    <div class='modal-content'>
                         <div class='modal-header'>
                        <h5 class='modal-title'>แก้ไขหมวดหมู่</h5>
                        <button class='btn-close' data-bs-dismiss='modal'></button><!-- กากบาทปิดหน้าต่าง -->
                        </div>
                        <div class='modal-body'>
                
                        <div class='form-group'>
                            <label for='names' class='col-form-lable'>ชื่อหมวดหมู่ :</label>
                            <input type="text" id="category" name="category" class="form-control"  required>
                        </div>
                    
                </div>
           
            
                <div class = 'modal-footer'>
                    <button class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>
                    <button class='btn btn-primary'>Save changes</button>
                </div>
             </form>
                </div>
                </div>
                </div>





    <!-- เพิ่ม -->
    <div class="container my-4">
        <div class="col-lg-12 d-flex justify-content-center">
        
            <button class="btn btn-success btn-sm text-white me-2" data-bs-target="#showForm"
            data-bs-toggle="modal"><i class="bi bi-bookmark-plus"></i> เพิ่มหมวดหมู่ใหม่</button>
            <div class="modal fade" id="showForm">
           <form action="category_save.php" method="post">     
                <div class="modal-dialog">
                    <div class="modal-content">
                         <div class="modal-header">
                            <h5 class="modal-title">เพิ่มหมวดหมู่ใหม่</h5>
                            <button class="btn-close" data-bs-dismiss="modal"></button><!-- กากบาทปิดหน้าต่าง -->
                        </div>
                        
            <div class="modal-body">
                
                    <div class="form-group">
                        <label for="names" class="col-form-lable">ชื่อหมวดหมู่ :</label>
                        <input type="text" id="names" name="names" class="form-control" required>
                    </div>
                
            </div>
       
        
            <div class = "modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button class="btn btn-primary">Save changes</button>
            </div>
         </form>
            </div>
            </div>
            </div>
                
            </div>
            
            </div>
        
</div>
</div>
</div>


</body>
</html>