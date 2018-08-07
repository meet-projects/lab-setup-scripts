#!/bin/bash
#This is a convenience script that replaces newlines with ,\n to improve readability of ls with a screenreader.
#
#T. Golfinopoulos, 7 Aug. 2018

ls | sed ':a;N;$!ba;s/\n/,\n/g'
