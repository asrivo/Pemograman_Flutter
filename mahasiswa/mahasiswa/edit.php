<<?php 
    require "database.php";
    require "user.php";
   
    $db = new database;
    $user = new User($db);

    $username = $_REQUEST['Dusername'];
    $view= $user->viewedit($username);

    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $new_username = $_POST['username'];
        $new_email = $_POST['email'];
        $new_password = $_POST['password'];

        $edit = $user->edit($new_username, $new_email, $new_password, $user=$_REQUEST['Dusername']);

        if($edit===TRUE){
            header("Location: tabel_data.php");
            exit();
        }else{
            echo "Error".$conn->error;
        }
    }

    if($view->num_rows>0){
        $row = $view->fetch_assoc();
    }else{
        echo "data tidak ditemukan";
        exit();
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

    <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
        <table>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" id="" value="<?= $row['username'] ?>" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" id="" value="<?= $row['email'] ?>" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" id="" value="<?= $row['password'] ?>" required></td>
            </tr>
            <tr>
                <td><input type="submit" value="edit" name="edit"></td>
                <td><button><a href="tabel_data.php" style="text-decoration: none; color: black;">tabel</a></button></td>
            </tr>
        </table>
    </form>

    
</body>
</html>