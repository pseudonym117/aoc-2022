#!/bin/sh

cat $2 | sed 's/\r//' | /golfscript/golfscript.rb $1
