<?php
// Vorherige Validierungscode

/*
$errors = [];

$kundenname = $_POST["kundenname"] ?? '';
$email = $_POST["email"] ?? '';
$tel = $_POST["tel"] ?? '';

$days = 0;



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kundenname = trim($kundenname);
    $email = trim($email);
    $tel = trim($tel);
    if ($kundenname == '') {
      $errors[] = 'Name ungültig';
    }

    if (filter_var($email,FILTER_VALIDATE_EMAIL) === false) {
      $errors[] = 'Email ungültig';
    }

}*/

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="style/pt.css" rel="stylesheet"/>
    <title>Auftrag</title>
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
                <a class="btn btn-outline-light active" href="auftrag.php">Auftrag</a>
              </li>
            </ul>
          </div>
        </div>
    </div>
  </div>

  <!-- Titel -->
    <div class="container p-3 my-3 bg-dark text-white">
        <h1>Serviceauftrag erstellen</h1>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Fugit obcaecati nostrum eius rem voluptas? Explicabo quos laborum quibusdam ipsa! Beatae, nulla praesentium? Molestiae consequatur officia ullam quas, maiores vel animi!</p>
    </div>

  <!-- Eventlist -->
  <!--
  <div class="container p-0">
    <?php /*if(count($errors) > 0): ?>
            <ul class="errors p-0">
                <?php foreach($errors as $error): ?>
                  <div class="alert alert-danger">
                    <strong>Fehler!</strong> <?= $error ?>
                  </div>
                <?php endforeach; ?>
            </ul>
        <?php endif; */?>
  </div> -->

  <!-- Form -->
  <div class="container p-3 my-3 bg-dark text-white">
    <form action="<?php echo htmlspecialchars('bestellung.php');?>" method="POST">

    <!-- Kundenname -->
      <div class="anmeldung">
        <div class="form-group row">
          <div class="col-sm-10">
            <label for="kundenname" class="col-md-2 col-form-label-lg ">Kundenname</label>
            <input type="text" pattern="[A-Za-z]{2,}" class="input col-md-8" placeholder="Kundenname" id="kundenname" name="kundenname" required>
          </div>
        </div>
      </div>

    <!-- Email -->    
      <div class="anmeldung">
        <div class="form-group row">
          <div class="col-sm-10">
            <label for="email" class="col-md-2 col-form-label-lg">Email</label>
            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="input col-md-8" id="email"placeholder="name@domain.ch" name="email" required>
          </div>
        </div>
      </div>

    <!-- Nummer -->
      <div class="anmeldung">
        <div class="form-group row">
          <div class="col-sm-10">
            <label for="tel" class="col-md-2 col-form-label-lg">Telefon</label>
            <input type="text" pattern="[0-9]+{3} [0-9]+{3} [0-9]+{2} [0-9]{2}" class="input col-md-8" id="tel" placeholder="049 123 45 67" name="tel" required>
          </div>
        </div>
      </div>

    <!-- Prioritaet & Service -->      
      <div class="anmeldung">
        <div class="form-group row">
          <div class="col-sm-10">
            <label for="prio" class="col-md-2 col-form-label-lg">Priorität</label>
            <select id="prio" name="prio" class="input">
              <option name="prio" value="1" <?php if(empty($_GET["prio"]) || $_GET["prio"] == 1){echo 'selected="selected"';}?>>Tief (12 Tage)</option> 
              <option name="prio" value="2" <?php if(isset($_GET["prio"]) && $_GET["prio"] == 2){echo 'selected="selected"';}?>>Standard (7 Tage)</option> 
              <option name="prio" value="3" <?php if(isset($_GET["prio"]) && $_GET["prio"] == 3){echo 'selected="selected"';}?>>Express (5 Tage)</option>
            </select>

            <label style="margin-left:20%;" for="service" class="col-md-2 col-form-label-lg">Angebot</label>
            <select id="service" name="service" class="input">
              <option name="service" value="1">Kleiner Service</option> 
              <option name="service" value="2">Grosser Service</option> 
              <option name="service" value="3">Rennski-Service</option> 
              <option name="service" value="4">Bindung montieren und einstellen</option> 
              <option name="service" value="5">Fell zuschneiden</option> 
              <option name="service" value="6">Heisswachsen</option> 
            </select>
          </div>
        </div>
      </div>


    <!-- Submit & Reset -->        
      </br>
      <div class="d-grid gap-3">
        <input class="btn btn-outline-light btn-block" type="submit" value="Anmelden"/>
        <input class="btn btn-outline-light btn-block" type="reset" value="Zurücksetzen"/>
      </div>
    </form>
  </div>

</body>
</html>