<?php

namespace App\Model;

use App\Model\AbstractManager;
use PDO;

class HomeManager extends AbstractManager
{
    public const TABLE = 'contenu';

    public function selectDateById($id)
    {
        $statement = $this->pdo->prepare('SELECT DAY(date) INTO ' . self::TABLE . " WHERE id=:id");
        $statement->bindValue('id', $id, PDO::PARAM_INT);
        $statement->execute();
    }

    public function selectAllContenu(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT contenu.id, contenu.jour, blague.story, film.movie_title, recette.title,
        cadeau.idea FROM ' . static::TABLE . ' INNER JOIN cadeau ON cadeau.id=contenu.cadeau_id 
        INNER JOIN blague ON blague.id=contenu.blague_id
        INNER JOIN recette ON recette.id = contenu.recette_id 
        INNER JOIN film ON film.id = contenu.film_id';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }

        return $this->pdo->query($query)->fetchAll();
    }
}
