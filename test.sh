#!/bin/sh
set -e

dotest() {
	echo testing $1...
	python ../comp.py cmp $1.z -f $1
	python ../comp.py unc $1.z -f $1.out
	ls -l $1 $1.z | awk '{print $5}'
	diff $1 $1.out
	rm -f $1.z $1.out
}
if [ ! -f test.dat ]
then wget https://raw.githubusercontent.com/archibate/microk/master/kernel/sys.c -O test.dat
fi
for x in LICENSE README.md uncomp.c test.dat
do dotest $x; done
echo success
