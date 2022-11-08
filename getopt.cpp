#include <iostream>
#include <string>
#include "getopt.hpp"

// git@github.com:r-lyeh-archived/getopt.git
int main()
{
  bool help = getarg( false, "-h", "--help", "-?" );
  int version = getarg()
}