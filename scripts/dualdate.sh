mydate=`date "+%H:%M"`
hisdate=`date --date="8 hours" "+%H:%M"`

printf "$mydate  $hisdate"
