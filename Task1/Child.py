#!/opt/homebrew/bin/python3

import os
import time
import random as rnd
import sys
import argparse

class Child:
    @staticmethod
    def work(arg: int):
        pid = os.getpid()
        print('Child[', pid, ']: I am started. My PID', pid, '. Parent PID', os.getppid(), '.')
        time.sleep(arg)
        print('Child[', pid, ']: I am ended. PID', pid, 'Parent PID', os.getppid(), '.')
        exit_code = rnd.randint(0, 1)
        os._exit(exit_code)

def main():
    parser = argparse.ArgumentParser(description="Child process with random exit status.")
    parser.add_argument("sleep_time", type=int, help="Time in seconds to sleep before exiting")
    args = parser.parse_args()

    Child.work(args.sleep_time)

if __name__ == "__main__":
    main()
