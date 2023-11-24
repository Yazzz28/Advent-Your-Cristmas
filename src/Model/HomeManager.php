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
}
