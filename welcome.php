<?php
    session_start();
 
// Checking if the user is logged in, if not, redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;
    }

?>


<!DOCTYPE <!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Roku Flashback</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/foundation.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/3.0.2/vue-router.min.js"></script>

</head>
<body>
    <header class="grid-x">
        <div class="grid-x">
            <a href="index.html"><img src="images/roku_logo.png" class="cell small-offset-2 small-2 large-1 large-pull-1"></a>
        </div>
        <div class="grid-x">

            <a href="index.html"><img src="images/FlashBack_Logo.png" class="cell small-6 large-4"></a>

            <div class="grid-x">
                <h2> class="columns small-6 large-5" <?php 
                date_default_timezone_set("America/Toronto");
                $time = date("H");
                $timezone = date("e");
                if ($time < "12") {
                    echo "Goooooooooood Morning FILADELPHIA!!!!! And Good Morning to you as well   ";
                } else
                    if ($time >= "12" && $time < "17") {
                        echo "Good afternoon, my young man  ";
                    } else
                        if ($time >= "17" && $time < "20") {
                            echo "Good evening Sir  ";
                        } else
                            if ($time >= "20") {
                                echo "Good night YOU FILTHY ANIMAL!!  ";
                            }
                    ?><b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>Welcome User</h2>
            </div>

            <div class="desktopNav">
                <!-- Desktop Nav -->
                
                <nav class="cell small-0 large-offset-6 large-9">
                    <a class="Dlinks" href="parentpage.html">Parents</a>
                    <a class="Dlinks" href="kidspage.html">Kids</a>
                    <a class="Dlinks" href="admin/scripts/logout.php"><img src="images/user_icon.svg" width="5%" height="5%"> Sign Out </a>
                </nav>
            </div>
            
            <container class="cell small-5 large-0" class="mobileNav">
                <!-- Mobile Nav -->

                <div class="dropdownNav">
                    <button onclick="myFunction()" class="dropButton">Menu</button>
                        <div id="listNav" class="content">
                            <a href="parentpage.html">Parents</a>
                            <a href="kidspage.html">Kids</a>
                            <a href="#">Sign Out</a>
                            
                        </div>
                </div>
        
            </container>

        </div>    
        
    </header>
        
    <div id="categories" class="grid-x">
        <div id="movies">

            <img src="images/movie_icon.svg" class="cell small-6 large-offset-2 large-4">
            <p class="columns small-6 large-5">Go back to the Past with our Movie selections from the 50s to the 90s.</p>

        </div>
        <div id="music">

            <img src="images/Music_Icon.png" class="cell small-6 large-offset-2 large-4">
            <p class="columns small-6 large-5">Resume the old days with your 50s to 90s TV shows.</p>

        </div>
        <div id="TVshows">

            <img src="images/TV_Icon.png" class="cell small-6 large-offset-2 large-4">
            <p class="columns small-6 large-5">Listen to the greatest hit songs from the 50s and the 90s.</p>

        </div>
    </div>
    <hr>
    <container id="users" class="grid-x">
        <div id="parents" class="cell small-8 large-6">
            <a href="parentpage.html"><img src="images/parents_icon.svg"></a>
            <h1 class="cell small-offset-2 small-8">PARENTS</h1>
        </div>
        <div id="kids" class="cell small-12 large-8">
            <a href="kidspage.html"><img src="images/kids_icon.svg"></a>
            <h1 class="cell small-offset-6 small-8">KIDS</h1>
        </div>
        <div id="usersInfo" class="cell small-offset-2 small-8 large-8">
            <p>Roku´s FlashBack streaming site allows you to go back in time to remember and enjoy Movies, TV Shows and
                Music, from the 50s all the ways to the 90s. Enjoy the content specially selected from your own
                preference in all the content we have for you.</p>
        </div>
    </container>
    <hr>
    <container id="features1" class="grid-x">
        <div class="cell small-offset-1 small-10 large-offset-4 large-4">
            <img src="images/quotes_icon.svg">
            <div id="quotes">
                <p>Quotes</p>
            </div>
        </div>
        <hr>
        <div class="cell small-offset-1 small-10 large-offset-4 large-4">
            <img src="images/trivia_icon.svg">
            <div id="trivia">
                <p>Trivia</p>
            </div>
        </div>
    </container>
    <hr>
    <container id="features2" class="grid-x">
        <div class="cell small-offset-1 small-10 large-offset-4 large-4">
            <img src="images/clips_icon.svg">
            <div id="clips">
                <p>Clips</p>
            </div>
        </div>
        <hr>
        <div class="cell small-offset-1 small-10 large-offset-4 large-4">
            <img src="images/interviews_icon.png">
            <div id="interview">
                <p>Interview</p>
            </div>
        </div>
        <hr>
    </container>
    <footer class="grid-x">
        <div class="backtoTop" class="cell small-offset-3 small-10 large-offset-4 large-4">
            <a href="#categories"><button><h2>Back To Top</h2></button></a>
        </div>
        <div class="grid-x">
            <!--<div class="cell small-offset-1 small-10 large-4" id="socialMedia">-->
                <ul>
                    <li class="cell small-3 large-3"><img class="social" src="images/Facebook_icon.png"></li>    
                    <li class="cell small-3 large-3"><img class="social" src="images/Twitter_icon.png"></li>    
                    <li class="cell small-3 large-3"><img class="social" src="images/Instagram_icon.png"></li>    
                    <li class="cell small-3 large-3"><img class="social" src="images/Youtube_icon.png"></li>    
                </ul>
                
            <!--</div>-->
        </div>
        <div class="cell small-offset-2 small-10 large-offset-3 large-12">
            <p>&copy;Roku, Inc.  All Rights Reserved</p>
        </div>
    </footer>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/main.js"></script>
</body>

</html>