﻿# PowerShell Robocopy script with e-mail notification

# Change these values
$SourceFolder = "C:\SourceFolder"
$DestinationFolder = "C:\DestinationFolder"
$Logfile = "C:\Robocopy.log"


# Copy Folder with Robocopy
Robocopy $SourceFolder $DestinationFolder /E /ZB /R:1 /W:1 /PURGE /LOG:$Logfile /NP

