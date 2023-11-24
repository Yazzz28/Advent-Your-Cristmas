<?php

namespace App\Controller;

use DateTime;
use App\Model\DashboardUserManager;
use GrumPHP\IO\ConsoleIO;

class DashboardUserController extends AbstractController
{
    public function dashboard(): string
    {
        $erreurs = [];
        $valide = false;
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $dashboardUserManager = new DashboardUserManager();
            $idBlague = $dashboardUserManager->insertFormBlague($_POST['blague']);
            $idFilm = $dashboardUserManager->insertFormFilm($_POST['film']);
            $idCadeau = $dashboardUserManager->selectOneByCadeau($_POST['cadeau'])["id"];
            $idRecette = $dashboardUserManager->selectOneByRecette($_POST['title_recipe'])["id"];

            if (empty($idCadeau)) {
                $idCadeau = $dashboardUserManager->insertFormCadeau($_POST['cadeau']);
            }

            if (empty($idRecette)) {
                $idRecette = $dashboardUserManager->insertFormRecette($_POST['title_recipe']);
            }

            if (empty($dashboardUserManager->verifDate($_POST['date']))) {
                $dashboardUserManager->insertContenu($idBlague, $idCadeau, $idRecette, $idFilm, $_POST['date'], 1);
                $valide = true;
            } else {
                $erreurs["date"] = "Veuillez sélectionner une autre date";
            }
        }


        return $this->twig->render(
            "DashboardUser/dashboard_user.html.twig",
            ["erreurs" => $erreurs, "valide" => $valide]
        );
    }

    public function selectRandom()
    {
        $dashboardUserManager = new DashboardUserManager();
        $cadeau = $dashboardUserManager->selectRandomCadeau();
        $recette = $dashboardUserManager->selectRandomRecette();

        return json_encode(["cadeau" => $cadeau, "recette" => $recette]);
    }
}
