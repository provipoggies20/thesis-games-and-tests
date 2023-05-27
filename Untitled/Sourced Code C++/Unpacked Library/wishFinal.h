#include <random>
#include <time.h>
#include <stdlib.h>
#include <iostream>
#include <Godot.hpp>
#include <Node.hpp>
namespace godot
{
	class wishFinal : public Node
{		GODOT_CLASS(wishFinal, Node)
	public:
		static void _register_methods(); 
		void _init();
		int atpity();
		int belowsoftpity();
		int atsoftpity();
		int guaranteed4star();
	};
}