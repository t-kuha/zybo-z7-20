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

***

## If the state of PS push buttons (BTN4 & 5) does not change...

- Change the pullup field of MIO 50 & 51 to "Disabled" in Vivado

- [Reference](https://forum.digilentinc.com/topic/3614-accessing-ps-mio-led-and-2-push-buttons/)
