#include <iostream>
#include "stdio.h"
#include <tchar.h>

int m[8][8] = { { 1, 1, 1, 1, 1 },
{ 2, 2, 2, 2, 2 },
{ 3, 3, 3, 3, 3 },
{ 4, 4, 4, 4, 4 },
{ 5, 5, 5, 5, 5 } };


int _tmain(int argc, _TCHAR* argv[])
{

	for (int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
			printf("%d ", m[i][j]);
		printf("\n");
	}

	_asm {
		mov ecx, 4
		mov ebx, offset m

		rows:
			mov edx, ecx
			mov esi, ebx
			mov edi, esi
			add esi, 4

		colums:
			add edi, 32
			xchg eax, [esi]
			xchg eax, [edi]
			xchg eax, [esi]
			add esi, 4
			loop colums


			mov ecx, edx
			add ebx, 36
			loop rows



	}

	printf("\n");
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 8; j++)
			printf("%d ", m[i][j]);
		printf("\n");
	}

	int count = 0, coun = 0;
	for (int i = 0; i < 4; i++)
	{
		coun++;
		for (int j = 0; j < 5; j++)
			if (i < j)
			{
				int num = m[j][i];
				m[j][i] = m[i][j];
				m[i][j] = num;
				count++;
			}
	}
	printf("%d %d\n", count, coun);
	
	getchar();
	return 0;
}

