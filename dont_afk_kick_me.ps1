# --------------------------------------------
# Disclaimer
# --------------------------------------------
# FFXIV does not support the usage of 3RD party tools. As such, you may get banned or tagged as a BOT.
# Use this at your own risk and with responsability.
# This is meant for small breaks that would otherwise afk kick you, not to forever AFK Emote in LIMSA.


# --------------------------------------------
# Purpose
# --------------------------------------------
# This script will continue running until you press CTRL+Z or close this window. Preventing AFK status on FFXIV or other software.
# Intended to work with Powershell 5, this script is given as is


# --------------------------------------------
# Configuration
# --------------------------------------------

# Enter your selected Keys, more about supported keys: https://ss64.com/vb/sendkeys.html
$keyWhenEven = "F1"
$keyWhenOdd = "X"

# Enter your preferred time intervals
$startupTime = 3           # Time for the script to start, should be enough to switch your desired program to active windows before going AFK

$intervalMax = 1200        # Maximum random amount of time to wait between key presses in seconds
$intervalMin = 600         # Minimum random amount of time to wait between key presses in seconds

# --------------------------------------------
# HOW-TO
# --------------------------------------------
# How to run without modifying permissions/manually?
#
# 1. Open Powershell ISE
# 2. Copy the contents of this file to the white editable text box
# 3. Press F5 to run this script
# 4. To stop this manually
#           press CTRL+Z OR
#           press the RED SQUARE BUTTON on the menu OR
#           close the window


# How does this work?
# This script sends a "Key Press" of your choice every random amount of seconds.
# The key sent is different depending if the time waiting is EVEN or ODD.

# --------------------------------------------
# Execution code below, modify at your own risk
# --------------------------------------------
# disclaimer: im not a powershell buff, so while not optimal it is functional

$curDate = Get-Date -Format "yy/MM/dd HH:mm"
$myshell = New-Object -Com "Wscript.Shell"


Write-Output "$curDate || Starting script in $startupTime second(s)"
Start-Sleep $startupTime

while($true){

    $curDate = Get-Date -Format "yy/MM/dd HH:mm"
    $timeout = Get-Random -Maximum $intervalMax -Minimum $intervalMin

    if($timeout % 2 -eq 1){
        Write-Output "$curDate || Sending keypress: $keyWhenOdd"
        $myshell.sendKeys("{$keyWhenOdd}")
    } else {
        Write-Output "$curDate || Sending keypress: $keyWhenEven"
        $myshell.sendKeys("{$keyWhenEven}")

    }

    Write-Output "$curDate || Waiting for: $timeout second(s)"
    Start-Sleep -Seconds $timeout

}