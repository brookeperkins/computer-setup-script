# Computer Setup

## Windows Users

Before you begin check to make sure that you have the [most recent version of Windows 10](https://support.microsoft.com/en-us/help/4028685/windows-10-get-the-update).


#### 1. Enable WSL Feature in Windows.

1. Right click on the start menu and click on Settings.
2. In the Search box, type `Turn Windows Features On Or Off` and click on the item that populates in the list.
3. A window will pop up with a list of folders with checkboxes next to them. Scroll down and check the box for `Windows Subsystem for Linux`.

This will install the needed files. Follow any directions that pop up and restart when asked. This page might not open after restart, so be sure to make note of the url or bookmark it.

#### 2. Install and setup the Ubuntu app from the Windows Store.

1. Click here to go to Microsoft store and install the [Ubuntu App](https://www.microsoft.com/en-us/store/p/ubuntu/9nblggh4msv6?activetab=pivot%3aoverviewtab)
1. Follow the on-screen prompts to install the app. 
1. When the app is ready, it will say Launch. Click Launch. This will start the Ubuntu installation.
1. It will ask you to enter a username. This will be the root / admin user for the Ubuntu FS. **A good user name is a single word (no spaces) and all lowercase**
1. It will then ask you to enter and confirm a password. Note that it will protect your password by not displaying it to the screen when you type, but it is registering your key strokes.
1. Finally, the prompt will change and you will be on a command line. Type `pwd` to see where you currently are in the FS, you should be at `/home/<your username>`. This is the root level of your Ubuntu user.


## All Users

### 1. App installation and terminal setup

* Open up Terminal (Mac)/Ubuntu App (Windows)
* Run this command to setup your system and install the default software utilities and applications
  * This process can take > 1 hour ...
    ```
    bash <(curl -s https://raw.githubusercontent.com/codefellows/computer-setup/master/setup-brew.sh)
    ```

### 2. Install Visual Studio Code

VSCode is a code editor that comes with many helpful features to streamline your development process. It also comes with an integrated terminal, debugging capabilities, and a very helpful built-in source control UI.

VSCode is where you will doing the vast majority of your work. Since VSCode relies on a GUI, this will be installed on through Windows, not Ubuntu.

1. Vist [VSCode](https://code.visualstudio.com/?wt.mc_id=adw-brand&gclid=Cj0KCQjw5-TXBRCHARIsANLixNw00R2vbdqnzLml-GvzCgbyqmgcAb9kyRQsC5LAPVS6tuBDZ9ws9pgaAsiLEALw_wcB) to download VSCode.
1. Launch the installer and follow the onscreen prompts.
1. When you reach the section for `Additional tasks`, make sure every box is checked.
1. Click install and continue to follow and onscreen prompts.

Once you are done, you can open up Terminal (Mac)/Ubuntu App (Windows)and type `code` to open VSCode. This may or may not require a restart first. 

#### Notes on VSCode for Windows
