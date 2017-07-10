#!/bin/bash
ws=$(dbus-send --print-reply --type=method_call \
	--dest=org.freedesktop.compiz  /org/freedesktop/compiz/core/screen0/hsize \
	org.freedesktop.compiz.get | tail -c -2)

dbus-send --type=method_call --dest=org.freedesktop.compiz \
	/org/freedesktop/compiz/core/screen0/hsize \
	org.freedesktop.compiz.set int32:$[ $ws - 1 ]
