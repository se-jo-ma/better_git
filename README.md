# Better Git
A collection of scripts that make using git better

## Install
In order to install in Windows PowerShell:
* Open PowerShell
* Make sure you have git installed
* Run these commands:
```
git clone https://github.com/se-jo-ma/better_git
sh .\better_git\install.sh $PROFILE
```
All these commands do is clone this repo and then run the install script from this repo. The install script does require an argument for the PowerShell Profile you would like to add commands to, in the above commands it uses the current Profile location.
The commands will be available when you open a new PowerShell instance with the Profile specified.

## How to Use
Right now there is only command: better_git_clone

* ### better_git_clone
  This will clone a repo or update a local repo with any changes made since last pull(no more fatal errors if you already have a clone and try to clone again on accident!).
  It takes the repo location and destination as arguments.
  If destination is left empty it will default to the current working directory.
  If you leave .git off of the repo location it will be automatically appended.
  Passing either of these flags ```-g``` or ```-G``` will automatically add 'https://github.com/' to the beginning of the repo location.
  This allows you to pass "UserName/repo" for the repo location.
  
  Git and Better Git Equivalent Commands:
  * ```git clone https://github.com/se-jo-ma/better_git.git ./ && cd better_git && git pull```
  * ```better_git_clone -g se-jo-ma/better_git```
