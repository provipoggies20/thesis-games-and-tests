#include <iostream>
#include <chrono>
#include <Godot.hpp>
#include <Node.hpp>
namespace godot
{
	class pseudoMethod : public Node
{		GODOT_CLASS(pseudoMethod, Node)
	public:
		static void _register_methods(); 
		void _init();
		int getoutput();
	};
}