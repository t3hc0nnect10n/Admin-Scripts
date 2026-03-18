<#
    Утилита для оповещения пользователей о необходимости перезагрузить сервера и перезагрузка серверов
    Версия с окном подтверждения перед перезагрузкой серверов
#>
 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()
 
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(700,655)
$Form.text                       = "Reboot Servers and Users Informing"
$Form.TopMost                    = $True
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#8dbbf3")

# Groupbox1

$CheckBoxAll1                    = New-Object system.Windows.Forms.CheckBox
$CheckBoxAll1.text               = "Выбрать все"
$CheckBoxAll1.AutoSize           = $True
$CheckBoxAll1.width              = 95
$CheckBoxAll1.height             = 20
$CheckBoxAll1.location           = New-Object System.Drawing.Point(10,7)
$CheckBoxAll1.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)                     
 
$Groupbox1                       = New-Object system.Windows.Forms.Groupbox
$Groupbox1.height                = 385
$Groupbox1.width                 = 135
$Groupbox1.text                  = "Список серверов"
$Groupbox1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Groupbox1.location              = New-Object System.Drawing.Point(10,25)
 
$CheckBox1_1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_1.text                  = "<Написать имя сервера>"
$CheckBox1_1.AutoSize              = $True
$CheckBox1_1.width                 = 95
$CheckBox1_1.height                = 20
$CheckBox1_1.location              = New-Object System.Drawing.Point(4,20)
$CheckBox1_1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_2                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_2.text                  = "<Написать имя сервера>"
$CheckBox1_2.AutoSize              = $True
$CheckBox1_2.width                 = 95
$CheckBox1_2.height                = 20
$CheckBox1_2.location              = New-Object System.Drawing.Point(4,40)
$CheckBox1_2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_3.text                  = "<Написать имя сервера>"
$CheckBox1_3.AutoSize              = $True
$CheckBox1_3.width                 = 95
$CheckBox1_3.height                = 20
$CheckBox1_3.location              = New-Object System.Drawing.Point(4,60)
$CheckBox1_3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_4.text                  = "<Написать имя сервера>"
$CheckBox1_4.AutoSize              = $True
$CheckBox1_4.width                 = 95
$CheckBox1_4.height                = 20
$CheckBox1_4.location              = New-Object System.Drawing.Point(4,80)
$CheckBox1_4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_5                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_5.text                  = "<Написать имя сервера>"
$CheckBox1_5.AutoSize              = $True
$CheckBox1_5.width                 = 95
$CheckBox1_5.height                = 20
$CheckBox1_5.location              = New-Object System.Drawing.Point(4,100)
$CheckBox1_5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_6                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_6.text                  = "<Написать имя сервера>"
$CheckBox1_6.AutoSize              = $True
$CheckBox1_6.width                 = 95
$CheckBox1_6.height                = 20
$CheckBox1_6.location              = New-Object System.Drawing.Point(4,120)
$CheckBox1_6.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_7                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_7.text                  = "<Написать имя сервера>"
$CheckBox1_7.AutoSize              = $True
$CheckBox1_7.width                 = 95
$CheckBox1_7.height                = 20
$CheckBox1_7.location              = New-Object System.Drawing.Point(4,140)
$CheckBox1_7.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_8                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1_8.text                  = "<Написать имя сервера>"
$CheckBox1_8.AutoSize              = $True
$CheckBox1_8.width                 = 95
$CheckBox1_8.height                = 20
$CheckBox1_8.location              = New-Object System.Drawing.Point(4,160)
$CheckBox1_8.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_9                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_9.text                 = "<Написать имя сервера>"
$CheckBox1_9.AutoSize             = $True
$CheckBox1_9.width                = 95
$CheckBox1_9.height               = 20
$CheckBox1_9.location             = New-Object System.Drawing.Point(4,180)
$CheckBox1_9.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox1_10                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_10.text                 = "<Написать имя сервера>"
$CheckBox1_10.AutoSize             = $True
$CheckBox1_10.width                = 95
$CheckBox1_10.height               = 20
$CheckBox1_10.location             = New-Object System.Drawing.Point(4,200)
$CheckBox1_10.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_11                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_11.text                 = "<Написать имя сервера>"
$CheckBox1_11.AutoSize             = $True
$CheckBox1_11.width                = 95
$CheckBox1_11.height               = 20
$CheckBox1_11.location             = New-Object System.Drawing.Point(4,220)
$CheckBox1_11.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_12                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_12.text                 = "<Написать имя сервера>"
$CheckBox1_12.AutoSize             = $True
$CheckBox1_12.width                = 95
$CheckBox1_12.height               = 20
$CheckBox1_12.location             = New-Object System.Drawing.Point(4,240)
$CheckBox1_12.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_13                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_13.text                 = "<Написать имя сервера>"
$CheckBox1_13.AutoSize             = $True
$CheckBox1_13.width                = 95
$CheckBox1_13.height               = 20
$CheckBox1_13.location             = New-Object System.Drawing.Point(4,260)
$CheckBox1_13.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_14                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_14.text                 = "<Написать имя сервера>"
$CheckBox1_14.AutoSize             = $True
$CheckBox1_14.width                = 95
$CheckBox1_14.height               = 20
$CheckBox1_14.location             = New-Object System.Drawing.Point(4,280)
$CheckBox1_14.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_15                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_15.text                 = "<Написать имя сервера>"
$CheckBox1_15.AutoSize             = $True
$CheckBox1_15.width                = 95
$CheckBox1_15.height               = 20
$CheckBox1_15.location             = New-Object System.Drawing.Point(4,300)
$CheckBox1_15.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_16                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_16.text                 = "<Написать имя сервера>"
$CheckBox1_16.AutoSize             = $True
$CheckBox1_16.width                = 95
$CheckBox1_16.height               = 20
$CheckBox1_16.location             = New-Object System.Drawing.Point(4,320)
$CheckBox1_16.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_19                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_19.text                 = "<Написать имя сервера>"
$CheckBox1_19.AutoSize             = $True
$CheckBox1_19.width                = 95
$CheckBox1_19.height               = 20
$CheckBox1_19.location             = New-Object System.Drawing.Point(4,340)
$CheckBox1_19.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox1_20                      = New-Object system.Windows.Forms.CheckBox
$CheckBox1_20.text                 = "<Написать имя сервера>"
$CheckBox1_20.AutoSize             = $True
$CheckBox1_20.width                = 95
$CheckBox1_20.height               = 20
$CheckBox1_20.location             = New-Object System.Drawing.Point(4,360)
$CheckBox1_20.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Groupbox2

