<?php

namespace App\Model;

class DashboardUserManager extends AbstractManager
{
    public function selectRandomCadeau(): array
    {
        $statement = $this->pdo->prepare("SELECT * FROM cadeau ORDER BY RAND() LIMIT 1");

        $statement->execute();

        return $statement->fetch();
    }

    public function selectRandomRecette(): array
    {
        $statement = $this->pdo->prepare("SELECT * FROM recette ORDER BY RAND() LIMIT 1");

        $statement->execute();

        return $statement->fetch();
    }

    public function selectRandomFilm(): array
    {
        $statement = $this->pdo->prepare("SELECT * FROM film ORDER BY RAND() LIMIT 1");

        $statement->execute();

        return $statement->fetch();
    }

    public function insertFormBlague(string $story): int
    {
        $statement = $this->pdo->prepare("INSERT INTO blague (story) VALUES (:story)");
        $statement->bindValue("story", $story);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function insertFormCadeau(string $cadeau): int
    {
        $statement = $this->pdo->prepare("INSERT INTO cadeau (idea) VALUES (:cadeau)");
        $statement->bindValue("cadeau", $cadeau);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function insertFormRecette(string $recette): int
    {
        $statement = $this->pdo->prepare("INSERT INTO recette (title) VALUES (:recette)");
        $statement->bindValue("recette", $recette);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function insertFormFilm(string $film): int
    {
        $statement = $this->pdo->prepare("INSERT INTO film (movie_title) VALUES (:film)");
        $statement->bindValue("film", $film);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function selectOneByCadeau(string $cadeau): array|false
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM cadeau WHERE idea=:idea");
        $statement->bindValue('idea', $cadeau, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function selectOneByRecette(string $recette): array|false
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM recette WHERE title=:title");
        $statement->bindValue('title', $recette, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function selectOneByFilm(string $film): array|false
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM film WHERE movie_title=:title");
        $statement->bindValue('title', $film, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function insertContenu(int $idBlague, int $idCadeau, int $idRecette, int $idFilm, string $date, int $idUser)
    {
        $statement = $this->pdo->prepare("INSERT INTO contenu (day, user_id, blague_id, 
        recette_id, cadeau_id, film_id) VALUES (:day, :userID, :blagueID, :recetteID, :cadeauID, :filmID)");
        $statement->bindValue("day", $date);
        $statement->bindValue("userID", $idUser);
        $statement->bindValue("blagueID", $idBlague);
        $statement->bindValue("recetteID", $idRecette);
        $statement->bindValue("cadeauID", $idCadeau);
        $statement->bindValue("filmID", $idFilm);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function verifDate(int $user_id, string $date)
    {
        // prepared request
        $statement = $this->pdo->prepare("SELECT * FROM contenu WHERE day=:date AND user_id=:userId");
        $statement->bindValue('date', $date, \PDO::PARAM_STR);
        $statement->bindValue('userId', $user_id, \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }
}
