for i in $(arp -a | cut -f 2 -d " " | cut -f 4 -d "." | rev | cut -c 2- | rev | sort -g); do avahi-resolve -a 172.25.30.$i; done 2> /dev/null
