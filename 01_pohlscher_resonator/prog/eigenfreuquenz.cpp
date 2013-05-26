#include <iostream>
#include <vector>

int main(void)
{
	std::vector<int> time;	//Messwerte Zeit
	std::vector<int> position;	//Messwerte Ausschlag
	std::vector<int> zero;	//Positionen der Nullstellen
	
	/*
	...
	Werte einlesen
	...
	*/
	
	//Nullen abschneiden
	while (position.begin() == 0)
	{
		time.erase (time.begin());
		position.erase (position.begin());
	}
	
	for (std::vector<int>::iterator it =time.begin(); it != time.end(); ++it)
	{
		
	}
}