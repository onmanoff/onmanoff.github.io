---
layout: post
title:  "boost compile"
date:   2019-05-20 15:11
categories: post
---

~~~ bash
sudo update-alternatives \-\-remove-all gcc  
sudo update-alternatives \-\-remove-all g++  
sudo apt-get install -y gcc-4.8 g++-4.8 gcc-4.9 g++-4.9 gcc-5 g++-5 gcc-6 g++-6 gcc-7 g++-7  

sudo update-alternatives \-\-install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10  
sudo update-alternatives \-\-install /usr/bin/gcc gcc /usr/bin/gcc-4.9 20  
sudo update-alternatives \-\-install /usr/bin/gcc gcc /usr/bin/gcc-5 30  
sudo update-alternatives \-\-install /usr/bin/gcc gcc /usr/bin/gcc-6 40  
sudo update-alternatives \-\-install /usr/bin/gcc gcc /usr/bin/gcc-7 50  

sudo update-alternatives \-\-install /usr/bin/g++ g++ /usr/bin/g++-4.8 10  
sudo update-alternatives \-\-install /usr/bin/g++ g++ /usr/bin/g++-4.9 20  
sudo update-alternatives \-\-install /usr/bin/g++ g++ /usr/bin/g++-5 30  
sudo update-alternatives \-\-install /usr/bin/g++ g++ /usr/bin/g++-6 40  
sudo update-alternatives \-\-install /usr/bin/g++ g++ /usr/bin/g++-7 50  

sudo update-alternatives \-\-set cc /usr/bin/gcc  
sudo update-alternatives \-\-set c++ /usr/bin/g++  

sudo update-alternatives \-\-config gcc  
sudo update-alternatives \-\-config g++  
--- 