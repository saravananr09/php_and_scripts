#!/bin/bash

c=0
for file in $( ls ); do
	    eval "var$c=$file";
	        c=$((c+1));
	done
