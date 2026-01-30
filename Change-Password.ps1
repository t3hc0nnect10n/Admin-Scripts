<#
	Made by t3hc0nnect10n (c) 2025
	Version 5.1

	Сценарий создаёт форму для смены пароля доменной учётной записи пользователя.

	Пароль должен отвечать требованиям сложности:
		
		- Состоять из латинских букв.
		- Иметь длину не менее 8 знаков.
		- Содержать знаки из четырех перечисленных ниже категорий:

			- Латинские заглавные буквы (от A до Z).
			- Латинские строчные буквы (от a до z).
			- Цифры (от 0 до 9).
			- Отличающиеся от букв и цифр знаки (например, !, $, #, %).

	Функции:

		1. Функция преобразования пароля.
		2. Функция проверки сложности нового пароля.
		3. Функция cмены пароля.

    Правки:
        
        2025-12-26 (5.1)
        - В функции Password-Change():             
            - добавлен обработчик ошибки
            - дабавлена функция Get-HResult()         - возвращает код ошибки, по которой определяется текст ошибки.
            - дабавлена функция Split-StringByWords() - разбивает текст ошибки для дружесмтвенного вывода в визуальной форме. 

#>

$Version = "5.1"

# Английский алфавит заглавных букв.
$Alphabet_Uppper = [char[]]([char]"A"..[char]"Z") -join " "

# Английский алфавит строчных букв.
$Alphabet_Lower  = [char[]]([char]"a"..[char]"z") -join " "

# Цифры.
$Integer         = [char[]]([char]"0"..[char]"9") -join " "

# Специальные символы.
$Symbol = [char]33+" "+[char]34+" "+[char]35+" "+[char]36+" "+[char]37+" "+[char]38+" "+[char]39+" "+[char]40+" "+[char]41+" "+[char]42+" "+`
          [char]43+" "+[char]44+" "+[char]45+" "+[char]46+" "+[char]47+" "+[char]58+" "+[char]59+" "+[char]60+" "+[char]61+" "+[char]62+" "+`
          [char]63+" "+[char]64+" "+[char]91+" "+[char]92+" "+[char]93+" "+[char]124+" "+[char]94+" "+[char]123+" "+[char]125+" "+[char]126

# Добавляем класс пользовательского интерфейса. https://learn.microsoft.com/ru-ru/dotnet/desktop/winforms/overview/
Add-Type -AssemblyName System.Windows.Forms

# Добавляем класс по работе с изображениями. https://learn.microsoft.com/ru-ru/dotnet/api/system.windows.media.drawing?view=windowsdesktop-8.0
Add-Type -AssemblyName System.Drawing

# Добавляем класс пространства имён. https://learn.microsoft.com/ru-ru/dotnet/api/system.directoryservices.accountmanagement?view=netframework-4.8
Add-Type -AssemblyName System.DirectoryServices.AccountManagement

# функции для включения визуальных стилей для приложения. https://learn.microsoft.com/ru-ru/dotnet/api/system.windows.forms.application.enablevisualstyles?view=windowsdesktop-9.0
[System.Windows.Forms.Application]::EnableVisualStyles()
 
# Параметры формы.
$Form                  = New-Object system.Windows.Forms.Form
$Form.ClientSize       = New-Object System.Drawing.Point(420, 570)
$Form.text             = "Смена пароля. Версия $($Version)"
$Form.TopMost          = $True
$Form.BackColor        = [System.Drawing.ColorTranslator]::FromHtml("#8dbbf3")

# Полный путь к изображению.
$ImagePath             = "\\tk.local\SysVol\tk.local\Policies\{7E2CBF75-26A0-403F-BBEF-B3F82E645289}\User\logo_tradicia_GK.png"

# Параметры изображения в форме.
$Image                 = [System.Drawing.Image]::FromFile($ImagePath)
$PictureBox            = New-Object System.Windows.Forms.PictureBox
$PictureBox.Size       = New-Object System.Drawing.Size(200, 150)
$PictureBox.Location   = New-Object System.Drawing.Point(152, 20)
$PictureBox.Image      = $Image

# Параметры текста в форме.
$Label_                = New-Object system.Windows.Forms.Label
$Label_.text           = "Новый пароль должен отвечать требованиям сложности.`n" +`
                         "Не содержать имени учётной записи.`n" +`
                         "Иметь длину не менее 10 знаков.`n" +`
                         "Содержать знаки из четырёх перечисленных ниже категорий:`n" +`
                         "`n1. Латинские заглавные буквы:`n" +`
                         "     $($Alphabet_Uppper)`n" +`
                         "`n2. Латинские строчные буквы:`n" +`
                         "     $($Alphabet_Lower)`n" +`
                         "`n3. Цифры:`n" +`
                         "     $($Integer)`n" +`
                         "`n4. Специальные символы:`n" +`
                         "      $($Symbol)"
$Label_.AutoSize       = $True
$Label_.location       = New-Object System.Drawing.Point(10, 70)
$Label_.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Параметры текста в форме.
$Label1                = New-Object system.Windows.Forms.Label
$Label1.text           = "Введите cтарый пароль"
$Label1.AutoSize       = $True
$Label1.location       = New-Object System.Drawing.Point(10, 320)
$Label1.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

# Параметры окна для пользовательского ввода старого пароля.
$TextBox1              = New-Object system.Windows.Forms.MaskedTextBox
$TextBox1.AutoSize     = $True
$TextBox1.PasswordChar = '*'
$TextBox1.width        = 400
$TextBox1.height       = 25
$TextBox1.location     = New-Object System.Drawing.Point(10, 340)
$TextBox1.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Параметры текста в форме.
$Label2                = New-Object system.Windows.Forms.Label
$Label2.text           = "Введите новый пароль"
$Label2.AutoSize       = $True
$Label2.location       = New-Object System.Drawing.Point(10, 370)
$Label2.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

# Параметры окна для пользовательского ввода старого пароля.
$TextBox2              = New-Object system.Windows.Forms.MaskedTextBox
$TextBox2.AutoSize     = $True
$TextBox2.PasswordChar = '*'
$TextBox2.width        = 400
$TextBox2.height       = 25
$TextBox2.location     = New-Object System.Drawing.Point(10, 390)
$TextBox2.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Параметры текста в форме.
$Label3                = New-Object system.Windows.Forms.Label
$Label3.text           = "Повторите новый пароль"
$Label3.AutoSize       = $True
$Label3.location       = New-Object System.Drawing.Point(10, 420)
$Label3.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

# Параметры окна для пользовательского ввода старого пароля.
$TextBox3              = New-Object system.Windows.Forms.MaskedTextBox
$TextBox3.AutoSize     = $True
$TextBox3.PasswordChar = '*'
$TextBox3.width        = 400
$TextBox3.height       = 25
$TextBox3.location     = New-Object System.Drawing.Point(10, 440)
$TextBox3.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Параметры уведомления в форме в виде красного крестика.
$StatusLabel0           = New-Object System.Windows.Forms.Label
$StatusLabel0.AutoSize  = $True
$StatusLabel0.Location  = New-Object System.Drawing.Point(10, 525)
$StatusLabel0.Size      = New-Object System.Drawing.Size(235, 250)
$StatusLabel0.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold)) 
$StatusLabel0.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#FFDC143C") # Crimson

# Параметры уведомления в форме о несоответствии с установленными требованиями к смене пароля.
$StatusLabel1           = New-Object System.Windows.Forms.Label
$StatusLabel1.AutoSize  = $True
$StatusLabel1.Location  = New-Object System.Drawing.Point(30, 525)
$StatusLabel1.Size      = New-Object System.Drawing.Size(235, 250)
$StatusLabel1.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

# Параметры уведомления в форме об успешной смене пароля.
$StatusLabel2           = New-Object System.Windows.Forms.Label
$StatusLabel2.AutoSize  = $True
$StatusLabel2.Location  = New-Object System.Drawing.Point(110, 390)
$StatusLabel2.Size      = New-Object System.Drawing.Size(235, 250)
$StatusLabel2.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$StatusLabel2.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("#FF228B22") # ForestGreen

# Параметры активной кнопки в форме.
$Button                = New-Object System.Windows.Forms.Button
$Button.Text           = "OK"
$Button.AutoSize       = $True
$Button.Location       = New-Object System.Drawing.Point(175, 480)
$Button.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',14)
$Button.BackColor      = [System.Drawing.ColorTranslator]::FromHtml("#FFE6E6FA") # Lavender

# Добавление в форму установленных параметров.
$Form.Controls.AddRange(@($Label_, $Label1, $Label2, $Label3, $TextBox1, $TextBox2, $TextBox3, $StatusLabel0, $StatusLabel1, $StatusLabel2, $Button, $PictureBox))

# Функция преобразования пароля.
function ConvertTo-UnsecureString() {
    param(
        [SecureString]$secStr
    )
    
    try {
        $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secStr)
    
        return [Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    }
    finally {
       
        # Очищаем неуправляемую память по завершению.
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)

        Clear-Variable -Name "BSTR"
    }
}

# Функция проверки сложности нового пароля.
function Password-Check(){
    [CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		$Password
    )

    while($true) {
        
        # Проверка отсутствие русских букв в пароле.
        if ((ConvertTo-UnsecureString $Password) -cmatch "[а-яА-Я]") {                       
            
            Clear-Variable -Name "Password"
            return "RusНовый пароль не должен состоять из русских букв"
            break
        }
        else {
            
            $Flag_Length = $true
        }
        
        # Проверка наличия длина пароля.
        if($Flag_Length) {
            
            $Flag_Length = $false
            
            if ((ConvertTo-UnsecureString $Password).Length -ge 10) {       
            
                $Flag_Upper = $true
            }
            else {
                
                Clear-Variable -Name "Password"
                return "LengthМинимальная длина нового пароля должна`nсостовлять 8 знаков"        
                break
            }
        }

        # Проверка наличия заглавных английских букв в пароле. 
        if ($Flag_Upper) {
            
            $Flag_Upper = $false

            if ((ConvertTo-UnsecureString $Password) -cmatch "[A-Z\p{Lu}\s]") {                       
            
                $Flag_Lower = $true
            }
            else {    
                       
                Clear-Variable -Name "Password"
                return "UpperНовый пароль должен иметь заглавную букву"
                break
            }                
        }

        # Проверка наличия строчных английских букв в пароле.
        if ($Flag_Lower) {
            
            $Flag_Lower = $false

            if ((ConvertTo-UnsecureString $Password) -cmatch "[a-z\p{Ll}\s]") {                       
               
                $Flag_Integer = $true
            }
            else {                
                
                Clear-Variable -Name "Password"
                return "LowerНовый пароль должен иметь строчную букву"
                break
            }                
        }

        # Проверка наличия цифр в пароле.
        if ($Flag_Integer) {
            
            $Flag_Integer = $false
            
            if ((ConvertTo-UnsecureString $Password) -match "[\d]") {                       
             
                $Flag_Symbol = $true
            }
            else {
                       
                Clear-Variable -Name "Password"
                return "IntegerНовый пароль должен иметь цифры" 
                break
            }                
        }

        # Проверка наличия специальных символов в пароле.
        if ($Flag_Symbol) {
            
            $Flag_Symbol = $false
           
            if ((ConvertTo-UnsecureString $Password) -cmatch "[^\w]") {                       
                
                Clear-Variable -Name "Password"
                return $true        
                break
            }
            else {
                
                Clear-Variable -Name "Password"
                return "SymbolПароль должен иметь специальный символ"       
                break
            }                    
        }
    }
}

