for file in $HOME/project/fuzzing_tcpdump/output/default/crashes/*; do
echo Input: $file >> $HOME/project/fuzzing_tcpdump/crash.log
$HOME/project/fuzzing_tcpdump/tcpdump_fuzz -vvvvXX -ee -nn -r $file 2>> $HOME/project/fuzzing_tcpdump/crash.log
done