$CheckBoxAll2                    = New-Object system.Windows.Forms.CheckBox
$CheckBoxAll2.text               = "Выбрать все"
$CheckBoxAll2.AutoSize           = $True
$CheckBoxAll2.width              = 95
$CheckBoxAll2.height             = 20
$CheckBoxAll2.location           = New-Object System.Drawing.Point(145,7)
$CheckBoxAll2.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)                     
 
$Groupbox2                       = New-Object system.Windows.Forms.Groupbox
$Groupbox2.height                = 385
$Groupbox2.width                 = 135
$Groupbox2.text                  = "Список серверов"
$Groupbox2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Groupbox2.location              = New-Object System.Drawing.Point(145,25)
 
$CheckBox2_1                      = New-Object system.Windows.Forms.CheckBox
$CheckBox2_1.text                 = "<Написать имя сервера>"
$CheckBox2_1.AutoSize             = $True
$CheckBox2_1.width                = 95
$CheckBox2_1.height               = 20
$CheckBox2_1.location             = New-Object System.Drawing.Point(4,20)
$CheckBox2_1.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox2_2                      = New-Object system.Windows.Forms.CheckBox
$CheckBox2_2.text                 = "<Написать имя сервера>"
$CheckBox2_2.AutoSize             = $True
$CheckBox2_2.width                = 95
$CheckBox2_2.height               = 20
$CheckBox2_2.location             = New-Object System.Drawing.Point(4,40)
$CheckBox2_2.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox2_3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox2_3.text                  = "<Написать имя сервера>"
$CheckBox2_3.AutoSize              = $True
$CheckBox2_3.width                 = 95
$CheckBox2_3.height                = 20
$CheckBox2_3.location              = New-Object System.Drawing.Point(4,60)
$CheckBox2_3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox2_4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox2_4.text                  = "<Написать имя сервера>"
$CheckBox2_4.AutoSize              = $True
$CheckBox2_4.width                 = 95
$CheckBox2_4.height                = 20
$CheckBox2_4.location              = New-Object System.Drawing.Point(4,80)
$CheckBox2_4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox2_5                       = New-Object system.Windows.Forms.CheckBox
$CheckBox2_5.text                  = "<Написать имя сервера>"
$CheckBox2_5.AutoSize              = $True
$CheckBox2_5.width                 = 95
$CheckBox2_5.height                = 20
$CheckBox2_5.location              = New-Object System.Drawing.Point(4,100)
$CheckBox2_5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)  
 
