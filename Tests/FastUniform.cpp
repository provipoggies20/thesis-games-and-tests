#include<iostream>
#include<random>
#include<chrono>
using namespace std;

int main()
{
	float start_time = (float)clock()/CLOCKS_PER_SEC;
	int seed = chrono::system_clock::now().time_since_epoch().count();
	int output=0;
	default_random_engine gen(seed);
	//will output from 1 to 6
	uniform_int_distribution<>distribution(1, 6);
	for (int c = 0; c < 10; c++)
	{
		output = distribution(gen);
		cout << output<<endl;
	}
	float end_time = (float)clock()/CLOCKS_PER_SEC;
	float elapsed_time = end_time - start_time; 
	cout<<"Start: "<<start_time<<"s"<<endl;
	cout<<"End: "<<end_time<<"s"<<endl;
	cout<<"Elapsed Time: "<<elapsed_time<<"s"<<endl;
	system("PAUSE");
}
//int seed = value of the epoch unix time including nanoseconds; better than time null
//default_random_engine = holds the value of the seed as the seed for distribution
