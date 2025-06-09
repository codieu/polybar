mydate=`date "+%H:%M"`
# it fucking changed again!!
hisdate=`date --date="7 hours" "+%H:%M"`

printf "$hisdate  $mydate"