# Функция cмены пароля.
function Password-Change() {
    [CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		$OldPassworrd
		,
		[Parameter(Mandatory = $true)]
		$NewPassword
		,
		[Parameter(Mandatory = $true)]
		$RepeatPassword
    )
    
    # Получаем контекст текущего домена
    $Domain = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Domain)

    # Получаем текущего пользователя
    $User = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($Domain, $env:USERNAME)

    # Если новый пароль не равен паролю повторно введенного, то в интерфейсе программы появится ошибка.
    if ((ConvertTo-UnsecureString $NewPassword) -ne (ConvertTo-UnsecureString $RepeatPassword)) {
        
        # Устанавливаем текст ошибки.
        $StatusLabel0.Text = "❌"
        $StatusLabel1.Text = "Новые пароли не совпадают"

        # Очищаем переменные оn ранее полученных значений.
        Clear-Variable -Name "OldPassworrd" -ErrorAction SilentlyContinue
        Clear-Variable -Name "NewPassword" -ErrorAction SilentlyContinue
        Clear-Variable -Name "RepeatPassword" -ErrorAction SilentlyContinue
    }
    # Иначе
    else {
        
        # Попытка сменить пароль.
        try {
            
            # Если старый пароль седиржит русские буквы, то в интерфейсе программы появится ошибка.
            if ((ConvertTo-UnsecureString $OldPassworrd) -cmatch "[а-яА-Я]") {                       
                
                # Устанавливаем текст ошибки.
                $StatusLabel0.Text = "❌"
                $StatusLabel1.Text =  "Старый пароль введён на русском языке"
                
                # Очищаем переменные оn ранее полученных значений.
                Clear-Variable -Name "OldPassworrd" -ErrorAction SilentlyContinue
                Clear-Variable -Name "NewPassword" -ErrorAction SilentlyContinue
                Clear-Variable -Name "RepeatPassword" -ErrorAction SilentlyContinue
            }
            # Иначе.
            else {
                
                # Меняем пароль.
                $User.ChangePassword((ConvertTo-UnsecureString $OldPassworrd), (ConvertTo-UnsecureString $NewPassword))             

                # Удаляем в интерфейсе программы описание для ввода паролей.
                $Form.Controls.Remove($Label1)
                $Form.Controls.Remove($Label2)
                $Form.Controls.Remove($Label3)

                # Удаляем в интерфейсе программы параметры текста для ввода паролей.
                $Form.Controls.Remove($TextBox1)
                $Form.Controls.Remove($TextBox2)
                $Form.Controls.Remove($TextBox3)

                # Удаляем в интерфейсе программы параметры уведомления для ввода паролей.
                $Form.Controls.Remove($StatusLabel0)
                $Form.Controls.Remove($StatusLabel1)                

                # Устанавливаем текст по успешной смене пароля.
                $StatusLabel2.Text = "✅ Пароль успешно изменён"
                
                # Воспроизводим в интерфейсе изменения.
                [void]$Form.ShowDialog()          

                # Очищаем переменные оn ранее полученных значений.
                Clear-Variable -Name "OldPassworrd" -ErrorAction SilentlyContinue
                Clear-Variable -Name "NewPassword" -ErrorAction SilentlyContinue
                Clear-Variable -Name "RepeatPassword" -ErrorAction SilentlyContinue
            }
        }
        catch {
            
            function Get-HResult() {
                param($Exception)

                if ($Exception.Message -match '0x[0-9A-Fa-f]{8}') {
                    return $Matches[0]
                }
            }

            function Split-StringByWords() {
                [CmdletBinding()]
                param (
                    [Parameter(Mandatory = $true)]
                    [string]$Text
                    ,
                    [int]$MaxLength = 43
                )

                $result = @()
                $currentLine = ""

                foreach ($word in $Text -split '\s+') {

                    if ($currentLine.Length -eq 0) {
                        $currentLine = $word
                    }
                    elseif (($currentLine.Length + 1 + $word.Length) -le $MaxLength) {
                        $currentLine += " " + $word
                    }
                    else {
                        $result += $currentLine
                        $currentLine = $word
                    }
                }

                if ($currentLine) {
                    $result += $currentLine
                }

                return $result
            }

            $hr      = Get-HResult $_.Exception
            $default = ($_.Exception.Message).Split(":")[1].Split(".")[0].Replace("`"","")
    
            switch ($hr) {
                "0x80070056" { $msg = "Неверно введён старый пароль."                                          } # 0x80070056
                "0x8007052D" { $msg = "Пароль не соответствует политике сложности или совпадает с предыдущим." } # 0x8007052D
                "0x80070005" { $msg = "Недостаточно прав для смены пароля (отказано в доступе)."               } # 0x80070005
                "0x80070525" { $msg = "Указанная учетная запись не найдена."                                   } # 0x80070525
                "0x8007052E" { $msg = "Пароль или имя пользователя недействительны."                           } # 0x8007052E
                "0x80070775" { $msg = "Учетная запись заблокирована."                                          } # 0x80070775
                default      { $msg = "$($default)."                                                           } # default
            }

            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "$(Split-StringByWords -Text $msg)"

            # Очищаем переменные оn ранее полученных значений.
            Clear-Variable -Name "OldPassworrd" -ErrorAction SilentlyContinue
            Clear-Variable -Name "NewPassword" -ErrorAction SilentlyContinue
            Clear-Variable -Name "RepeatPassword" -ErrorAction SilentlyContinue
        }
    }    
}

