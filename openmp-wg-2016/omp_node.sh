#!/bin/sh
qsub -I -l nodes=1:ppn=4,mem=2000mb,flags=ADVRES:shortqos.1534
