#!/usr/bin/env python3
from __future__ import print_function

import os
import shutil
import subprocess


def get_width(default=80):
    '''Attempt to detect console width and default to 80'''
    try:
        columns, rows = shutil.get_terminal_size()
    except AttributeError:
        try:
            _, columns = subprocess.check_output(['stty', 'size']).split()
        except OSError:
            columns = os.environ.get('COLUMNS', default)

    columns = int(columns) - 77
    # Since we have 6 columns with 1 space on each side, we can increment the
    # size for every 12 extra columns
    return max(0, columns / 12)


# Loosely based on https://gist.github.com/justinabrahms/1047767
colored = [0] + list(range(95, 256, 40))
colored_palette = [
    (r, g, b)
    for r in colored
    for g in colored
    for b in colored
]


grayscale_palette = [(g, g, g) for g in range(8, 240, 10)]


esc = '\033['
# Reset all colors sequence
reset = esc + '0m'
# Regular color
normal = esc + '38;5;{i}m'
# Bold color
bold = esc + '1;' + normal
# Background color
background = esc + '48;5;{i}m'

pattern = (
    '{normal}{background}{padding:^{width}}{i:^3d} '  # pad the background
    '{r:02X}/{g:02X}/{b:02X}'  # show the hex rgb code
    '{padding:^{width}}'  # pad the background on the other side
    '{reset}'  # reset again
)

base_context = dict(reset=reset, padding='', width=get_width())

for i, (r, g, b) in enumerate(colored_palette + grayscale_palette, 16):
    context = dict(i=i, r=r, g=g, b=b, color=r + g + b, **base_context)
    context.update(bold=bold.format(**context))
    context.update(background=background.format(**context))

    # Change text color from black to white when it might become unreadable
    if max(r, g, b) > 0xCC:
        context.update(normal=normal.format(i=0))
    else:
        context.update(normal=normal.format(i=255))

    print(pattern.format(**context), end='')

    # Print newlines when needed
    if i % 6 == 3:
        print()
    else:
        print(' ', end='')
