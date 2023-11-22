echo -e "${RED================================}"
echo -e "rm OLD sht4x.so "
echo -e "================================"
echo -e "rm OLD sht4x.so "
echo -e "================================"
echo -e "rm OLD sht4x.so "
echo -e "================================"
cd ./build && rm -rf *
echo -e "run cmake"
cmake ..
echo -e "cmake done !!"
echo -e "================================"
echo -e "run build/make"
make
echo -e "done!!"
echo -e "================================"
echo -e "run python3"
echo -e " "
echo -e "================================"
python3 ../py_sht4x_read.py

