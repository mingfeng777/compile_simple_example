# compile_simple_example
This is a simple test that allows me to easily run the code on different machines by selecting different toolchains.

This development depends on kbuild_standalone:
https://github.com/WangNan0/kbuild-standalone

git clone https://github.com/mingfeng777/compile_simple_example.git  
cd compile_simple_example  
git clone https://github.com/WangNan0/kbuild-standalone.git  
  
make menuconfig  
(Youd need to enter the cross compile tools dir and prefix)  
-> Settings  
---> cross compiler  
---> cross compiler prefix  
(install path (This item must be cautious))  
-> Settings  
---> Destination path for 'make install'  
  
make   
