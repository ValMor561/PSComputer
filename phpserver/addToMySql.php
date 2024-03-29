<?php
require_once('require/open_mysql.php'); /* Открытие базы */

$jsonData = file_get_contents('php://input');

$data = json_decode($jsonData, true, 512, JSON_UNESCAPED_UNICODE);
// Переобозначаем аргументы из командной строки в новые переменные
// $argv[0] is '/path/to/wwwpublic/path/to/script.php'
$pcName = $data['computerName'];
$pcDomain = $data['domain'];
$pcUser = $data['user'];
$pcTotalMem = $data['totalPhysicalMemory'];
$osCaption = $data['operatingSystemName'];
$boardManufacturer = $data['motherboardManufacturer'];
$boardProduct = $data['motherboardModel'];
$boardSerial = $data['motherboardSerialNumber'];
$cpuName = $data['processorName'];
$cpuSoket = $data['processorSocket'];
$alldrive = $data['diskInfo'];
$allvideo = $data['graphicsCardInfo'];

//Проверка повтора записей идет по имени компьютера
	$selectSQLU = "SELECT COUNT(*) FROM `pc` WHERE `name_pc` = '$pcName'";
	$Ru = $mysql->query($selectSQLU);
	if ( $Ru->fetch_assoc()['COUNT(*)'] != 0 ) {
		// Если запись существует, то обновляем в ней значения
		$insertSQL="UPDATE `pc` SET `date_pc` = CURRENT_TIMESTAMP,
									`domain_pc` = '$pcDomain',
									`owner_pc` = '$pcUser', 
									`totalmemory_pc` = '$pcTotalMem', 
									`osCaption_pc` = '$osCaption', 
									`boardManufacturer_pc` = '$boardManufacturer',
									`boardProduct_pc` = '$boardProduct',
									`boardSerial_pc` = '$boardSerial',
									`procName_pc` = '$cpuName',
									`procSocket_pc` = '$cpuSoket',
									`drive_pc` = '$alldrive',
									`video_pc` = '$allvideo'
									WHERE `name_pc` = '$pcName'";
	} else {
		// Если записи нет, то добавляем новую запись
		$insertSQL="INSERT INTO `pc` (`id_pc`, `name_pc`, `domain_pc`, `owner_pc`, `totalmemory_pc`, `osCaption_pc`, `boardManufacturer_pc`, `boardProduct_pc`, `boardSerial_pc`, `procName_pc`, `procSocket_pc`, `memory_pc`, `drive_pc`, `video_pc`) VALUES (NULL, '$pcName', '$pcDomain', '$pcUser', '$pcTotalMem', '$osCaption', '$boardManufacturer', '$boardProduct', '$boardSerial', '$cpuName', '$cpuSoket', '', '$alldrive', '$allvideo')";
	}
	// Очистим запрос
	$Ru->free();


// Передадим результат запроса в переменную, если она окажется истиной, то все прошло без ошибок. Иначе ошибка будет выведена в консоли
$success=$mysql->query ($insertSQL);

	if (!$success){
		die('Error : ('. $mysql->errno .') '. $mysql->error);
	}  
	 else {
		  echo "Запись добавлена </br>";
	 }





require_once('require/close_mysql.php'); /* Закрытие базы */ 

$response = ['status' => 'success', 'message' => 'Data received successfully'];
echo json_encode($response);
?>