# Исполняемый код при нажатии кнопки в форме.
$Button.add_click({

    # Очистка уведомления в интерфейсе программы.
    if ($StatusLabel0.Text) { $StatusLabel0.Text = "" }
    if ($StatusLabel1.Text) { $StatusLabel1.Text = "" }    
    if ($StatusLabel2.Text) { $StatusLabel2.Text = "" }
 
    # Если введен старый пароль.
    if ($TextBox1.Text | ConvertTo-SecureString -AsPlainText -Force -ErrorAction SilentlyContinue) {
        
        # Если введен новый пароль.
        if ($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force -ErrorAction SilentlyContinue) {
            
            $Flag_Check_Pass = $true
        }
        # Иначе.
        else {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "Не введён новый пароль"
        }
    }
    # Иначе.
    else {
        
        # Устанавливаем текст ошибки.
        $StatusLabel0.Text = "❌"
        $StatusLabel1.Text = "Не введён старый пароль"
    }
    
    # Проверка ввода надежного пароля.       
    if ($Flag_Check_Pass) {
        
        $Flag_Check_Pass = $false            
   
        if ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)) -like $true) {
            
            $Flag_Password_Change = $true           
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Rus")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = (Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Rus', '')          
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Length")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = (Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Length', '')  
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Upper")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "$((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Upper', ''))`n$($Alphabet_Uppper)"    
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Lower")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "$((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Lower', ''))`n$($Alphabet_Lower)"      
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Integer")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "$((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Integer', ''))`n$($Integer)"  
        }
        elseif ((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).StartsWith("Symbol")) {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "$((Password-Check -Password $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force)).Replace('Symbol', ''))`n$($Symbol)"   
        }     
    }

    # Установка нового пароля.
    if($Flag_Password_Change) {
        
        $Flag_Password_Change = $false

        # Если введён повторно новый пароль, то осуществляется проверка всех введённых паролей.
        if ($TextBox3.Text | ConvertTo-SecureString -AsPlainText -Force -ErrorAction SilentlyContinue) {

            Password-Change -OldPassworrd $($TextBox1.Text | ConvertTo-SecureString -AsPlainText -Force) -NewPassword $($TextBox2.Text | ConvertTo-SecureString -AsPlainText -Force) -RepeatPassword $($TextBox3.Text | ConvertTo-SecureString -AsPlainText -Force)
        }
        # Иначе.
        else {
            
            # Устанавливаем текст ошибки.
            $StatusLabel0.Text = "❌"
            $StatusLabel1.Text = "Не введён повторно новый пароль"
        }
     }

    # Очистка формы старого пароля.
    if ($TextBox1.Text) { $TextBox1.Text = "" }

    # Очистка формы нового пароля.
    if ($TextBox2.Text) { $TextBox2.Text = "" }

    # Очистка формы повторно введенного нового пароля.
    if ($TextBox3.Text) { $TextBox3.Text = "" }
})

# Воспроизводим программу.
[void]$Form.ShowDialog()
