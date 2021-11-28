<?php

    // Variable
    $kundenname = $_POST["kundenname"];
    $email = $_POST["email"];
    $tel = $_POST["tel"];
    $days = 0;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

        // Datum der Bereitschaft des Services
        function datum()
        {
        if ($_POST["prio"] == 1) {
            $date = date('d.m.Y', strtotime('+12 days'));
        } else 
            if ($_POST["prio"] == 2) {
                $date = date('d.m.Y', strtotime('+7 days'));
            } else 
                if ($_POST["prio"] == 3) {
                    $date = date('d.m.Y', strtotime('+5 days'));
                }
        return $date;
        }
        
        require_once 'auftragsql.inc.php';

        // Service Nummer zu String (Service) Ausgabe 
        function service()
        {
        if ($_POST["service"] == 1){
            return "Kleiner Service";
        }else
            if ($_POST["service"] == 2){
                return "Grosser Service";
            }else
                if ($_POST["service"] == 3){
                    return "Rennski-Service";
                }else
                    if ($_POST["service"] == 4){
                        return "Bindung montieren und einstellen Bestellung";
                    }else
                        if ($_POST["service"] == 5){
                            return "zugeschnittenes Fell";
                        }else
                            if ($_POST["service"] == 6){
                                return "Heisswachsen";
                            }
    
        }

        // Prioritaet Nummer zu String (Prioritaet) Ausgabe
        function prioritaet()
        {
            if ($_POST["prio"] == 1){
                return "Tiefe Priorität";
            }else
                if ($_POST["prio"] == 2){
                    return "Standard Priorität";
                }else
                    if ($_POST["prio"] == 3){
                        return "Express Priorität";
                    }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="style/pt.css" rel="stylesheet"/>
    <title>Document</title>
</head>
<body class="bgbcubes">

  <!-- Navbar -->
    <div class="full-width">
        <div class="container-fluid p-2 bg-dark text-white">
                <div class="row">
                    <div class="col-md-4 pt-1">
                        <img src="img/logo-really-small.png" class="logo" alt="Logo">
                    </div>
                        <div class="col-md-4 p-3">
                    <ul class="nav nav-pills justify-content-center">
                        <li class="nav-item" style="margin:1%">
                            <a class="btn btn-outline-light" href="home.html">Home</a>
                        </li>
                        <li class="nav-item" style="margin:1%">
                            <a class="btn btn-outline-light"  href="kontakt.html">Kontakt</a>
                        </li>
                        <li class="nav-item" style="margin:1%">
                            <a class="btn btn-outline-light" href="auftrag.php">Auftrag</a>
                        </li>
                        <li class="nav-item" style="margin:1%">
                            <a class="btn btn-outline-light active">Bestellung</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

  <!-- Titel -->
    <div class="container p-3 my-3 bg-dark text-white">
        <h1>Ihre Bestellung</h1>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Fugit obcaecati nostrum eius rem voluptas? Explicabo quos laborum quibusdam ipsa! Beatae, nulla praesentium? Molestiae consequatur officia ullam quas, maiores vel animi!</p>
    </div>

  <!-- Success Alert -->
    <div class="container p-0">
    <?php
        echo '<div class="alert alert-success">';
        echo '<strong>Auftrag erstellt:</strong>';
        echo ' Ihr '. service() .' ist am '. datum() .' abholbereit!';
        echo '</div>';
    ?>
    </div>

  <!-- Angaben -->
    <div class="container p-3 my-3 bg-dark text-white">
        <dl class="row">
            <dt class="col-sm-3">Kundenname</dt>
            <?php echo "<dd class='col-sm-9'>$kundenname</dd>"?>

            <dt class="col-sm-3">Email</dt>
            <?php echo "<dd class='col-sm-9'>$email</dd>"?>

            <dt class="col-sm-3">Telefonnummer</dt>
            <?php echo "<dd class='col-sm-9'>$tel</dd>"?>

            <dt class="col-sm-3">Service</dt>
            <?php echo "<dd class='col-sm-9'>" . service() . "</dd>"?>
            
            <dt class="col-sm-3">Priorität</dt>
            <?php echo "<dd class='col-sm-9'>" . prioritaet() . "</dd>"?>

            <dt class="col-sm-3">Abholbereit</dt>
            <?php echo "<dd class='col-sm-9'>" . datum() . "</dd>"?>
        </dl>
        <button class="btn btn-outline-light btn-block" onclick="location.href = 'home.html';">Zurück zum Home</button>
        <button class="btn btn-outline-light btn-block" onclick="location.href = 'auftrag.php';">Zurück zum Auftrag</button>
    </div>
</body>
</html>