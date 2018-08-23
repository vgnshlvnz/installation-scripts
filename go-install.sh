#!/bin/sh

currentDir=$(pwd)
currentAt="You're currently at $currentDir"
workDirPath=$HOME/work


echo "Go Installation - Linux"
echo "Installation done at $HOME/go"
echo "Downloading latest Go Installation files of Internet"

echo "Downloading files"
wget $1
tar -xvzf go*.tar.gz
echo "Creating go workspace at $workDirPath"
mkdir $HOME/work
mv go/ $HOME
#add persistent path, to allow go-related files available system-wide 
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/work

echo "Testing Installation"
echo "Creating directory at $HOME/work/src/github.com/usr/hello"

mkdir -p $HOME/work/src/github.com/user/hello
cd $HOME/work/src/github.com/user/hello

echo "Creating Simple Hello World Application"
touch hello.go

#cat <<EOF
#package main
#import "fmt"

#func main() {
#fmt.Printf("hello, world\n")
#}
#EOF

#below code works charm - thanks to stackoverflow guy who showed how to do it 
cat <<EOF>> hello.go
package main
import "fmt"

func main() {
fmt.Printf("hello, world\n")
}
EOF


cd $HOME/work/src
echo "Compiling Hello World program"
go install github.com/user/hello

echo "Printing Hello World"
$GOPATH/bin/hello
