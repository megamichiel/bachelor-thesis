sep() {
  echo -e "==========================================\n"
}

#cat /proc/cpuinfo | while read s && [[ $s != "" ]]; do echo $s; done

#echo ""
#sep

lshw -short

sep

echo -n "Linux kernel version: "
uname -r
