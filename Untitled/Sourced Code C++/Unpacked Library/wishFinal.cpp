#include "wishFinal.h"
using namespace std;
using namespace godot;

void wishFinal::_register_methods() 
{
	register_method("atpity", &wishFinal::atpity);
	register_method("belowsoftpity", &wishFinal::belowsoftpity);
	register_method("atsoftpity", &wishFinal::atsoftpity);
	register_method("guaranteed4star", &wishFinal::guaranteed4star);
}
void wishFinal::_init()
{
}
int wishFinal::atpity()
{
	int limited5star = 0;
	int random = 0;
	int output = 0;
	int shouldpity = 0;
	for (int i = 0; i <= 1; i++) {
		srand(time(NULL));
		random_device seed;
		mt19937 uni(seed());
		uniform_int_distribution<>distribution(1, 2);
		shouldpity = distribution(uni);
		if (shouldpity == 1) {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(1, 2);
				random = distribution(uni);
			}
			if (random == 1) {
				limited5star = 2;
				output = limited5star;
			}
			else {
				limited5star = 10;
				output = limited5star;
			}
		}
		else {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(1, 28);
				random = distribution(uni);
				output = random;
			}
		}
	}
	return output;
}

int wishFinal::belowsoftpity()
{
	int random = 0;
	int output = 0;
	int limited4star = 0;
	int shouldpity = 0;
	for (int i = 0; i <= 1; i++) {
		srand(time(NULL));
		random_device seed;
		mt19937 uni(seed());
		uniform_int_distribution<>distribution(1, 2);
		shouldpity = distribution(uni);
		double chance = (double)rand() / RAND_MAX;
		if (chance < 0.07 && chance > 0.00) {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(1, 28);
				random = distribution(uni);
				output = random;
			}
		}
		else if (chance < 0.14 && chance > 0.07) {
			if (shouldpity == 1) {
				for (int x = 0; x <= 1; x++) {
					uniform_int_distribution<>distribution(1, 5);
					random = distribution(uni);
				}
				if (random == 1) {
					limited4star = 80;
					output = limited4star;
				}
				else if (random == 2) {
					limited4star = 61;
					output = limited4star;
				}
				else if (random == 3) {
					limited4star = 40;
					output = limited4star;
				}
				else if (random == 4) {
					limited4star = 94;
					output = limited4star;
				}
				else {
					limited4star = 44;
					output = limited4star;
				}
			}
			else {
				for (int x = 0; x <= 1; x++) {
					uniform_int_distribution<>distribution(29, 97);
					random = distribution(uni);
					output = random;
				}
			}
		}
		else {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(98, 119);
				random = distribution(uni);
				output = random;
			}
		}
	}
	return output;
}
int wishFinal::atsoftpity()
{
	int random = 0;
	int output = 0;
	int limited4star = 0;
	int shouldpity = 0;
	for (int i = 0; i <= 1; i++) {
		srand(time(NULL));
		random_device seed;
		mt19937 uni(seed());
		uniform_int_distribution<>distribution(1, 2);
		shouldpity = distribution(uni);
		double chance = (double)rand() / RAND_MAX;
		if (chance < 0.14 && chance > 0.000) {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(1, 28);
				random = distribution(uni);
				output = random;
			}
		}
		else if (chance < 0.21 && chance > 0.14) {
			if (shouldpity == 1) {
				for (int x = 0; x <= 1; x++) {
					uniform_int_distribution<>distribution(1, 5);
					random = distribution(uni);
				}
				if (random == 1) {
					limited4star = 80;
					output = limited4star;
				}
				else if (random == 2) {
					limited4star = 61;
					output = limited4star;
				}
				else if (random == 3) {
					limited4star = 40;
					output = limited4star;
				}
				else if (random == 4) {
					limited4star = 94;
					output = limited4star;
				}
				else {
					limited4star = 44;
					output = limited4star;
				}
			}
			else {
				for (int x = 0; x <= 1; x++) {
					uniform_int_distribution<>distribution(29, 97);
					random = distribution(uni);
					output = random;
				}
			}
		}
		else {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(98, 119);
				random = distribution(uni);
				output = random;
			}
		}
	}
	return output;
}
int wishFinal::guaranteed4star()
{
	int random, limited4star, output;
	int shouldpity = 0;
	for (int i = 0; i <= 1; i++) {
		srand(time(NULL));
		random_device seed;
		mt19937 uni(seed());
		uniform_int_distribution<>distribution(1, 2);
		shouldpity = distribution(uni);
		if (shouldpity == 1) {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(1, 5);
				random = distribution(uni);
			}
			if (random == 1) {
				limited4star = 80;
				output = limited4star;
			}
			else if (random == 2) {
				limited4star = 61;
				output = limited4star;
			}
			else if (random == 3) {
				limited4star = 40;
				output = limited4star;
			}
			else if (random == 4) {
				limited4star = 94;
				output = limited4star;
			}
			else {
				limited4star = 44;
				output = limited4star;
			}
		}
		else {
			for (int x = 0; x <= 1; x++) {
				uniform_int_distribution<>distribution(29, 97);
				random = distribution(uni);
				output = random;
			}
		}
	}
	return output;
}