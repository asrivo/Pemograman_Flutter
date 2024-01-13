<?php 
 require "database.php";
 require "user.php";

 $db = new database;
 $user = new User($db);

 if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password']; 
    
    if($user->create($username, $email, $password)){
        echo "<script>alert('DATA BERHASIL DITAMBAHKAN');</script>";;
    } else {
        echo "<script>alert('DATA GAGAL DITAMBAHKAN');</script>";
    }   
 }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data User</title>
</head>
<body>
    <h1>Data User</h1>

    <form action="" method="post">
        <table>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" id="" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" id="" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" id="" required></td>
            </tr>
            <tr>
                <td><input type="submit" value="submit" name="submit"></td>
                <td><button><a href="tabel_data.php" style="text-decoration: none; color: black;">tabel</a></button></td>
            </tr>
        </table>
    </form>

    
</body>
</html>