$CheckBox2_6                       = New-Object system.Windows.Forms.CheckBox
$CheckBox2_6.text                  = "<Написать имя сервера>"
$CheckBox2_6.AutoSize              = $True
$CheckBox2_6.width                 = 95
$CheckBox2_6.height                = 20
$CheckBox2_6.location              = New-Object System.Drawing.Point(4,120)
$CheckBox2_6.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Groupbox3 
 
$CheckBoxAll3                     = New-Object system.Windows.Forms.CheckBox
$CheckBoxAll3.text                = "Выбрать все"
$CheckBoxAll3.AutoSize            = $True
$CheckBoxAll3.width               = 95
$CheckBoxAll3.height              = 20
$CheckBoxAll3.location            = New-Object System.Drawing.Point(280,7)
$CheckBoxAll3.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)                     
 
$Groupbox3                        = New-Object system.Windows.Forms.Groupbox
$Groupbox3.height                 = 385
$Groupbox3.width                  = 135
$Groupbox3.text                   = "Список серверов"
$Groupbox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Groupbox3.location               = New-Object System.Drawing.Point(280,25)
 
$CheckBox3_1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox3_1.text                  = "<Написать имя сервера>"
$CheckBox3_1.AutoSize              = $True
$CheckBox3_1.width                 = 95
$CheckBox3_1.height                = 20
$CheckBox3_1.location              = New-Object System.Drawing.Point(4,20)
$CheckBox3_1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox3_2                       = New-Object system.Windows.Forms.CheckBox
$CheckBox3_2.text                  = "<Написать имя сервера>"
$CheckBox3_2.AutoSize              = $True
$CheckBox3_2.width                 = 95
$CheckBox3_2.height                = 20
$CheckBox3_2.location              = New-Object System.Drawing.Point(4,40)
$CheckBox3_2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox3_3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox3_3.text                  = "<Написать имя сервера>"
$CheckBox3_3.AutoSize              = $True
$CheckBox3_3.width                 = 95
$CheckBox3_3.height                = 20
$CheckBox3_3.location              = New-Object System.Drawing.Point(4,60)
$CheckBox3_3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox3_4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox3_4.text                  = "<Написать имя сервера>"
$CheckBox3_4.AutoSize              = $True
$CheckBox3_4.width                 = 95
$CheckBox3_4.height                = 20
$CheckBox3_4.location              = New-Object System.Drawing.Point(4,80)
$CheckBox3_4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
# Groupbox4

$CheckBoxAll4                     = New-Object system.Windows.Forms.CheckBox
$CheckBoxAll4.text                = "Выбрать все"
$CheckBoxAll4.AutoSize            = $True
$CheckBoxAll4.width               = 95
$CheckBoxAll4.height              = 20
$CheckBoxAll4.location            = New-Object System.Drawing.Point(415,7)
$CheckBoxAll4.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)                     
 
