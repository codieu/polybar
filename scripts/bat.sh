BAT_CLASS='BAT1'


bat=`cat /sys/class/power_supply/$BAT_CLASS/capacity`
status=`cat /sys/class/power_supply/$BAT_CLASS/status`

if [[ "$status" == "Discharging" ]]; then
  case `expr $(echo $bat ) / 10` in
    '0') icon='󰁺';;
    '1') icon='󰁻';;
    '2') icon='󰁼';;
    '3') icon='󰁽';;
    '4') icon='󰁾';;
    '5') icon='󰁿';;
    '6') icon='󰂀';;
    '7') icon='󰂁';;
    '8') icon='󰂂';;
    '9') icon='󰁹';;
  esac
elif [[ "$status" == "Charging" ]]; then
  # looked too small
  # case `expr $(echo $bat ) / 10` in
  #   '0') icon='󰢜';;
  #   '1') icon='󰂆';;
  #   '2') icon='󰂇';;
  #   '3') icon='󰂈';;
  #   '4') icon='󰢝';;
  #   '5') icon='󰂉';;
  #   '6') icon='󰢞';;
  #   '7') icon='󰂊';;
  #   '8') icon='󰂋';;
  #   '9') icon='󰂅';;
  # esac
  icon='󰂄'
elif [[ "$status" == "Not charging" ]]; then
  icon="󱈑"

else
  icon='󰂑'
fi

echo $icon $bat%
