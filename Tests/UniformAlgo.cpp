#include<iostream>
#include<random>
#include<chrono>
using namespace std;

int main()
{
	int seed = chrono::system_clock::now().time_since_epoch().count();
	int output=0;
	//seed is just for not producing the same sequence for uniform distribution
	default_random_engine gen(seed);
	
	//will output from 1 to 6
	uniform_int_distribution<>distribution(1, 6);
	output = distribution(gen);
	cout<<"Output: "<<output<<endl;
	
	//total possible outputs
	cout<<"Total Possible Numbers: "<<distribution.max()-distribution.min()+1<<endl;
	
	//probabilities of each and every possible outputs || assume 1.0 is 100%
	float pro=1.0/(distribution.max()-distribution.min()+1);
	cout<<"Probabilities: "<<pro<<"%";
	
}
//int seed = value of the epoch unix time including nanoseconds; better than time null
//default_random_engine = holds the seed for distribution
