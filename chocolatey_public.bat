chcp 65001

echo.
echo このバッチは必ず管理者権限で実行してください。
echo.
echo Chocolateyのインストールを行います。
echo.

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo.
echo Chocolateyのバージョン確認を行います。
echo.

chocolatey -v

echo.
echo 各ソフトウェアのインストール処理を行います。
echo.

powershell -Command "Get-AppxPackage *spotify* | Remove-AppxPackage"

choco install -y python3 --version=3.9.7
cinst -y 7zip.install googlechrome google-drive-file-stream bitwarden eartrumpet skype foxitreader powershell-core gsudo gcloudsdk microsoft-windows-terminal everything audacity jdk8 javaruntime audacity-lame directx handbrake aimp slack sublimetext3.app vlc gimp git mingw vscode vscode-python discord googlejapaneseinput bind-toolsonly scrcpy adb f.lux notepadplusplus.install bitwarden-cli line unifying blender vnc-viewer awscli etcher sdcard-formatter obs-studio hwmonitor cpu-z.install pandoc drawio firefox psping portqry voicemeeter-banana.install audio-router garmin-express speccy freefilesync mousewithoutborders adobe-creative-cloud equalizerapo llvm spotify

choco update all -y

code --install-extension yzhang.markdown-all-in-one
code --install-extension marp-team.marp-vscode
code --install-extension yzane.markdown-pdf
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension analytic-signal.preview-pdf
code --install-extension grapecity.gc-excelviewer
code --install-extension hediet.vscode-drawio


echo powershell-coreはpowershell ver7のことです。win10に標準でインストールされているpowershellはver5です。
echo.
echo Notepad++をメモ帳と置き換えします。

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"%ProgramFiles%\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f

echo CapsキーをCtrlに割り当てます

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t reg_binary /d 

echo.
echo Ctrl+Alt+Delキーでロックを解除する設定を無効化します。
echo.
echo ポリシーからDisableCADを削除します。
echo.

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v DisableCAD

netplwiz

echo ユーザーアカウントの設定ウィンドウが開くので、詳細設定タブ→セキュリティーで保護されたサインイン→ユーザーが必ず...のチェックを外してください。
pause

echo Windowsのロック画面を無効化します

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /f /v "NoLockScreen" /t reg_dword /d 1

echo.
echo Chocolateyを用いたソフトウェアのインストールを完了しました。
echo.

timeout 15