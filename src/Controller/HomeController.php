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

        $images = ["https://www.gignaclanerthe.fr/wp-content/uploads/2022/11/noeumll.jpg",
        "https://storage.googleapis.com/pod_public/1300/123044.jpg"];

        return $this->twig->render('Home/index.html.twig', ["images" => $images]);
    }

    public function showModal()
    {
        $homeManager = new HomeManager();
        $contents = $homeManager->selectAll();

        return $this->twig->render('Home/index.html.twig', ['contents' => $contents]);
    }

    public function selectDate($id)
    {
        $homeManager = new HomeManager();
        $dateDay = $homeManager->selectDateById($id);

        return $this->twig->render('Home/index.html.twig', ['dateDay' => $dateDay]);
    }
}
