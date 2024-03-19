# WIM-Avast

## En - Table of Contents
1. [Update Avast](#en-update)
2. [Create WIM](#en-WIM)
3. [2 in 1](#en-2in1)
4. [Additional Notes](#en-additional-notes)

## Fr - Table des matières
1. [Mise à jour Avast](#fr-update)
2. [Création WIM](#fr-WIM)
3. [2 en 1](#fr-2in1)
4. [Notes additionnelles](#fr-additional-notes)

# EN WIM-Avast

### Description
***
The WIM-Avast repository makes it easy to create Avast image with the last VPS database.

### Utilization
***
Utilizing the tools provided in this repository is designed to be intuitive and straightforward. Follow the steps below to use it.  
  
You need to use [7-Zip](https://www.7-zip.org/download.html) to extract the RESCUE folder from `RESCUE.7z.001` which is located in Files folder.
Alternatively, you can copy the RESCUE folder from an [Avast RESCUE Disk](https://support.avast.com/fr-fr/article/antivirus-rescue-disk-scan/#pc). The RESCUE folder is located at the root of the disk.

### Update Avast
<a name="en-update"></a>
***
`AvastUpdate.ps1` works like : 
* Create a registry file who contains Avast keys
* Import this registry file
* Start `.\Files\RESCUE\ASWPEANTIVIRUS.exe` with Update argument
* Remove the registry key created

To run the `AvastUpdate.ps1` script :
1. [Run PowerShell as Administrator]
2. [Navigate to the directory containing the repository files.]
3. [Execute the `AvastUpdate.ps1`]

```powershell
.\AvastUpdate.ps1
ASW DEFS : 24031400 - Before Update
ASW DEFS : 24031900 - After Update
```

### Create WIM
<a name="en-WIM"></a>
***
`WIM-Avast.ps1` permit to create a new WIM image from Windows ADK PE.  
You need to [install Windows ADK PE](https://learn.microsoft.com/fr-fr/windows-hardware/get-started/adk-install).  
It works like : 
* Copying ADK PE amd64 WIM image
* Mount this image
* Copying files
* Editing Registry of the PE mounted image
* Saving change

To run the `WIM-Avast.ps1` script :
1. [Run PowerShell as Administrator]
2. [Navigate to the directory containing the repository files.]
3. [Execute the `WIM-Avast.ps1`]

### 2 in 1
<a name="en-2in1"></a>
***
`2in1.ps1`  
Run `AvastUpdate.ps1` first and then `WIM-Avast.ps1`.

To run the `2in1.ps1` script :
1. [Run PowerShell as Administrator]
2. [Navigate to the directory containing the repository files.]
3. [Execute the `2in1.ps1`]

### Additional Notes
<a name="en-additional-notes"></a>
***
* **Administrative Privileges**: Make sure you have administrative privileges when running script.
* **Windows ADK PE**: You need to install Windows ADK PE before running `WIM-Avast.ps1` or `AvastUpdate.ps1`.
* **Compatibility**: This tool is designed to work with Windows Imaging Format (WIM) files.
* **Dependencies**: Ensure that your system meets the necessary dependencies for running PowerShell scripts.
* **7-Zip**: If you don't want to download an Avast RESCUE Disk, make sure you have [7-zip](https://www.7-zip.org/download.html) or similar software installed.
* **AvastPE Browser**: This application does not work.

# FR WIM-Avast

### Description
***
WIM-Avast facilite la création d'image Avast avec la dernière mise à jour de la base de données VPS.

### Utilisation
***
Les outils fournis dans ce dépôt sont conçus pour être intuitifs et simples. Suivez les étapes ci-dessous pour l'utiliser.  
  
Vous devez utiliser [7-zip](https://www.7-zip.org/download.html) pour extraire le dossier RESCUE depuis `RESCUE.7z.001` qui se trouve dans le dossier Files.
Sinon vous pouvez copier le dossier RESCUE à partir d'un [Avast RESCUE Disk](https://support.avast.com/fr-fr/article/antivirus-rescue-disk-scan/#pc). Le dossier RESCUE se trouve à la racine du disque.

### Mise à jour Avast
<a name="fr-update"></a>
***
`AvastUpdate.ps1` fonctionne tel que :
* Créer un fichier registre qui contient les clés Avast
* Importe ce fichier registre
* Exécute `.\Files\RESCUE\ASWPEANTIVIRUS.exe` avec les arguments de mises à jour.
* Supprime les clés de registre ajoutées.

Pour exécuter `AvastUpdate.ps1` :
1. [Lancer PowerShell en tant qu'Administrateur]
2. [Naviguez jusqu'au dossier contenant les fichiers du dépôt.]
3. [Exécutez le script `AvastUpdate.ps1`]

```powershell
.\AvastUpdate.ps1
ASW DEFS : 24031400 - Before Update
ASW DEFS : 24031900 - After Update
```

### Création WIM
<a name="fr-WIM"></a>
***
`WIM-Avast.ps1` permet de créer une nouvelle image WIM depuis Windows ADK PE.  
Vous devez [installer Windows ADK PE](https://learn.microsoft.com/fr-fr/windows-hardware/get-started/adk-install).  
Cela fonctionne tel que :
* Copie de l'image WIM ADK PE amd64
* Monter l'image
* Copie des fichiers
* Modification du registre de l'image montée
* Sauvegarder les changements

Pour exécuter `WIM-Avast.ps1` :
1. [Lancer PowerShell en tant qu'Administrateur]
2. [Naviguez jusqu'au dossier contenant les fichiers du dépôt.]
3. [Exécutez le script `WIM-Avast.ps1`]

### 2 en 1
<a name="fr-2in1"></a>
***
`2in1.ps1`  
Exécute `AvastUpdate.ps1` en premier et ensuite `WIM-Avast.ps1`

Pour exécuter `2in1.ps1` :
1. [Lancer PowerShell en tant qu'Administrateur]
2. [Naviguez jusqu'au dossier contenant les fichiers du dépôt.]
3. [Exécutez le script `2in1.ps1`]

### Notes additionnelles
<a name="fr-additional-notes"></a>
***
* **Privilèges Administrateur**: Assurez-vous d'avoir les privilèges Administrateur quand vous exécutez le script.
* **Windows ADK PE**: Assurez-vous d'avoir installé Windows ADK PE avant d'exécuter `WIM-Avast.ps1` ou `2in1.ps1`.
* **Compatibilité**: L'outil est conçu pour fonctionner avec les fichiers Windows Imaging Format (WIM).
* **Dépendances**: Assurez-vous que votre système répond aux dépendances nécessaires pour exécuter des scripts PowerShell.
* **7-Zip**: Si vous ne souhaitez pas télécharger un Avast RESCUE Disk, assurez-vous d'avoir installé [7-zip](https://www.7-zip.org/download.html) ou un logiciel similaire.
* **AvastPE Browser**: Cette application ne fonctionne pas.