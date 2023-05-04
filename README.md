# flutter_version_manager

This script allows you to easily switch between different versions of Flutter on your machine. 

## Installation

Before using this script, make sure you have installed the desired Flutter versions on your machine and located their default directories. Place the version files in the same directory as the script. 

## Usage

To use the script, navigate to the directory containing the script and the version files in your terminal and run the following command: 

```
./flutter_version_manager
```

The script will prompt you to choose a version from the available options. Use the up and down arrow keys to navigate through the options and press enter to select a version. 

If you prefer, you can create an alias for the script in your bash profile to make it easier to use. 

## Notes

The script expects to find each Flutter version in a separate directory containing a file called `version` in the path "/common/flutter". If the `version` file is not found in a directory, that directory will not be included in the list of available versions.

If the script is unable to identify the current Flutter version, it will display an error message. 

If you choose a version that is already the current version, the script will display a warning message. 

If you choose a different version, the script will move the current version's directory to a backup directory and move the selected version's directory to the default directory. 

After switching versions, the script will display the new version number.

![image](https://user-images.githubusercontent.com/76235377/236335042-0f8a7494-92a5-4daa-b66e-9dc779b37f5f.png)
![image](https://user-images.githubusercontent.com/76235377/236334718-590ba1ef-198b-4d73-8e2d-a8ea1f1aff96.png)
![image](https://user-images.githubusercontent.com/76235377/236334818-df23065f-c863-4434-921d-c78933bf7912.png)

