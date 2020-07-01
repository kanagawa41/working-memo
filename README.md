# working-memo
This is framework for working memo of me.

# Folder's construct

# Usage
## Create aliases
TODO: alias are created automatically with a bash

In `~/.bashrc` or `~/.bash_profile`.
```
alias mkwdir='cd ~/Documents/notes/bin && ./working_dir_maker.sh -y && cd -'
alias watch_note='nohup ~/Documents/notes/bin/watch_today_note.sh'
alias pack_folder='cd ~/Documents/notes/bin && ./pack_past_folder.sh -y && cd -'
```

## Add files that your favorite in @importants
### Routine list for at your office
like below:
```
# TODO begin of work
## Refresh(Relogin) the Chatwork
## Announce to arrive at the company
## Send request about going to work crowdtech
## Create the work folder for today
`$ mkwdir`
`$ watch_note`
## Check the Chatwork
...

# TODO end of work
## Change to the glassese for usually
## Pick up the lunch box
...
```

### Passwords, commands, script or etc... in production environment
Write your important information to access it quickly.
e.g. aws key, database password in staging or production etc...

# Tips
### over_*.md
If you would like to bring out notes for over a couple of days, you create `over_*.md` note in the day folder.
