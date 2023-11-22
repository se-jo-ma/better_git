# Better Git
A collection of scripts that make using git better

## Install
In order to install in Windows PowerShell:
* Open PowerShell
* Make sure you have git installed
* Run these commands:
```
git clone https://github.com/se-jo-ma/better_git
sh .\better_git\install.sh -r $PROFILE
```
These commands clone this repo, run the install script and then delete the residual files. 
The install script can take an argument for the PowerShell Profile you would like to add commands to, in the above commands it uses the current Profile location.
The install script can also be given either of these flags ```r``` or ```R``` in order to remove the initial install files. If you do that make sure to call it from outside of the directory so it can fully clean up. This flag is present in the above commands.
You will need to open a new PowerShell instance with the Profile specified after installing in order to use the below commands.

## How to Use
Right now there is only command: better_git_clone

* ### better_git_clone || bgc
  This will clone a repo or update a local repo with any changes made since last pull(no more fatal errors if you already have a clone and try to clone again on accident!).
  It takes the repo location and destination as arguments.
  If destination is left empty it will default to the current working directory.
  If you leave .git off of the repo location it will be automatically appended.
  Passing either of these flags ```-g``` or ```-G``` will automatically add 'https://github.com/' to the beginning of the repo location.
  This allows you to pass "UserName/repo" for the repo location.
  
  Git and Better Git Equivalent Commands:
  * ```git clone https://github.com/se-jo-ma/better_git.git ./ && cd better_git && git pull```
  * ```better_git_clone -g se-jo-ma/better_git```
  * ```bgc -g se-jo-ma/better_git```
