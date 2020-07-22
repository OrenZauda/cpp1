### Authors: 
Avichay Nega, [Oren Zauda](https://github.com/OrenZauda), [Omer Hadida](https://github.com/2MarShmello2), 

# Script-bash-debug

A short script in the BASH language and some tools to help 
with DEBUG and finding memory leakage.

## Usage

As you know unlike JAVA for C ++, there is no built-in garbage 
collector. The programmer is the one to clear the memory after 
the end of use. Luckily there is a tool on linux that helps us 
find memory leakage and can tell exactly where the leakage 
happened or whether we went to an unallocated place in memory. 
The tool is called valgrind. You can type in the GNU: 

```bash
man valgrind
```
and get information about this tool,you can also read in this link :

[valgrind](https://en.wikipedia.org/wiki/Valgrind)

## Installation

How to install Valgrind:

Debian :

```bash
sudo apt-get install valgrind
```

Arch linux:

```bash
sudo pacman -S valgrind
```

## Run-Code examples

the format to run the script:

```bash
BasicCheck.sh  <dir path>  <program>  <arguments if needed>
```

For example when we run test1:

```bash
./BasicCheck.sh  /home/usrname/script-bash-debug/tests/test1  test_file.exe
```
We will get:

```bash
  Compilation   Memory leaks   thread race
     PASS            FAIL           PASS
```
Here we see a Memory-leak detection.

## Our mentor

[Erel Segal-Halevi](https://github.com/erelsgl/ariel-cpp-5779) 

