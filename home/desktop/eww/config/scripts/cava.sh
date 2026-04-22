#!/usr/bin/env bash

cava -p <(cat <<EOF
[general]
bars = 10
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 9
EOF
) | sed -u '
    s/;//g;
    s/9/⣿/g;
    s/8/⣾/g;
    s/7/⣷/g;
    s/6/⣶/g;
    s/5/⣴/g;
    s/4/⣦/g;
    s/3/⣤/g;
    s/2/⣠/g;
    s/1/⣄/g;
    s/0/⣀/g;
'
