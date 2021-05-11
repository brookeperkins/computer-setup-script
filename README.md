# Computer Setup

## Hardware (Computer) Requirements

You are required to supply your own laptop that meets the below requirements. Chromebooks are **not** suitable for this course, since you can’t directly control installed software. Many students use Macs. You are responsible for the upkeep and maintenance of your computer throughout the course. 

**At a minimum, your computer will need:**

* A 64-bit Operating System, like macOS, Ubuntu or Windows 10 Pro.
* To be fully up to date, with the latest version of its operating system and all security updates installed.
* At least 50GB of free space on the hard drive.
* At least 8GB of RAM. 16GB RAM strongly preferred.
* To be free of viruses, and in general working order.

## Windows Users

### 1) Install Git for Windows

<a href="http://msysgit.github.io/" target="_blank">Git for Windows</a> brings the full feature set of Git to Windows. (More on Git in a moment.) It also includes **Bash**, a popular Unix shell. Besides giving you the ability to talk to your computer by typing commands, it also lets you use Git in the command line, just like other Unix environments.

What's Git? It's a very popular **version control** system. Version control systems let programmers share and collaborate on code. With Git, multiple programmers can work on the same files, and Git keeps track of who made what changes, when. Git is usually used with a website, GitHub, that stores code (in "repositories") and lets programmers review and discuss changes before they are added. In short, Git makes everyone's lives easier.

To get started, download <a href="http://msysgit.github.io/" target="_blank">Git for Windows</a>. Once you click the "download" button, you'll see a list of download options.

Look closely at the first two filenames in the list. One says "32 bit", and the other says "64 bit". Those are the different versions for 32-bit and 64-bit Windows. Download the one for your system. If you don't know whether your version of Windows is 32- or 64-bit, <a href="http://windows.microsoft.com/en-us/windows/32-bit-and-64-bit-windows" target="_blank">find out</a>.

Once you get it downloaded, double-click the file to open the installer. It will guide you through several options; the defaults are just fine, so keep on clicking "Next" until it's done.

When it's done installing, use the Start Menu to launch Git Bash. **TIP:** search for and open "Git Bash", not "Git CMD" or "Git GUI". Then, pin it to your Start Menu so it's easy to find.

![](https://i.imgur.com/9CKUGs5.png)

After it's launched, you'll see something like this.

![](https://i.imgur.com/hyjvQkW.png)

Ignoring the welcome message and the git help, here's a quick break down of what you're seeing in the Terminal app.

| Component             | Description                            |
| --------------------- | -------------------------------------- |
| `Ryan Sobol`          | Name of your user account              |
| `PHOTON-PC`           | Name of your computer                  |
| `~` (home directory)  | Name of your working directory         |
| `$`                   | Prompt symbol                          |


Simply stated, a Unix shell works in a read-evaluate-print loop or **REPL**.

### 2. Install Node for windows.

[Download Node here](https://nodejs.org/en/download/)

After using the Windows installer in the above link, open a new GitBash terminal and run the following command: `node -v`. You should see some numbers like so: `v14.0.0`. The exact numbers will probably be different, but as long as you're getting numbers, you can count this as a success!

## Mac only

Run this command in the terminal. You'll need this for git to work.
```js
xcode-select --install
```

## Mac and Linux Users

### 1. App installation and terminal setup

* Open up Terminal (Mac)/Ubuntu App (Windows)
* Run this command to setup your system and install the default software utilities and applications
  * This process can take > 1 hour ...
    ```
    bash <(curl -s https://raw.githubusercontent.com/alchemycodelab/computer-setup-script/master/setup.sh)
    ```

## All Users

### 1. Configure Git

Like artists, programmers sign their work. Let's configure Git to sign your commits with your name and email address.
in
Make sure you sign up for an account at Github <a href="https://github.com" target="_blank">here</a>.

**WARNING:** Before running the following commands, **replace `YOUR FULL NAME` and `YOUR EMAIL ADDRESS` with the name and email from <a href="https://github.com/settings/profile" target="_blank">your GitHub account</a>.**

```
git config --global user.name 'YOUR FULL NAME'
git config --global user.email 'YOUR EMAIL ADDRESS'
```

The terminal does not send success messages, in order to double check that you have successfully assigned your username and email:

```
git config --list
```

Your terminal should output the following lines (**but with your email address you used on GitHub and your full name!**):

```
user.email='YOUR EMAIL ADDRESS'
user.name='YOUR FULL NAME'
```

### 2. Install Visual Studio Code

VSCode is a code editor that comes with many helpful features to streamline your development process. It also comes with an integrated terminal, debugging capabilities, and a very helpful built-in source control UI.

VSCode is where you will doing the vast majority of your work.

1. Vist [VSCode](https://code.visualstudio.com) to download VSCode.
1. Launch the installer and follow the onscreen prompts.
1. When you reach the section for `Additional tasks`, make sure every box is checked.
1. Click install and continue to follow and onscreen prompts.

#### Mac OSX Users Only

1. Launch (open) the VS Code app
2. Open the Command Palette by typing ⇧⌘P (SHIFT + COMMAND + P) and type 'shell command' to find, and then select, the "Shell Command: Install 'code' command in PATH" command.
    ![vs code](https://code.visualstudio.com/assets/docs/setup/mac/shell-command.png)
3. Quit VS Code

#### Windows Users Only

1. Launch (open) the VS Code app
2. Open the Command Palette by typing Ctrl+P
3. paste `ext install ms-vscode-remote.remote-wsl` into the input box
4. Exit VS Code

### 3. Install ESLint

From the terminal run the following command:

```sh
npm i -g eslint
```

If you get an `EACCESS` error, run this command instead:

```sh
sudo npm i -g eslint
```
