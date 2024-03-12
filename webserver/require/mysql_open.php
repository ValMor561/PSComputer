<?php
// Открываем новое соединение с  MySQL сервером
$mysql = new mysqli('127.0.0.1','root','','mybase');

//Выводим любую ошибку соединения
if ($mysql->connect_error) {
    die('Error : ('. $mysql->connect_errno .') '. $mysql->connect_error);
}
$mysql->set_charset("utf8");
?>
