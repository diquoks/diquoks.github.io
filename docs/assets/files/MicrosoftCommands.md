# MicrosoftCommands

#### Сборник полезных команд при настройке Windows

---

## Оглавление

- [Активация Windows и Microsoft Office](#активация-windows-и-microsoft-office)
- [Установка Microsoft Office](#установка-microsoft-office)
- [Блокировка установки обновления Windows до версии 24H2](#блокировка-установки-обновления-windows-до-версии-24h2)
- [Разрешение установки обновления Windows до версии 24H2](#разрешение-установки-обновления-windows-до-версии-24h2)
- [Установка исходного разрешения при загрузке Windows](#установка-исходного-разрешения-при-загрузке-windows)

---

## Активация Windows и Microsoft Office:

##### Откройте PowerShell от имени администратора

##### Запустите активатор

```shell
irm https://get.activated.win | iex
```

##### Выберите желаемое действие

---

## Установка Microsoft Office:

##### Скачайте файл [по ссылке](https://www.microsoft.com/en-us/download/details.aspx?id=49117)

##### Запустите и распакуйте в любую папку

##### Откройте командную строку от имени администратора

##### Добавьте параметр в реестр

```commandline
reg add "HKCU\Software\Microsoft\Office\16.0\Common\ExperimentConfigs\Ecs" /v "CountryCode" /t REG_SZ /d "std::wstring|US" /f
```

##### Перейдите в папку с распакованными файлами

```commandline
cd <путь до папки в которую распакованы файлы>
```

##### Запустите установщик

```commandline
setup.exe /configure configuration-Office365-x64.xml
```

---

## Блокировка установки обновления Windows до версии 24H2

##### Откройте командную строку от имени администратора

##### Поочерёдно добавьте параметры в реестр

```commandline
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1
```

```commandline
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d "23H2"
```

```commandline
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v ProductVersion /t REG_SZ /d "Windows 11"
```

---

## Разрешение установки обновления Windows до версии 24H2

##### Откройте командную строку от имени администратора

##### Поочерёдно добавьте параметры в реестр

```commandline
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion
```

```commandline
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo
```

```commandline
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v ProductVersion
```

---

## Установка исходного разрешения при загрузке Windows

##### Откройте командную строку от имени администратора

##### Добавьте параметр конфигурации загрузки

```commandline
bcdedit /set {globalsettings} highestmode on
```
