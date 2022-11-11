#!/bin/bash
case $1 in
    up)
	    brightnessctl s 10%+ > /dev/null
	    ;;
    down)
	    brightnessctl s 10%- > /dev/null
	    ;;
esac
