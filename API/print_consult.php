<html>

<head>
  <title>PHP Test</title>
</head>

<body>
  <h2>Exemple de requete php MySQL</h2>
  <?php
  include "connect.php"; /* Le fichier connect.php contient les identifiants de connexion */
  /* On crée une table avec des données: */
  $creation = "
           create table if not exists ACTEUR (
           NOM varchar(20) not null,
           PRENOM varchar(10) not null,
           primary key (NOM)
           );
           ";
  /* Execution d'une requete multiple */
  $connection->query($creation);
  echo "Cr&eacute;ation de la table ACTEUR\n";

  /* On insère des données dans la table: */
  $insertion = "
  insert ignore into ACTEUR (NOM, PRENOM) values
  ('Roth', 'Tim'),
  ('Keitel', 'Harvey');
  ";
  $connection->query($insertion);
  echo "Insertion de donn&eacute;es dans la table ACTEUR\n";
  
  ?>
  <table>
    <tr>
      <th>Nom</th>
      <th>Pr&eacute;nom</th>
    </tr>
    <?php
    $requete = "select distinct NOM, PRENOM from ACTEUR";
    $res = $connection->query($requete);
    /* Si l'execution est reussie... */
    if ($res->num_rows > 0) {
      /* ... on récupère un tableau stockant le résultat */
      while ($acteur =  $res->fetch_assoc()) {
        echo "\t" . '<tr><td>' . $acteur['NOM'] . '</td>';
        echo '<td>' . $acteur['PRENOM'] . '</td>';
        echo '</tr>' . "\n";
      }
      /*liberation de l'objet requete:*/
      $res->free();
      /*fermeture de la connexion avec la base*/
      $connection->close();
    }
    ?>
  </table>
</body>

</html>