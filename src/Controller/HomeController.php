<?php

namespace App\Controller;

use App\Model\HomeManager;

class HomeController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {

        $homeManager = new HomeManager();
        $contents = $homeManager->selectAllContenu("day");
        $newContents = [];
        foreach ($contents as $content) {
            for ($i = 0; $i <= 24; $i++) {
                if ($i === (int)substr($content["day"], -2)) {
                    $newContents[$i - 1] = $content;
                }
            }
        }

        return $this->twig->render('Home/index.html.twig', ['contents' => $newContents]);
    }


    public function selectDate($id)
    {
        $homeManager = new HomeManager();
        $dateDay = $homeManager->selectDateById($id);

        return $this->twig->render('Home/index.html.twig', ['dateDay' => $dateDay]);
    }

    public function pageError()
    {
        return $this->twig->render('page404.html.twig');
    }
}
