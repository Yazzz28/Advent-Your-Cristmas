<?php

namespace App\Model;

use App\Model\AbstractManager;

class SecurityManager extends AbstractManager
{
    public const TABLE = 'user';

    public function userLogin(array $user)
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . static::TABLE .
            " WHERE email=:email");
        $statement->bindValue(':email', $user['email'], \PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch();
    }

    public function userSignin(array $user)
    {
        $statement = $this->pdo->prepare("INSERT INTO " . static::TABLE .
            " (firstname, email, password) 
         VALUES (:firstname, :email, :password)");
        $statement->bindValue(':firstname', $user['firstname'], \PDO::PARAM_STR);
        $statement->bindValue(':email', $user['email'], \PDO::PARAM_STR);
        $statement->bindValue(':password', password_hash($user['password'], PASSWORD_DEFAULT), \PDO::PARAM_STR);
        $statement->execute();

        return;
    }

    public function emailExist(string $email)
    {
        $statement = $this->pdo->prepare("SELECT COUNT(*) AS count FROM " . static::TABLE .
            " WHERE email = :email");
        $statement->bindValue('email', $email, \PDO::PARAM_STR);
        $statement->execute();
        $result = $statement->fetch();

        return $result["count"] > 0;
    }

    public function userResetPassword(array $user)
    {
        $statement = $this->pdo->prepare(" UPDATE " . static::TABLE .
            " SET password= :password WHERE email= :email ");
        $statement->bindValue(':email', $user['emailF'], \PDO::PARAM_STR);
        $statement->bindValue(':password', password_hash($user['passwordF'], PASSWORD_DEFAULT), \PDO::PARAM_STR);
        $statement->execute();

        return;
    }
}
