#!/bin/bash
for i in $(ps ux|grep terminal|grep -v grep |awk '{print $2}')
do 
  kill -s 1 $i
done