$Groupbox4                        = New-Object system.Windows.Forms.Groupbox
$Groupbox4.height                 = 385
$Groupbox4.width                  = 135
$Groupbox4.text                   = "Список серверов"
$Groupbox4.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Groupbox4.location               = New-Object System.Drawing.Point(415,25)
 
$CheckBox4_1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_1.text                  = "<Написать имя сервера>"
$CheckBox4_1.AutoSize              = $True
$CheckBox4_1.width                 = 95
$CheckBox4_1.height                = 20
$CheckBox4_1.location              = New-Object System.Drawing.Point(4,20)
$CheckBox4_1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox4_2                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_2.text                  = "<Написать имя сервера>"
$CheckBox4_2.AutoSize              = $True
$CheckBox4_2.width                 = 95
$CheckBox4_2.height                = 20
$CheckBox4_2.location              = New-Object System.Drawing.Point(4,40)
$CheckBox4_2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox4_3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_3.text                  = "<Написать имя сервера>"
$CheckBox4_3.AutoSize              = $True
$CheckBox4_3.width                 = 95
$CheckBox4_3.height                = 20
$CheckBox4_3.location              = New-Object System.Drawing.Point(4,60)
$CheckBox4_3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox4_4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_4.text                  = "<Написать имя сервера>"
$CheckBox4_4.AutoSize              = $True
$CheckBox4_4.width                 = 95
$CheckBox4_4.height                = 20
$CheckBox4_4.location              = New-Object System.Drawing.Point(4,80)
$CheckBox4_4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox4_5                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_5.text                  = "<Написать имя сервера>"
$CheckBox4_5.AutoSize              = $True
$CheckBox4_5.width                 = 95
$CheckBox4_5.height               = 20
$CheckBox4_5.location              = New-Object System.Drawing.Point(4,100)
$CheckBox4_5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox4_6                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_6.text                  = "<Написать имя сервера>"
$CheckBox4_6.AutoSize              = $True
$CheckBox4_6.width                 = 95
$CheckBox4_6.height                = 20
$CheckBox4_6.location              = New-Object System.Drawing.Point(4,120)
$CheckBox4_6.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox4_7                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_7.text                  = "<Написать имя сервера>"
$CheckBox4_7.AutoSize              = $True
$CheckBox4_7.width                 = 95
$CheckBox4_7.height                = 20
$CheckBox4_7.location              = New-Object System.Drawing.Point(4,140)
$CheckBox4_7.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox4_8                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_8.text                  = "<Написать имя сервера>"
$CheckBox4_8.AutoSize              = $True
$CheckBox4_8.width                 = 95
$CheckBox4_8.height                = 20
$CheckBox4_8.location              = New-Object System.Drawing.Point(4,160)
$CheckBox4_8.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$CheckBox4_9                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_9.text                  = "<Написать имя сервера>"
$CheckBox4_9.AutoSize              = $True
$CheckBox4_9.width                 = 95
$CheckBox4_9.height               = 20
$CheckBox4_9.location              = New-Object System.Drawing.Point(4,180)
$CheckBox4_9.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox4_10                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4_10.text                  = "<Написать имя сервера>"
$CheckBox4_10.AutoSize              = $True
$CheckBox4_10.width                = 95
$CheckBox4_10.height               = 20
$CheckBox4_10.location              = New-Object System.Drawing.Point(4,200)
$CheckBox4_10.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Groupbox5 
 
$CheckBoxAll5                     = New-Object system.Windows.Forms.CheckBox
$CheckBoxAll5.text                = "Выбрать все"
$CheckBoxAll5.AutoSize            = $True
$CheckBoxAll5.width               = 95
$CheckBoxAll5.height              = 20
$CheckBoxAll5.location            = New-Object System.Drawing.Point(550,7)
$CheckBoxAll5.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)                     
 
$Groupbox5                        = New-Object system.Windows.Forms.Groupbox
$Groupbox5.height                 = 385
$Groupbox5.width                  = 135
$Groupbox5.text                   = "Список серверов"
$Groupbox5.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Groupbox5.location               = New-Object System.Drawing.Point(550,25)
 
