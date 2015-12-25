#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# for terminus font in Archlinux :(
#xset +fp /usr/share/fonts/local
#xset fp rehash

#xset -b # disable bell
eval `/usr/bin/ssh-agent`

#if test -f /usr/lib/openssh/x11-ssh-askpass # Archlinux
#then
#	SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
#fi
#
#if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi

# 1280x720 = 720p X220
#hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

#xrdb -merge $HOME/.Xresources

csum=$(sha1sum $(which dwm))
new_csum=""

while true
do
	if [  "$csum" != "$new_csum" ]
	then
		csum=$new_csum
		dwm
	else
		exit 0
	fi
	new_csum=$(sha1sum $(which dwm))
	sleep 20s
done &
xrdb $HOME/.dotfiles/.Xresources
exec dwm
