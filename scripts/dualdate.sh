mydate=`date "+%H:%M"`
hisdate=`date --date="8 hours" "+%H:%M"`


if [ "$1" == "sahur" ]; then
  gpsinfo="$(curl -s ipinfo.io | sed 's/[" ]//g')"
  lat=$(echo "$gpsinfo" | awk -F '[:,]' '/loc/{print $2}')
  lon=$(echo "$gpsinfo" | awk -F '[:,]' '/loc/{print $3}')

  dat=`date +"%d-%m-%Y"`

  # 13 - Diyanet İşleri Başkanlığı, Turkey
  maghrib=`curl -X GET -G -s https://api.aladhan.com/v1/timings/$dat \
    -d "latitude=$lat" \
    -d "longitude=$lon" \
    -d "metod=13" | jq '.data.timings.Maghrib' | tr -d '"'`

  now=`date +"%T"`

  StartDate=$(date -u -d "$now" +"%s")
  FinalDate=$(date -u -d "$maghrib" +"%s")
  date -u -d "0 $FinalDate sec - $StartDate sec" +"%H:%M"
  sahur='$maghrib - '
fi

printf "$sahur$mydate  $hisdate"
