<?php
  // Variable
  $host = 'localhost';
  $dbname = 'auftrag';
  $username = 'root';
  $password = '';

  $kundenname = $_POST["kundenname"];
  $email = $_POST["email"];
  $tel = $_POST["tel"];
  $prio = $_POST["prio"];
  $serv = $_POST["service"];


  require_once 'auftragsql.inc.php';

  // SQL Verbindung
  try 
  {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
      
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "Connected successfully";

    insert_data($kundenname, $email, $tel, $prio, $serv);

  } catch(PDOException $e) {
    // echo "Connection failed: " . $e->getMessage();
  }


  // Angaben werden ins SQL eingetragen
  function insert_data($kundenname, $email, $tel, $prio, $serv)
    {
      global $conn;
      try
      {
        $kvalues = array(':kn'=>$kundenname, ':em' =>$email, ':tl' =>$tel);
        $sql = "INSERT IGNORE INTO kunde(kundenname, email, telefon) values(:kn,:em,:tl)";
        $q = $conn->prepare($sql);
        $q->execute($kvalues);

        $sql2 = "SELECT kundeID FROM kunde WHERE email = :em";
        $q2 = $conn->prepare($sql2);
        $q2->execute(array(':em' =>$email));
        $kd_id = $q2->fetch(PDO::FETCH_ASSOC);

        $sql3 = "UPDATE kunde SET telefon = :tl WHERE kundeID = :kdID";
        $q3 = $conn->prepare($sql3);
        $q3->execute(array(':tl' =>$tel, ':kdID' =>$kd_id["kundeID"]));

        $sql4 = "INSERT INTO auftrag(service_serviceID, prioritaet_prioritaetID, kunde_kundeID) values(:sv,:pr,:fk)";
        $q4 = $conn->prepare($sql4);
        $q4->execute(array(':pr' =>$prio, ':sv' =>$serv, ':fk' =>$kd_id["kundeID"]));
              
        //echo "Erfolgreich gespeichert";

      } catch(PDOException $e) {
        // echo "Error: " . $e->getMessage();
      }
    }
?>