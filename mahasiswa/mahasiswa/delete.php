<?php 
    require "database.php";
    require "user.php";

    $db = new database;
    $user = new User($db);
    
    $username = $_REQUEST['Dusername'];
    $delete = $user->delete($username);

    if($delete){
        echo "<script>alert('DELETE SUCCESFULLY');</script>";
        echo "<script>window.location.href = 'tabel_data.php'</script>";
    }