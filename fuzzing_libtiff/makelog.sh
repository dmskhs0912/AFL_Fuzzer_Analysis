for file in $HOME/project/fuzzing_libtiff/output/default/crashes/*;
do
	echo Input : $file >> crash.log
	$HOME/project/fuzzing_libtiff/install/bin/tiffinfo -D -j -c -r -s -w $file 2>> crash.log
done
