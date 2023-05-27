#include<iostream>
using namespace std;
int main()
{
	//initialized seed to 1
 	float seed=1655800950; 
	int holder=0;
	
	//holder for the algorithm which will be the next seed
	holder = (214013 * seed + 2531011);
	cout<<"Holder: "<<holder<<endl;
	
	//the random output || >>16 == divide by 65535 || 0x7fff == RAND_MAX (32767)
	seed = ((holder)>>16)&0x7fff; 
	cout<<"Random Output: "<<seed;

	//holder will become the new seed
}
//below is the output for the defined seed = 1
/*41
18467
6334
26500
19169
15724
11478
29358
26962
24464*/
