<?php 
   require "database.php";
   require "user.php";
  
   $db = new database;
   $user = new User($db);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabel Data</title>
    <style>
        .button{
            display: block;
            padding: 2px;
            color: black;
            text-decoration: none;
            border: 1px solid black;
            width: 50px;
            margin: 5px;
        }
        .button-danger{
            background-color: red;
        }
        .button-ok{
            background-color: aqua;
        }
        .button-view{
            background-color: green;
        }
    </style>
</head>
<body>
    <h3>Tabel Data Mahasiswa</h3>
    <a href="index.php" class="button button-ok">tambah</a>
    <table border="1" style="border-collapse: collapse;">
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Password</th>
            <th>Tindakan</th>
        </tr>
        <?php foreach( $user->view() as $row ) :?>
            <tr>
                <td><?= $row['username'] ?></td>
                <td><?= $row['email'] ?></td>
                <td><?= $row['password'] ?></td>
                <td>
                    <a href="delete.php?Dusername=<?= $row['username'] ?>" class="button button-danger">delete</a>
                    <a href="edit.php?Dusername=<?= $row['username'] ?>" class="button button-view">edit</a>
                </td>
            </tr>
        <?php endforeach?>
    </table>
</body>
</html>