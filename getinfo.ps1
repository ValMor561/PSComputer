# Получаем объект WMI для текущего компьютера
$computerSystem = Get-WmiObject Win32_ComputerSystem
$operatingSystem = Get-WmiObject Win32_OperatingSystem
$processor = Get-WmiObject Win32_Processor
$motherboard = Get-WmiObject Win32_BaseBoard
$physicalMemory = Get-WmiObject Win32_PhysicalMemory
$physicalDisks = Get-PhysicalDisk
$graphicsCard = Get-WmiObject Win32_VideoController

# Извлекаем необходимую информацию
$computerName = $computerSystem.Name
$domain = $computerSystem.Domain
$user = $computerSystem.UserName.Split('\')[-1]
$totalPhysicalMemory = ($physicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
$operatingSystemName = $operatingSystem.Caption
$motherboardManufacturer = $motherboard.Manufacturer
$motherboardModel = $motherboard.Product
$motherboardSerialNumber = $motherboard.SerialNumber
$processorName = $processor.Name
$processorSocket = $processor.SocketDesignation
foreach ($disk in $physicalDisks) {
	$model = $disk.Model
	$serialNumber = $disk.SerialNumber
	$sizeGB = [int]($disk.Size/1GB)
	$diskInfo = "Name=$model -- SN=$serialNumber -- Size=$sizeGB GB"
}
$graphicsCardInfo = $graphicsCard.Name

# Выводим информацию на экран
Write-Output "$computerName"
Write-Output "$domain"
Write-Output "$user"
Write-Output "$totalPhysicalMemory"
Write-Output "$operatingSystemName"
Write-Output "$motherboardManufacturer"
Write-Output "$motherboardModel"
Write-Output "$motherboardSerialNumber"
Write-Output "$processorName"
Write-Output "$processorSocket"

Write-Output "$diskInfo"
Write-Output "$graphicsCardInfo"
