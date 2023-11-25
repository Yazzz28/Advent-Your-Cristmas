<?php

namespace App\Controller;

use DateTime;
use App\Model\DashboardUserManager;
use GrumPHP\IO\ConsoleIO;

class DashboardUserController extends AbstractController
{
    public function dashboard()
    {

        if (!isset($_SESSION["islogin"])) {
            header('Location: /');
        } else {
            $erreurs = [];
            if ($_SERVER["REQUEST_METHOD"] === "POST") {
                $dashboardUserManager = new DashboardUserManager();
                $idBlague = $dashboardUserManager->insertFormBlague($_POST['blague']);
                $film = $dashboardUserManager->selectOneByFilm($_POST['film']);
                $cadeau = $dashboardUserManager->selectOneByCadeau($_POST['cadeau']);
                $recipe = $dashboardUserManager->selectOneByRecette($_POST['title_recipe']);

                if (empty($film)) {
                    $idFilm = $dashboardUserManager->insertFormCadeau($_POST['cadeau']);
                } else {
                    $idFilm = $film["id"];
                }

                if (empty($cadeau)) {
                    $idCadeau = $dashboardUserManager->insertFormCadeau($_POST['cadeau']);
                } else {
                    $idCadeau = $cadeau["id"];
                }

                if (empty($recipe)) {
                    $idRecette = $dashboardUserManager->insertFormRecette($_POST['title_recipe']);
                } else {
                    $idRecette = $recipe["id"];
                }

                if (empty($_POST["date"])) {
                    $erreurs["emptyDate"] = "Veuillez saisir une date";
                } else {
                    if (empty($dashboardUserManager->verifDate($_SESSION["user_id"], $_POST['date']))) {
                        $dashboardUserManager->insertContenu($idBlague, $idCadeau, $idRecette, $idFilm,
                        $_POST['date'], $_SESSION["user_id"]);
                        header("Location: /");
                    } else {
                        $erreurs["date"] = "Il y a déjà du contenu pour cette date";
                    }
                }
            }


            return $this->twig->render(
                "DashboardUser/dashboard_user.html.twig",
                ["erreurs" => $erreurs]
            );
        }
    }

    public function selectRandom()
    {
        $dashboardUserManager = new DashboardUserManager();
        $cadeau = $dashboardUserManager->selectRandomCadeau();
        $recette = $dashboardUserManager->selectRandomRecette();
        $film = $dashboardUserManager->selectRandomFilm();

        return json_encode(["cadeau" => $cadeau, "recette" => $recette, "film" => $film]);
    }
}
