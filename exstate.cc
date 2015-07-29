/* insert libraries defining standard functions */
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
#include<time.h>
#include<iostream>
#include<fstream>
using namespace std;

int main(int argc, char *argv[]){
//need to feed in trajectory #
  
  int traj=atoi(argv[1]);
  float temp1, temp3;
  int temp2,ex,state;

  char s1[30];
  sprintf(s1,"1234_%d",traj);
  ifstream in1234;
  in1234.open (s1);
  if(!in1234){
    cerr << "***ERROR: could not find the file 1234 ***" << endl;
    exit(1);
  }

  ifstream inex("exstateTOT");
  if(!inex){
    cerr << "***ERROR: could not find the file exstateTOT ***" << endl;
    exit(1);
  }
  

  for (int i = 0 ; i < 300 ; i++){
     inex >> ex;
     for (int j = 0 ; j < 25 ; j++){
       in1234 >> temp1 >> temp2 >> state >> temp3;
       if(state==ex) cout  << 1 << endl;
       else cout << 0 << endl;
     }}
  
  
  inex.close();
  in1234.close();
  return 0;
}