$CheckBox5_1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_1.text                  = "<Написать имя сервера>"
$CheckBox5_1.AutoSize              = $True
$CheckBox5_1.width                 = 95
$CheckBox5_1.height                = 20
$CheckBox5_1.location              = New-Object System.Drawing.Point(4,20)
$CheckBox5_1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox5_2                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_2.text                  = "<Написать имя сервера>"
$CheckBox5_2.AutoSize              = $True
$CheckBox5_2.width                 = 95
$CheckBox5_2.height                = 20
$CheckBox5_2.location              = New-Object System.Drawing.Point(4,40)
$CheckBox5_2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox5_3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_3.text                  = "<Написать имя сервера>"
$CheckBox5_3.AutoSize              = $True
$CheckBox5_3.width                 = 95
$CheckBox5_3.height                = 20
$CheckBox5_3.location              = New-Object System.Drawing.Point(4,60)
$CheckBox5_3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox5_4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_4.text                  = "<Написать имя сервера>"
$CheckBox5_4.AutoSize              = $True
$CheckBox5_4.width                 = 95
$CheckBox5_4.height                = 20
$CheckBox5_4.location              = New-Object System.Drawing.Point(4,80)
$CheckBox5_4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
$CheckBox5_5                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_5.text                  = "<Написать имя сервера>"
$CheckBox5_5.AutoSize              = $True
$CheckBox5_5.width                 = 95
$CheckBox5_5.height                = 20
$CheckBox5_5.location              = New-Object System.Drawing.Point(4,100)
$CheckBox5_5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

 
$CheckBox5_6                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5_6.text                  = "<Написать имя сервера>"
$CheckBox5_6.AutoSize              = $True
$CheckBox5_6.width                 = 95
$CheckBox5_6.height                = 20
$CheckBox5_6.location              = New-Object System.Drawing.Point(4,120)
$CheckBox5_6.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Ввод времени перезагрузки сервера в секундах 

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Введите время через которое перезагрузить сервера (сек)"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(10,550)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Bold))
 
$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.Text                   = 600
$TextBox1.multiline              = $True
$TextBox1.AutoSize               = $True
$TextBox1.width                  = 40
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(420,550)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Форма сообщения пользователям
 
$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Введите сообщение для пользователей"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(9,412)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Bold))
 
$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.Text                   = "Сервер будет перезагружен через 10 минут.`r`nВ избежании потери данных просьба сохранить работу."
$TextBox2.multiline              = $True
$TextBox2.AutoSize               = $True
$TextBox2.width                  = 685
$TextBox2.height                 = 100
$TextBox2.location               = New-Object System.Drawing.Point(9,430)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
 
# Кнопка "Отправить сообщение"

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Отправить сообщение"
$Button1.AutoSize                = $True
$Button1.width                   = 60
$Button1.height                  = 60
$Button1.location                = New-Object System.Drawing.Point(10,585)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#f8e71c")
 
# Кнопка "Перезагрузить сервера"

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Перезагрузить сервера"
$Button2.AutoSize                = $True
$Button2.width                   = 60
$Button2.height                  = 60
$Button2.location                = New-Object System.Drawing.Point(460,585)
$Button2.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button2.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#f82b1c")
 
# Кнопка "Отменить"

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Отменить"
$Button3.AutoSize                = $True
$Button3.width                   = 200
$Button3.height                  = 60
$Button3.location                = New-Object System.Drawing.Point(245,585)
$Button3.DialogResult            = [System.Windows.Forms.DialogResult]::Cancel
$Button3.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button3.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#7ed321")
 
 
$Form.controls.AddRange(@($Groupbox1, $Groupbox2, $Groupbox3, $Groupbox4, $Groupbox5, $Button1, $Button2, $Button3,
    $TextBox1, $TextBox2, $CheckBoxAll1, $Label2, $Label3, $CheckBoxAll2, $CheckBoxAll3, $CheckBoxAll4, $CheckBoxAll5))
 
