wharris_bin
===========

A collection of little scripts that I keep in my ~/bin directory. I use them
on my Mac, and some are specific to OS X, but some may work on other
platforms.

Contents
--------

* `athome` - detect when the host is on the home network.

  The `athome` utility uses the current SSID to guess whether it's running on a
  machine that is connected to your home network. The home network is defined
  by the `HOME_SSID` environment variable. If `HOME_SSID` is set and `athome`
  is running on a Mac connected to a wireless network with an SSID that matches
  `HOME_SSID` then `athome` returns true. `athome` returns false if is run a
  Mac that is not connected to a wireless network with an SSID that matches
  `HOME_SSID`. `athome` returns false if `HOME_SSID` is not set.

* `backup.sh` - backup my home directory.
  
  This is run every night by `cron`. It just copies my home directory to a
  backup server.
  
  You'll need to set a couple of environment variables to use this tool:
  
  - `BACKUP_PATH` - The `scp`-style path to the backup destination. For
     example:
     _backup.example.com:/Volumes/External\ HD/backup/mymachine/username/_.
  - `BACKUP_LOG` - Local path the tool can log to. For example:
    _/Users/username/log/backup.log_.
  

* `beep` - make the terminal beep.
  
  Echoes an ASCII `BEL` character to `STDOUT`. This can be useful when
  waiting for a long-running command to finish. For example:
  
        find / -name "*.mp3" > ~/tmp/mp3s.txt 2> /dev/null ; beep
  
* `cscript` - run a C program like a script.
  
  `cscript` lets you write scripts in C, letting you compile and run
  single-line C programs with a one command. Just add a line like the
  following to the start of the source file and `chmod` it to be executable:
  
        #!/bin/sh cscript
  
  If you need a full example, see the `beep` script above.

* `datestamp` - output the date.
  
  Prints a newline followed by a #, a space, and the date.
  
* `git-remote-new` - create remote Git repository.
  
  Automates the task of creating a remote Git repository. Run
  `git-remote-new` _new-repo-name_ from a local Git repository and you'll have
  a remote branch pointing to a new repository on your Git server called
  _new-repo-name_`.git`.
  
  You'll need to set up a couple of environment variables to use this tool:
  
  - `REPO_SERVER` - the SSH address of your Git server in the form
    _username@git.example.com_.
    
  - `REPO_SERVER_GIT_PATH` - the path on the server under which your
    repositories will be created. For example _/home/username/git_.
  
  The remote name defaults to origin, but you can override that by setting
  the environment variable `REMOTE_NAME`.
  
* `growlexec` - growl the success or failure of a command.
  
  Runs the command given in the arguments then sends a Growl notification
  of the success or failure of the command based on the command's return
  value.
  
* `killjobs` - kill background jobs.
  
  Kills all the background jobs for the current shell. This will not work from
  a sub-shell, so you'll need to execute it with something like the following:
  
        . ~/bin/killjobs

* `orgname` - set organization name in Xcode.

  Sets the default organization name that Xcode uses in the the copyright
  line for new files, so you don't have to keep replacing `__MyCompanyName__`.
  Example:
  
        orgname "My Company Ltd"

* `pygrep` - search for strings in a Python source tree.
  
  Run with `pygrep` _search-term_. This script greps through all the files
  below the current directory that look like Python source code.
  
* `rbgrep` - search for strings in a Ruby source tree.
  
  Run with `rbgrep` _search-term_. This script greps through all the files
  below the current directory that look like ruby code.
  
* `restartvpn` - restart a CiscoVPN client.
  
  Sometimes the Cisco's VPN client software stops working due to evil spirits.
  This script is a magical incantation that sometimes makes the client work
  again.
  
* `srcgrep` - search a source tree.
  
  Run with `srcgrep` _search-term_. This script greps through all the files
  below the current directory that look like source code.
  
* `wdiff` - frontend to opendiff.
  
  Use this as a `--diff-cmd` argument to `svn diff` in order to view your
  diffs using FileMerge.
