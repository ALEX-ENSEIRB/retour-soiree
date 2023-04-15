<?php
include "../header/header.php";
include "../header/connect.php";

$sql = "SELECT t.ID_TRAJET, t.DATE_TRAJET, t.NB_PLACES, ld.ADRESSE_LIEU as DEPART, la.ADRESSE_LIEU as ARRIVEE, u.NO_ETUDIANT, u.NOM_ETUDIANT, u.PRENOM_ETUDIANT
        FROM trajets t
        JOIN lieux ld ON t.ID_DEPART = ld.ID_LIEU
        JOIN lieux la ON t.ID_ARRIVEE = la.ID_LIEU
        JOIN participations p ON t.ID_TRAJET = p.ID_TRAJET
        JOIN users u ON p.NO_ETUDIANT = u.NO_ETUDIANT
        WHERE p.GESTION = 'true'";


$result = $connection->query($sql);

$data = array();

if ($result->num_rows > 0) {
    // Remplissage du tableau avec les résultats
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'id' => $row["ID_TRAJET"],
            'departTime' => $row["DATE_TRAJET"],
            'nbPlaces' => $row["NB_PLACES"],
            'depart' => $row["DEPART"],
            'arrivee' => $row["ARRIVEE"],
            'driver' => array(
                'id' => $row["NO_ETUDIANT"],
                'firstname' =>  $row["PRENOM_ETUDIANT"],
                'name' => $row["NOM_ETUDIANT"]
            )
        );
    }
} else {
    echo "0 résultats";
}

$connection->close();

// Affichage du tableau JSON
http_response_code(200);
header('Content-Type: application/json');
echo json_encode($data);
?>
