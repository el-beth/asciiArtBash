#!/bin/bash

# generally, this script will accept input and output lineart corresponding to that string
# syntax:
#		./lineart.sh '+123'
# font found on 'https://patorjk.com/software/taag'

# the ff is a narrow font, i.e. no space around each character

# _0='  ___  \n / _ \ \n| | | |\n| | | |\n| |_| |\n \___/ \n       ';
# _1=' __ \n/_ |\n | |\n | |\n | |\n |_|\n    ';
# _2=' ___  \n|__ \ \n   ) |\n  / / \n / /_ \n|____|\n      ';
# _3=' ____  \n|___ \ \n  __) |\n |__ < \n ___) |\n|____/ \n       ';
# _4=' _  _   \n| || |  \n| || |_ \n|__   _|\n   | |  \n   |_|  \n        ';
# _5=' _____ \n| ____|\n| |__  \n|___ \ \n ___) |\n|____/ \n       ';
# _6='   __  \n  / /  \n / /_  \n|  _ \ \n| (_) |\n \___/ \n       ';
# _7=' ______ \n|____  |\n    / / \n   / /  \n  / /   \n /_/    \n        ';
# _8='  ___  \n / _ \ \n| (_) |\n > _ < \n| (_) |\n \___/ \n       ';
# _9='  ___  \n / _ \ \n| (_) |\n \__, |\n   / / \n  /_/  \n       ';
# _p='       \n   _   \n _| |_ \n|_   _|\n  |_|  \n       \n       ';

# abandoned the previous font for a directory with a file for each character,
# to be removed later if of no use

if ((egrep -qe '[^0-9\+]' <<< "$1") || [ -z "$1" ])
then
	echo -e "calling argument wrong\nsyntax:\n        ./lineart.sh '+123'" && exit 1;
fi

str="$(sed -Ee 's/\+/p/gi' <<< "$1" -e 's/(.)/\1 /g' -e 's/ $//g')";

for i in {1..7}
do
	a="";
	for char in $str
	do
		a="$a"`head -n "$i" "font/$char" | tail -n 1`
	done
	echo "$a";
done
