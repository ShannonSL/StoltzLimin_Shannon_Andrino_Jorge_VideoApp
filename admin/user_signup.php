<?php
    require_once "config.php";

$username = $password = $confirm_password = "";
$username_error = $password_error = $confirm_password_error = "";
 
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validating the username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter your username.";
    } else{
        $sql = "SELECT id FROM users WHERE username = :username";
        
        if($stmt = $pdo->prepare($sql)){
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            
            $param_username = trim($_POST["username"]);
            
            if($stmt->execute()){
                if($stmt->rowCount() == 1){
                    $username_err = "This username is already on use.";
                } else{
                    $username = trim($_POST["username"]);
                }
            } else{
                echo "Doh! Something went bad. Please try again later.";
            }
        }         
        unset($stmt);
    }
    
    // Validating the password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have more than 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate the confirmation of the password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm your password.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Your password did not match.";
        }
    }
    
    // Check errors before inserting into the database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err)){
        
        $sql = "INSERT INTO users (username, password) VALUES (:username, :password)";
         
        if($stmt = $pdo->prepare($sql)){
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            $stmt->bindParam(":password", $param_password, PDO::PARAM_STR);
            
            $param_username = $username;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            
            if($stmt->execute()){
                header("location: login.php");
            } else{
                echo "Something went wrong. Please try again later.";
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
    <title>Roku Flashback: Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/3.0.2/vue-router.min.js"></script>

</head>
<body>
    
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="formInfo <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="formInfo <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="formInfo <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                <label>Confirm Password</label>
                <input type="password" name="confirm_password" class="form-control" value="<?php echo $confirm_password; ?>">
                <span class="help-block"><?php echo $confirm_password_err; ?></span>
            </div>
            <div class="formInfo">
                <input type="submit" class="btn btn-primary" value="Submit">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
            <p>Already have an account with Us? <a href="login.php">Login here then!!</a>.</p>
        </form>


    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/main.js"></script>
</body>
</html>