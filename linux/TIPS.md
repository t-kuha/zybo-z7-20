# Tips

## Blink PS-LED (LD4)

```shell-session
root@zybo-z7:~# cd /sys/class/gpio/
root@zybo-z7:/sys/class/gpio# echo 913 > export
root@zybo-z7:/sys/class/gpio# echo out > gpio913/direction

# Turn on
root@zybo-z7:/sys/class/gpio# echo 1 > gpio913/value
# Turn off
root@zybo-z7:/sys/class/gpio# echo 0 > gpio913/value

root@zybo-z7:/sys/class/gpio# echo 913 > unexport
```

## Get pushbutton state (BTN4 & BTN5)

