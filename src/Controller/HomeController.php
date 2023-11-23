<?php

namespace App\Controller;

class HomeController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {

        $images = ["https://www.gignaclanerthe.fr/wp-content/uploads/2022/11/noeumll.jpg", "https://storage.googleapis.com/pod_public/1300/123044.jpg"];

        return $this->twig->render('Home/index.html.twig', ["images" => $images]);
    }
}
