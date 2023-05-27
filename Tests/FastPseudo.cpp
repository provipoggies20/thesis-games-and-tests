#include<iostream>
#include<chrono>
#include<time.h>
using namespace std;
int main()
{
	float start_time = (float)clock()/CLOCKS_PER_SEC;
	int seed = chrono::system_clock::now().time_since_epoch().count();
	int output = 0;
	srand(seed);
	for (int c = 0; c < 10; c++)
	{
		//will output from 1 to 6;
		output = rand()%6+1;
		cout << output<<endl;
	}
	float end_time = (float)clock()/CLOCKS_PER_SEC;
	float elapsed_time = end_time - start_time; 
	cout<<"Start: "<<start_time<<"s"<<endl;
	cout<<"End: "<<end_time<<"s"<<endl;
	cout<<"Elapsed Time: "<<elapsed_time<<"s"<<endl;
	system("PAUSE");
}
