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
![image](https://user-images.githubusercontent.com/76235377/236335146-3368dd80-6461-4ec2-9221-2045f1684d95.png)
![image](https://user-images.githubusercontent.com/76235377/236335862-93ba278c-2e16-439a-b85c-66fc7c63fdb5.png)

If the script is unable to identify the current Flutter version, it will display an error message.                                             
![image](https://user-images.githubusercontent.com/76235377/236335995-d86874ee-b73f-4346-a8cc-5ba38f6ddac5.png)

If you choose a version that is already the current version, the script will display a warning message.                            
![image](https://user-images.githubusercontent.com/76235377/236334718-590ba1ef-198b-4d73-8e2d-a8ea1f1aff96.png)

If you choose a different version, the script will move the current version's directory to a backup directory and move the selected version's directory  to the default directory.                                                                                                
![image](https://user-images.githubusercontent.com/76235377/236336467-2922305f-cc39-4745-9671-159db4c544a1.png)


After switching versions, the script will display the new version number.

## Directory
```
- flutter
  - common
    - flutter     // this is the location of the downloaded version
      - version
- flutter2.10.3
  - common
    - flutter     // this is the location of another downloaded version
      - version
- flutter3.7.11
  - common
    - flutter     // this is the location of another downloaded version
      - version
- flutter_version_manager.sh
```
