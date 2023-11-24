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


        return $this->twig->render('Home/index.html.twig');
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