$Groupbox1.controls.AddRange(@($CheckBox1_1, $CheckBox1_2, $CheckBox1_3, $CheckBox1_4, $CheckBox1_5, $CheckBox1_6,
    $CheckBox1_7, $CheckBox1_8, $CheckBox1_9, $CheckBox1_10, $CheckBox1_11, $CheckBox1_12, $CheckBox1_13, $CheckBox1_14,
    $CheckBox1_15, $CheckBox1_16, $CheckBox1_19, $CheckBox1_20))
 
$Groupbox2.controls.AddRange(@($CheckBox2_1, $CheckBox2_2, $CheckBox2_3, $CheckBox2_4, $CheckBox2_5, $CheckBox2_6))
 
$Groupbox3.controls.AddRange(@($CheckBox3_1, $CheckBox3_2, $CheckBox3_3, $CheckBox3_4))
 
$Groupbox4.controls.AddRange(@($CheckBox4_1, $CheckBox4_2, $CheckBox4_3, $CheckBox4_4, $CheckBox4_5, $CheckBox4_6,
    $CheckBox4_7, $CheckBox4_8, $CheckBox4_9, $CheckBox4_10))
 
$Groupbox5.controls.AddRange(@($CheckBox5_1, $CheckBox5_2, $CheckBox5_3, $CheckBox5_4, $CheckBox5_5, $CheckBox5_6))
 

function Show-ProgressBar-DelaySec($param) {
    $script:progressFormCancelled = $false
    $barWidth = 445
    $barHeight = 28
    $progressForm = New-Object System.Windows.Forms.Form
    $progressForm.Text = "Ожидание"
    $progressForm.TopMost = $true
    $progressForm.FormBorderStyle = 'FixedDialog'
    $progressForm.Size = New-Object System.Drawing.Size(480, 140)
    $progressForm.StartPosition = 'CenterScreen'
    $progressForm.ControlBox = $true
    $progressForm.Add_FormClosing({
        param($sender, $e)
        $script:progressFormCancelled = $true
    })
    $progressForm.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
    $labelInfo = New-Object System.Windows.Forms.Label
    $labelInfo.Text = "Идёт обратный отсчёт установленной паузы.`nНе закрывайте форму, иначе сервера не будут перезапущены."
    $labelInfo.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
    $labelInfo.ForeColor = [System.Drawing.Color]::DarkRed
    $labelInfo.AutoSize = $false
    $labelInfo.Size = New-Object System.Drawing.Size(450, 45)
    $labelInfo.Location = New-Object System.Drawing.Point(15, 8)
    $labelInfo.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
    $progressForm.Controls.Add($labelInfo)
    $colorGreen = [System.Drawing.Color]::FromArgb(76, 175, 80)
    $colorGray = [System.Drawing.Color]::FromArgb(220, 220, 220)
    $panelTrack = New-Object System.Windows.Forms.Panel
    $panelTrack.BackColor = $colorGray
    $panelTrack.BorderStyle = 'FixedSingle'
    $panelTrack.Location = New-Object System.Drawing.Point(15, 58)
    $panelTrack.Size = New-Object System.Drawing.Size($barWidth, $barHeight)
    $panelGreen = New-Object System.Windows.Forms.Panel
    $panelGreen.BackColor = $colorGreen
    $panelGreen.Location = New-Object System.Drawing.Point(0, 0)
    $panelGreen.Size = New-Object System.Drawing.Size(0, $barHeight)
    $labelCountdown = New-Object System.Windows.Forms.Label
    $labelCountdown.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 14, [System.Drawing.FontStyle]::Bold)
    $labelCountdown.ForeColor = [System.Drawing.Color]::Black
    $labelCountdown.BackColor = $colorGray
    $labelCountdown.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    $labelCountdown.AutoSize = $false
    $labelWidth = 50
    $labelCountdown.Size = New-Object System.Drawing.Size($labelWidth, $barHeight)
    $centerX = [int](($barWidth - $labelWidth) / 2)
    $labelCountdown.Location = New-Object System.Drawing.Point($centerX, 0)
    $panelTrack.Controls.Add($panelGreen)
    $panelTrack.Controls.Add($labelCountdown)
    $labelCountdown.BringToFront()
    $progressForm.Controls.Add($panelTrack)
    $progressForm.Show()
    [System.Windows.Forms.Application]::DoEvents()
    for ($i = $param; $i -ge 0; $i--) {
        if ($script:progressFormCancelled -or $progressForm.IsDisposed) { break }
        $labelCountdown.Text = $i
        $fillPercent = if ($i -eq $param) { 0.0 } else { [double]($param - $i) / [double]$param }
        $panelGreen.Width = [Math]::Max(1, [int]($barWidth * $fillPercent))
        if ($panelGreen.Width -ge $centerX) {
            $labelCountdown.BackColor = $colorGreen
            $labelCountdown.ForeColor = [System.Drawing.Color]::White
        } else {
            $labelCountdown.BackColor = $colorGray
            $labelCountdown.ForeColor = [System.Drawing.Color]::Black
        }
        [System.Windows.Forms.Application]::DoEvents()
        if ($i -gt 0) {
            for ($w = 0; $w -lt 10 -and (-not $script:progressFormCancelled); $w++) {
                Start-Sleep -Milliseconds 100
                [System.Windows.Forms.Application]::DoEvents()
            }
        }
    }
    $completedSuccessfully = -not $script:progressFormCancelled
    if (-not $progressForm.IsDisposed) {
        $progressForm.Close()
        $progressForm.Dispose()
    }
    return $completedSuccessfully
}

