<?php 

    class User{
        private $conn;

        public function __construct($db) {
            $this->conn = $db->getConnection();
        }

        public function create($username, $email, $password){
            $sql = "INSERT INTO user (id, username, email, password) VALUES (null, '$username', '$email', '$password')"; 

            return $this->conn->query($sql);
        }

        public function view(){
            $sqlview = "SELECT * FROM user";
            $result = mysqli_query($this->conn, $sqlview);

            return $result;
        }

        public function delete($Dusername){
            $query = "DELETE FROM user WHERE username='$Dusername'"; 
            if($sql = $this->conn->query($query)){
                return true;
            } else {
                return false;
            }
        }

        public function viewedit($user){
            $sqledit = "SELECT * FROM user WHERE username = '$user'";

            return $this->conn->query($sqledit);
        }

        public function edit($username, $email, $password, $old){
            $sqledit = "UPDATE user SET username = '$username', email = '$email', password = '$password' WHERE username = '$old'";

            return $this->conn->query($sqledit);
        }


    }