#!/bin/bash

FRAC=../frac-arm
ODIR=log_good
IDIR=armbins

for i in `ls $IDIR/`
do
  mkdir -p ./$ODIR
  echo "dis func_1" | $FRAC $IDIR/$i &> $ODIR/$i.log
  grep logic_error $ODIR/$i.log &> /dev/null
  if [ $? -ne 0 ]
  then
    echo $i
  fi
done
