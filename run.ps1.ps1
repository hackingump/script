
# Rename drivers
Rename-Item -Path "C:\Windows\system32\drivers\VBoxGuest.sys" -NewName "HolyGuest.sys"
Rename-Item -Path "C:\Windows\system32\drivers\VBoxMouse.sys" -NewName "HolyMouse.sys"
Rename-Item -Path "C:\Windows\system32\drivers\VBoxSF.sys" -NewName "HolySF.sys"
Rename-Item -Path "C:\Windows\system32\drivers\VBoxVideo.sys" -NewName "HolyVideos.sys"

# Remove system files
Rename-Item -Path "C:\Windows\system32\vboxdisp.dll" -NewName "a.dll"
Rename-Item -Path "C:\Windows\system32\vboxhook.dll" -NewName "b.dll"
Rename-Item -Path "C:\Windows\system32\vboxmrxnp.dll" -NewName "c.dll"
Rename-Item -Path "C:\Windows\system32\vboxogl.dll" -NewName "d.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglarrayspu.dll" -NewName "e.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglcrutil.dll" -NewName "f.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglerrorspu.dll" -NewName "g.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglfeedbackspu.dll" -NewName "h.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglpackspu.dll" -NewName "i.dll"
Rename-Item -Path "C:\Windows\system32\vboxoglpassthroughspu.dll" -NewName "j.dll"
Rename-Item -Path "C:\Windows\system32\vboxservice.exe" -NewName "k.dll"
Rename-Item -Path "C:\Windows\system32\vboxtray.exe" -NewName "l.dll"
Rename-Item -Path "C:\Windows\system32\vboxcontrol.exe" -NewName "m.dll"

# Remove guest additions folder
Remove-Item -Force -Recurse -Confirm:$false "C:\program files\oracle\"

# Remove registry keys
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\HARDWARE\ACPI\DSDT\VBOX__"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\HARDWARE\ACPI\FADT\VBOX__"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\HARDWARE\ACPI\RSDT\VBOX__"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SYSTEM\ControlSet001\Services\VBoxGuest"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SYSTEM\ControlSet001\Services\VBoxMouse"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SYSTEM\ControlSet001\Services\VBoxService"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SYSTEM\ControlSet001\Services\VBoxSf"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SYSTEM\ControlSet001\Services\VBoxVideo"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\SOFTWARE\Oracle"
Remove-Item -Force -Recurse -Confirm:$false "HKLM:\HARDWARE\ACPI\RSDT\VBOX__"
# Rename Bios version values
Set-ItemProperty -Force -Confirm:$false -Path "HKLM:\HARDWARE\DESCRIPTION\System" -Name "SystemBiosVersion" -Value "NoneOfYourBusiness"
Set-ItemProperty -Force -Confirm:$false -Path "HKLM:\HARDWARE\DESCRIPTION\System" -Name "VideoBiosVersion" -Value "NoneOfYourBusiness"
Set-ItemProperty -Force -Confirm:$false -Path "HKLM:\HARDWARE\DESCRIPTION\System" -Name "SystemBiosDate" -Value "06/23/19"

# Stop vbox processes, this has to be done at the end when vbox api access is not needed anymore
Stop-Process -Force -Confirm:$false -Name "VBoxTray"
Stop-Process -Force -Confirm:$false -Name "VBoxService"

Start-Sleep -s 10

Start-Process "cmd.exe /c axio.exe"


