;NSIS Modern User Interface
;Basic Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;define
  !define SRCDIR "C:\Users\deogracia\Desktop\creation de jeux\NES\famitracker-setup\src"
  
  !define VERSION "0.4.6"
  
  !define PRODUCTNAME "FamiTracker"
  
;--------------------------------
;General

  ;Name and file
  Name "${PRODUCTNAME} - ${VERSION}"
  OutFile "output\${PRODUCTNAME}_${VERSION}-setup.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\${PRODUCTNAME}"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\${PRODUCTNAME}" "InstallDir"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "${SRCDIR}\gpl-3.0.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "French"
  
;--------------------------------
;Installer Sections

Section "Required" SecRequired

  SectionIn RO
  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File "${SRCDIR}\${PRODUCTNAME}.chm"
  File "${SRCDIR}\${PRODUCTNAME}.exe"
  File "${SRCDIR}\gpl-3.0.txt"
  File "${SRCDIR}\readme.txt"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\${PRODUCTNAME}" "InstallDir" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

Section "Demo Songs" SecDemoSongs
  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "${SRCDIR}\Demo songs"
  
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecRequired ${LANG_ENGLISH} "Required Files."
  LangString DESC_SecRequired ${LANG_FRENCH}  "Fichiers obligatoires."
  LangString DESC_SecDemoSongs ${LANG_ENGLISH} "Demo songs."
  LangString DESC_SecDemoSongs ${LANG_FRENCH}  "Chansons de demosntrations."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecRequired}  $(DESC_SecRequired)
	!insertmacro MUI_DESCRIPTION_TEXT ${SecDemoSongs} $(DESC_SecDemoSongs)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete "$INSTDIR\${PRODUCTNAME}.chm"
  Delete "$INSTDIR\${PRODUCTNAME}.exe"
  Delete "$INSTDIR\gpl-3.0.txt"
  Delete "$INSTDIR\readme.txt"
  Delete "$INSTDIR\Uninstall.exe"

  RMdir /r "$INSTDIR\Demo songs"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\${PRODUCTNAME}"

SectionEnd