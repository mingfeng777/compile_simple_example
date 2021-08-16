#include <stdio.h>

int fibo(int n)
{
	if (n==0)
		return 0;
	else if (n==1)
		return 1;
	else
		return fibo(n-1)+fibo(n-2);
}

int main(int argc, char* argv[])
{
	int i,n;
	printf("Enter thernumber:");
	scanf("%d", &n);

	for(i=0;i<=n;i++)
		printf("fibo(%d)=%d\n", i, fibo(i));

	return 0;
}
