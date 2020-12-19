#! /bin/bash 



calculate () {
	  read -p "Enter the first number: " n1
	  echo $n1;
}

read -p "Enter a val : " a

if [ $a -eq 1 ];then 
	calculate
fi