function Show-MessageBoxTopMost {
    param([string]$Text, [string]$Caption, [System.Windows.Forms.MessageBoxButtons]$Buttons, [System.Windows.Forms.MessageBoxIcon]$Icon)
    $Form.BringToFront()
    return [System.Windows.Forms.MessageBox]::Show($Form, $Text, $Caption, $Buttons, $Icon)
}

function clkSelectALL($param) {
    foreach ($control in $param){
        $objectType = $control.GetType().Name
        if ($objectType -like "CheckBox"){
            $control.checked = $true
        }
    }
}
 
function clkUnSelectALL($param) {
    foreach ($control in $param){
        $objectType = $control.GetType().Name
        if ($objectType -like "CheckBox"){
            $control.checked = $false
        }
    }
}

function SendMessage { 
    foreach ($Groupbox in $Form.controls) {
        $objectType = $Groupbox.GetType().Name       
        if ($objectType -like "Groupbox"){         
            foreach ($server in $Groupbox.controls) { 
                if ($server.Checked -eq $true){
                    $Name = ($server.text).Trim()
                    #write-host $Name
                    $PathMsg = 'c:\windows\system32\'
                    Invoke-Expression ($PathMsg + 'msg * /server:$Name $TextBox2.Text')
                    #$Servers += $server.text + ','
                }
            }
        }   
    }
}        
     
