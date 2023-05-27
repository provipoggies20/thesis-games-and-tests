#include<SDL2/SDL.h>
#include<random>
#include<chrono>
#include<iostream>
using namespace std;

int main(int argv, char** args)
{
	SDL_Window* pseudowindow=NULL;
	SDL_Window* uniformwindow=NULL;
	SDL_Renderer* pseudorenderer=NULL;
	SDL_Renderer* uniformrenderer=NULL;
	int ux=115, px=115;
	int uy=100, py=100;
	int loop;

	int seed = chrono::system_clock::now().time_since_epoch().count();
	default_random_engine gen(seed);
	uniform_int_distribution<int>distribution(1, 4);
	srand(seed);
	
	cout<<"How many times should the loop be?"<<endl;	
	cin>>loop;
	pseudowindow=SDL_CreateWindow("Pseudo",100,100,700,700,0);
	uniformwindow=SDL_CreateWindow("Uniform",1920-900,100,700,700,0);
	pseudorenderer=SDL_CreateRenderer(pseudowindow,0,0);
	uniformrenderer=SDL_CreateRenderer(uniformwindow,0,0);
	SDL_RenderSetScale(pseudorenderer, 3, 3);
	SDL_RenderSetScale(uniformrenderer, 3, 3);
	for(int u=0; u<loop;u++)
	{
		int dir=rand()%4+1;
		switch(dir)
		{
			case 1:
				px+=1;
				py+=1;
				break;
			case 2:
				px-=1;
				py+=1;
				break;
			case 3:
				px-=1;
				py-=1;
				break;
			case 4:
				px+=1;
				py-=1;
				break;
		}
		SDL_SetRenderDrawColor(pseudorenderer, 255,215,0,255);
		SDL_RenderDrawPoint(pseudorenderer, px,py);
		SDL_RenderPresent(pseudorenderer);
		SDL_Delay(1);
		
		int dir2=distribution(gen);
		switch(dir2)
		{
			case 1:
				ux+=1;
				uy+=1;
				break;
			case 2:
				ux-=1;
				uy+=1;
				break;
			case 3:
				ux-=1;
				uy-=1;
				break;
			case 4:
				ux+=1;
				uy-=1;
				break;
		}
		SDL_SetRenderDrawColor(uniformrenderer, 255,0,255,255);
		SDL_RenderDrawPoint(uniformrenderer, ux,uy);
		SDL_RenderPresent(uniformrenderer);
		SDL_Delay(1);
		if (px>230||px<0||py>200||py<-100) px=115, py=100;
		if (ux>230||ux<0||uy>200||uy<-100) ux=115, uy=100;
	}
	system("Pause");
}

