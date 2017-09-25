#!/usr/bin/env sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
compton -cCGf --shadow-radius=20 -d :0 --inactive-dim=0.5 --fade-delta=2 --fade-out-step=1.0 -C -b &!
polybar top
