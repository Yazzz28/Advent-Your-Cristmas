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
            " (firstname, lastname, email, password, adresse, tel, profession) 
         VALUES (:firstname, :lastname, :email, :password, :adresse, :tel, :profession)");
        $statement->bindValue('firstname', $user['firstname'], \PDO::PARAM_STR);
        $statement->bindValue('lastname', $user['lastname'], \PDO::PARAM_STR);
        $statement->bindValue('email', $user['email'], \PDO::PARAM_STR);
        $statement->bindValue('password', password_hash($user['password'], PASSWORD_DEFAULT), \PDO::PARAM_STR);
        $statement->bindValue('adresse', $user['adresse'], \PDO::PARAM_STR);
        $statement->bindValue('tel', $user['tel'], \PDO::PARAM_INT);
        $statement->bindValue('profession', $user['profession'], \PDO::PARAM_STR);
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
        $statement = $this->pdo->prepare("UPDATE " . static::TABLE .
            " SET password=:password WHERE email=:email");
        $statement->bindValue('email', $user['email'], \PDO::PARAM_STR);
        $statement->bindValue('password', password_hash($user['password'], PASSWORD_DEFAULT), \PDO::PARAM_STR);
        $statement->execute();

        return;
    }
}
