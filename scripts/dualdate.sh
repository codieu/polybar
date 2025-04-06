mydate=`date "+%H:%M"`
herdate=`date --date="7 hours" "+%H:%M"`
# TODO: manage daylight savings in australia

printf "$herdate  $mydate"
