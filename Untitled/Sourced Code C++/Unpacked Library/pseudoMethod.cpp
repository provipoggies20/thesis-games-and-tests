#include "pseudoMethod.h"
using namespace std;
using namespace godot;

void pseudoMethod::_register_methods()
{
	register_method("getoutput", &pseudoMethod::getoutput);
}
void pseudoMethod::_init()
{
}
int pseudoMethod::getoutput()
{
	int seed = chrono::system_clock::now().time_since_epoch().count();
	int output = 0;
	srand(seed);
	for (int c = 0; c <= 1; c++) 
	{
		output=rand() % 6 + 1;
	}
	return output;
}