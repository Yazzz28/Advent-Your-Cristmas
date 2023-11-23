<?php

namespace App\Controller;

class DashboardUserController extends AbstractController
{
    public function dashboard(): string
    {
        return $this->twig->render("DashboardUser/dashboard_user.html.twig");
    }
}