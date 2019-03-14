<?php
    
    //Checking if the user is properly logged in and if he is, send him to the welcome page
    if(isset($_SESSION["loggedin"]) &&
    $_SESSION["loggenin"] === true){
        header("location: welcome.php");
        exit;
    }

    // config.php file included
    require_once "connect.php";

    $username = $password = "";
    $username_err = $password_err = "";
 
    if($_SERVER["REQUEST_METHOD"] == "POST"){
 
        // Check if the username is empty
        if(empty(trim($_POST["username"]))){
            $username_err = "Please enter your username.";
        } else{
            $username = trim($_POST["username"]);
        }
    
        // Check if password is empty
        if(empty(trim($_POST["password"]))){
            $password_err = "Please enter your password.";
        } else{
            $password = trim($_POST["password"]);
        }
    
        // Validate info
        if(empty($username_err) && empty($password_err)){
            // Prepare a select statement
            $sql = "SELECT user_id, username, password FROM tbl_users WHERE username = :username";
        
            if($stmt = $pdo->prepare($sql)){
                $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            
                $param_username = trim($_POST["username"]);
            
                if($stmt->execute()){
                    // Checking if the username exists, if it does then verify the password
                    if($stmt->rowCount() == 1){
                        if($row = $stmt->fetch()){
                            $id = $row["user_id"];
                            $username = $row["username"];
                            $hashed_password = $row["password"];
                            if(password_verify($password, $hashed_password)){
                                // If password is correct, start a new session
                                session_start();
                            
                                $_SESSION["loggedin"] = true;
                                $_SESSION["user_id"] = $id;
                                $_SESSION["username"] = $username;                            
                            
                                // Redirect user to welcome page
                                header("location: welcome.php");
                            } else{
                                // Display an error message if the password is not valid
                                $password_err = "The password you entered was not valid.";
                            }
                        }
                    } else{
                        // Display an error message if the username doesn't exist
                        $username_err = "No account with that username.";
                    }
                } else{
                    echo "Doh! Something went bad. Please try again later.";
                }
            }
        
            unset($stmt);
        }
    
        unset($pdo);
}

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Roku Flashback: Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/3.0.2/vue-router.min.js"></script>

</head>
<body>
    
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
    <div class="formInfo <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="formInfo <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="formInfo">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account with Us? <a href="user_signup.php">Sign up Right Here!!</a>.</p>
	</form>


    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/main.js"></script>
</body>
</html>