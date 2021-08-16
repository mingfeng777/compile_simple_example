#include <stdio.h>
int output[1000]={0};

int fibo(int n)
{
	int result=0;
	result = output[n];
	if(result==0)
	{
		if (n==0)
			result = 0;
		else if (n==1)
			result =  1;
		else
			result = fibo(n-1)+fibo(n-2);
	}
	return result;
}

int main(int argc, char* argv[])
{
	int i,n;
	printf("Enter the number:");
	scanf("%d", &n);

	for(i=0;i<=n;i++)
		printf("fibo(%d)=%d\n", i, fibo(i));

	return 0;
}