function RebootComp {
    $Form.TopMost = $false
    $Form.Hide()
    $Creds = Get-Credential -Message "Введите учётные данные для перезагрузки серверов" -UserName "TK\"
    $Form.Show()
    $Form.TopMost = $true
    if (-not $Creds) { return }
    
    $delaySec = 0
    if (-not [string]::IsNullOrWhiteSpace($TextBox1.Text)) { [int]::TryParse($TextBox1.Text.Trim(), [ref]$delaySec) | Out-Null }
    
    $arraySrvList = [System.Collections.ArrayList]@()
    foreach ($Groupbox in $Form.controls) {
        $objectType = $Groupbox.GetType().Name
        if ($objectType -like "GroupBox") {
            foreach ($server in $Groupbox.controls) {
                if ($server.Checked -eq $true) {
                    $Name = ($server.text).Trim()
                    if ($Name -and $Name -ne $env:COMPUTERNAME) { 
                        [void]$arraySrvList.Add($Name)
                    }
                    elseif ($Name -eq $env:COMPUTERNAME) {
                        Show-MessageBoxTopMost "Пропуск текущего компьютера ($env:COMPUTERNAME).`nПерезагрузка его, завершит работу скрипта." "Внимание" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Warning)
                    }
                }
            }
        }
    }
    if ($arraySrvList.Count -eq 0) {
        Show-MessageBoxTopMost "Не выбрано ни одного сервера для перезагрузки." "Ошибка" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }
    $Button2.Enabled = $false
    [System.Windows.Forms.Application]::DoEvents()
    
    if ($delaySec -gt 0) {
        $Form.TopMost = $false
        $Form.Hide()
        $progressCompleted = Show-ProgressBar-DelaySec -param $delaySec
        $Form.Show()
        $Form.TopMost = $true
        if (-not $progressCompleted) {
            $Button2.Enabled = $true
            return
        }
    }

    $arraySrvError = [System.Collections.ArrayList]@()
    foreach ($Name in $arraySrvList) {
        try {
            Restart-Computer -ComputerName $Name -Force -Credential $Creds -ErrorAction Stop
        }
        catch { 
            [void]$arraySrvError.Add($Name)
        }
        [System.Windows.Forms.Application]::DoEvents()
    }
    $Button2.Enabled = $true
    if ($arraySrvError) {
        if ($arraySrvError.Count -eq 1) {
            Show-MessageBoxTopMost "Команда перезагрузки отправлена.`nНо сервер не был перезапущен.`n`n$($arraySrvError|Out-String)" "Готово" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Information)
            $arraySrvError.Clear()
        }
        else  {
            Show-MessageBoxTopMost "Команды перезагрузки отправлены.`nСписок серверов, которые не были перезапущены.`n`n$($arraySrvError|Out-String) " "Готово" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Information)
            $arraySrvError.Clear()
        }
    }
    else {
        if ($arraySrvList.Count -eq 1) {
            Show-MessageBoxTopMost "Команда перезагрузки отправлена." "Готово" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Information)
            $arraySrvList.Clear()
        }
        else {
            Show-MessageBoxTopMost "Команды перезагрузки отправлены." "Готово" ([System.Windows.Forms.MessageBoxButtons]::OK) ([System.Windows.Forms.MessageBoxIcon]::Information)
            $arraySrvList.Clear()
        }
    }
}        

$CheckBoxAll1.Add_CheckStateChanged({if($CheckBoxAll1.Checked){clkSelectAll -param $Groupbox1.controls} else {clkUnSelectALL -param $Groupbox1.controls}})
 
$CheckBoxAll2.Add_CheckStateChanged({if($CheckBoxAll2.Checked){clkSelectAll -param $Groupbox2.controls} else {clkUnSelectALL -param $Groupbox2.controls}})
 
$CheckBoxAll3.Add_CheckStateChanged({if($CheckBoxAll3.Checked){clkSelectAll -param $Groupbox3.controls} else {clkUnSelectALL -param $Groupbox3.controls}})
 
$CheckBoxAll4.Add_CheckStateChanged({if($CheckBoxAll4.Checked){clkSelectAll -param $Groupbox4.controls} else {clkUnSelectALL -param $Groupbox4.controls}})
 
$CheckBoxAll5.Add_CheckStateChanged({if($CheckBoxAll5.Checked){clkSelectAll -param $Groupbox5.controls} else {clkUnSelectALL -param $Groupbox5.controls}})
 
$Button1.add_click({
    $result = Show-MessageBoxTopMost "Подтвердите действие" "Подтверждение" ([System.Windows.Forms.MessageBoxButtons]::OKCancel) ([System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        SendMessage
    }
})

$Button2.add_click({
    $result = Show-MessageBoxTopMost "Подтвердите действие" "Подтверждение" ([System.Windows.Forms.MessageBoxButtons]::OKCancel) ([System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        RebootComp
    }
})
 
$Form.ShowDialog()|Out-null
