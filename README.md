# Computer Setup

## Windows Users

Before you begin check to make sure that you have the [most recent version of Windows 10](https://support.microsoft.com/en-us/help/4028685/windows-10-get-the-update).


### 1. Enable WSL Feature in Windows.

1. Right click on the start menu and click on Settings.
2. In the Search box, type `Turn Windows Features On Or Off` and click on the item that populates in the list.
3. A window will pop up with a list of folders with checkboxes next to them. Scroll down and check the box for `Windows Subsystem for Linux`.

This will install the needed files. Follow any directions that pop up and restart when asked. This page might not open after restart, so be sure to make note of the url or bookmark it.

### 2. Install the Ubuntu app from the Windows Store.

1. Click here to go to Microsoft store and install the [Ubuntu App](https://www.microsoft.com/en-us/store/p/ubuntu/9nblggh4msv6?activetab=pivot%3aoverviewtab)
1. Follow the on-screen prompts to install the app. 
1. When the app is ready, it will say Launch. Click Launch. This will start the Ubuntu installation. This installation only happens the first time the app is launched, as it's the actual Ubuntu OS installing and mounting to your Windows FS. Anytime you uninstall the app and reinstall it you will have to do this process again. Make sure to back up important data if you ever uninstall this app, as it is not preserved. 

### 3. Finish Installing the Ubuntu App.

1. It will ask you to enter a username. This will be the root / admin user for the Ubuntu FS. 
1. It will then ask you to enter and confirm a password. It's recommended it's not too long as you may have to type it a lot. Also note that it will protect your password by not displaying it to the screen when you type, but it is registering your key strokes.
1. Finally, the prompt will change and you will be on a command line. Type `pwd` to see where you currently are in the FS, you should be at `/home/<your username>`. This is the root level of your Ubuntu user.
1. Run this command to setup your system and install the default software utilities and applications
    ```
    bash <(curl -s https://raw.githubusercontent.com/codefellows/computer-setup/master/windows-setup.sh)
    ```
### 2. Install Visual Studio Code

VSCode is a code editor that comes with many helpful features to streamline your development process. It also comes with an integrated terminal, debugging capabilities, and a very helpful built-in source control UI.

VSCode is where you will doing the vast majority of your work. Since VSCode relies on a GUI, this will be installed on through Windows, not Ubuntu.

1. Vist [VSCode](https://code.visualstudio.com/?wt.mc_id=adw-brand&gclid=Cj0KCQjw5-TXBRCHARIsANLixNw00R2vbdqnzLml-GvzCgbyqmgcAb9kyRQsC5LAPVS6tuBDZ9ws9pgaAsiLEALw_wcB) to download VSCode.
1. Launch the installer and follow the onscreen prompts.
1. When you reach the section for `Additional tasks`, make sure every box is checked.
1. Click install and continue to follow and onscreen prompts.

Once you are done, you can open up a terminal (the Ubuntu App) and type `code` to open VSCode. This may or may not require a restart first. 

Notice how Ubuntu knows about a program that is installed on the Windows FS? This is because WSL is able to connect both PATHs together!

### Notes on VSCode

1. Remember that Windows and Windows programs cannot edit Ubuntu files. If you try, you may get a permission denied error or end up with a broken file. If you need to edit Ubuntu files, use Ubuntu's built in editor nano, or another Ubuntu command line editor.
1. When you open VSCode, you will likely see an error about it not being able to find Git. We will address that later on in this doc. 
1. VSCode comes with an integrated terminal. By default, it will use the Windows PowerShell program. Check out [this doc]() for more information on how to use WSL and Ubuntu inside of Windows PowerShell.
