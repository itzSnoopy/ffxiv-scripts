# This script will continue running until you press CTRL+Z or close this window. Preventing AFK status on FFXIV, Microsoft Teams or other software.
# Intended to work with Powershell 5, this script is given as is

# How does this work?
# This script sends a "Key Press" of your choice every random amount of seconds.
# The key sent is different depending if the time waiting is EVEN or ODD.

# Enter your selected Keys
$keyWhenEven = "F1"
$keyWhenOdd = "Q"

# Enter your preferred time intervals
$startupTime = 3           # Time for the script to start, should be enough to switch your desired program to active windows before going AFK

$intervalMax = 240         # Maximum random amount of time to wait between key presses in seconds
$intervalMin = 60          # Minimum random amount of time to wait between key presses in seconds



# --------------------------------------------
# Execution code below, modify at your own risk
# --------------------------------------------

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