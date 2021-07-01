setlocal

mkdir programs
cd programs

IF NOT EXIST fiji-win64.zip curl -LJ0 https://downloads.imagej.net/fiji/latest/fiji-win64.zip --output fiji-win64.zip
tar -xf fiji-win64.zip
.\Fiji.app\Imagej-win64.exe --update add-update-site "ABBA (experimental) 2" https://biop.epfl.ch/Fiji-ABBA/
.\Fiji.app\Imagej-win64.exe --update add-update-site "BigDataViewer-Playground 2" https://biop.epfl.ch/Fiji-Bdv-Playground/
.\Fiji.app\Imagej-win64.exe --update update



IF NOT EXIST QuPath-0.2.3-Windows.msi curl -LJ0 https://github.com/qupath/qupath/releases/download/v0.2.3/QuPath-0.2.3-Windows.msi --output QuPath-0.2.3-Windows.msi
IF NOT EXIST biop-tools-2.0.8.jar curl -LJ0 https://github.com/BIOP/qupath-biop-extensions/releases/download/v2.0.8/biop-tools-2.0.8.jar --output biop-tools-2.0.8.jar
IF NOT EXIST WSI-Dependencies.zip curl -LJ0 https://github.com/BIOP/qupath-biop-extensions/releases/download/v2.0.8/WSI-Dependencies.zip --output WSI-Dependencies.zip
tar -xf WSI-Dependencies.zip
mkdir "QuPath Common Data"\extensions
move WSI-Dependencies "QuPath Common Data\extensions"
move  biop-tools-2.0.8.jar "QuPath Common Data\extensions"

IF NOT EXIST elastix-5.0.1-win64.zip curl -LJ0 https://github.com/SuperElastix/elastix/releases/download/5.0.1/elastix-5.0.1-win64.zip --output elastix-5.0.1-win64.zip
tar -xf elastix-5.0.1-win64.zip


IF NOT EXIST TestRegister.groovy curl -LJ0 https://gist.githubusercontent.com/NicoKiaru/b91f9f3f0069b765a49b5d4629a8b1c7/raw/571954a443d1e1f0597022f6c19f042aefbc0f5a/TestRegister.groovy --output TestRegister.groovy

IF NOT EXIST vc_redist.x64.exe curl -LJ0 https://aka.ms/vs/16/release/vc_redist.x64.exe --output vc_redist.x64.exe


:: In QuPath, go to Edit>Preferences, specify the location of the QuPath Common Data folder:

:: In Fiji:
::   Click `Help > Update… > Manage update sites
::   Tick the checkbox ABBA (experimental)
::   Click Close
::   Click Apply changes
::   Restart Fiji

:: Indicate elastix and transformix executable location in Fiji:
::    In Fiji, execute Plugins › BIOP › Set and Check Wrappers 
::    then indicate the proper location of executable files,

:: Run the TestRegister.groovy script in Fiji to test elastix functionality.