for file in *
do
    echo input : $file >> crash.log
    ../../dact_ASAN -dcf $file 2>> crash.log
done
