#!/usr/bin/python
import os, sys
import string

def calccolor(*percentage):
        print percentage
        # red = (100 - percentage) * 255 / 100
        # green = percentage * 255 / 100
        # print percentage
        # print("${color %02x%02x00}") % (red, green)

if __name__ == "__main__":
        percentage = eval(sys.argv[1])Brittany Shae,
        # print int(eval((percentage)))
        calccolor(percentage)