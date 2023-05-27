#include <random>
#include <chrono>
#include <iostream>
#include <Godot.hpp>
#include <Node.hpp>
namespace godot
{
	class uniMethod : public Node
{		GODOT_CLASS(uniMethod, Node)
	public:
		static void _register_methods(); 
		void _init();
		int getoutput();
	};
}