import os
import subprocess
import sys

from multiprocessing.pool import ThreadPool
from pathlib import Path


def call_ta2search(command):
    p = subprocess.Popen(command, shell=True)
    p.communicate()


# num = 5
# tp = ThreadPool(num)
#
# home = str(Path.home())
config_dir = sys.argv[2]

for conf in os.listdir(config_dir):
    command = "ta1-run-single-template --template " + sys.argv[1] + " " + config_dir + conf

    print(command)

    # tp.apply_async(call_ta2search, (command,))

# tp.close()
# tp.join()
