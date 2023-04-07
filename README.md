# rake ш
Powershell script to search and report the drives and directories containing Chia plots below and above 90 GB\
Use this script to ensure all the uncompressed plots have been replotted. The outputs can be used in listing the folders in config.yaml of Chia and by plotsink.exe of Gugahorse farmer to move plots to free drives. Use leafblower.ps1 to delete uncompressed plots on demand.

just run ./rake.ps1

Sample output (truncated):

Searching for .plot files on drive C:\mount\JBD1C4R4\ ...\
Number of .plot files below 90 GB on drive C:\mount\JBD1C4R4\ 21\
Number of .plot files above or equal to 90 GB on drive C:\mount\JBD1C4R4\ 148\
Searching for .plot files on drive C:\mount\JBD1C3R4\ ...\
Number of .plot files below 90 GB on drive C:\mount\JBD1C3R4\ 36\
Number of .plot files above or equal to 90 GB on drive C:\mount\JBD1C3R4\ 136\
Searching for .plot files on drive D:\ ...\
Number of .plot files below 90 GB on drive D:\ 1\
Number of .plot files above or equal to 90 GB on drive D:\ 0\
Searching for .plot files on drive C:\mount\JBD2C3R4\ ...\
Number of .plot files below 90 GB on drive C:\mount\JBD2C3R4\ 215\
Number of .plot files above or equal to 90 GB on drive C:\mount\JBD2C3R4\ 0\
Searching for .plot files on drive \\?\Volume{69fa8140-a6cc-4e89-adfa-c60dd4202e69}\ ...\
Access denied or unable to search on drive \\?\Volume{69fa8140-a6cc-4e89-adfa-c60dd4202e69}\. Skipping this drive.\
Searching for .plot files on drive E:\ ...\
Number of .plot files below 90 GB on drive E:\ 0\
Number of .plot files above or equal to 90 GB on drive E:\ 0

Total number of .plot files below 90 GB found on all drives 7940\
Total number of .plot files above or equal to 90 GB found on all drives 5293\
Folders that contain files above 90 GB:\
C:\mount\JBD1C4R3\Farm ^\
C:\mount\JBD1C4R3\Farmpool ^\
C:\mount\JBD2C2R1\Farm ^\
C:\mount\JBD2C1R4\Farm ^\
C:\mount\JBD2C1R4\Farmpool ^\
C:\mount\JBD2C1R3\Farm ^\
C:\mount\JBD2C4R1\Farm ^\
C:\mount\JBD3C4R5\Farm ^

Directories containing .plot files. Add these in config.yaml\
  plot_directories:
  - R:\Farm\
  - C:\mount\JBD1C4R1\Farm\
  - G:\Farm\
  - J:\Farm\
  - M:\Farm\
  - N:\Farmpool\
  - Q:\Farm\
  - C:\mount\JBD1C4R3\Farm\
  - C:\mount\JBD1C4R3\Farmpool
  - S:\Farm\
  - T:\Farm\
  - C:\mount\JBD2C2R1\Farm\
  - C:\mount\JBD2C1R4\Farm\
  - C:\mount\JBD2C1R4\Farmpool
