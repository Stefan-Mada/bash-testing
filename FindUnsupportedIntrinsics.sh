#!/bin/bash

launchParameter="$HOME/alive2-x86/build/alivecc"
filePath="vpx_dsp/x86"

export ALIVECC_SMT_TO=10

#grep -hnr "Unknown libcall" $HOME/alivecc.txt > output.txt
grep -hnr "\-o $filePath" $HOME/compile.txt > output.txt #finds lines in target folder
grep -hnr "gcc " output.txt > output2.txt #find lines that use gcc compiler
while read line
do 
	s="${line#*c}"
	s2="${s:1}"
	s3=$launchParameter"$s2"
	bash -vc "$s3" >& output3.txt
	#echo $s3
	#echo ${line#*c} | cut -c2-

	grep -hnr "Unknown libcall" output3.txt >> output4.txt	
done < output2.txt
