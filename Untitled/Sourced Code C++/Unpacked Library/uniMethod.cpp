#include "uniMethod.h"
using namespace std;
using namespace godot;

void uniMethod::_register_methods() 
{
	register_method("getoutput", &uniMethod::getoutput);
}
void uniMethod::_init()
{
}
int uniMethod::getoutput()
{
	int seed = chrono::system_clock::now().time_since_epoch().count();
	int output = 0;
	default_random_engine gen(seed);
	uniform_int_distribution<>distribution(1, 6);
	for (int c = 0; c < 1; c++)
	{
		output=distribution(gen);
	}
	return output;
}