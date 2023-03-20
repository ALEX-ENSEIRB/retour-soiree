<?php
  $login = 'mdurocher001'/*A compléter*/;
  $db_pwd = 'tpMysqldrc'/*A compléter*/;
  $db_name = 'test';
  /* Creation de l'objet qui gere la connexion: */
  $connection = new mysqli("localhost", $login, $db_pwd, $login);


    /* Si la connexion echoue, on affiche un message d'erreur */
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    echo "Connected successfully";
?>