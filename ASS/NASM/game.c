#include <stdio.h>
#include <math.h>
int main()
{
    int number1, number2, number3;
    printf("Enter 1st Number : ");
    scanf("%d", &number1);
    printf("Enter 2nd Number : ");
    scanf("%d", &number2);
    printf("Enter 3rd Number : ");
    scanf("%d", &number3);
    printf("\n---------------------------------------------------------\n");
    printf("Original numbers: %d, %d, %d", number1, number2, number3);
    printf("\n ascending sort three integers of number : ");
    if (number1 <= number2 && number2 <= number3)
    {
        printf("%d, %d, %d", number1, number2, number3);
    }
    else if (number1 <= number3 && number3 <= number2)
    {
        printf("%d, %d, %d", number1, number3, number2);
    }
    else if (number2 <= number1 && number1 <= number3)
    {
        printf("%d, %d, %d", number2, number1, number3);
    }
    else if (number2 <= number3 && number3 <= number2)
    {
        printf("%d, %d, %d", number2, number3, number1);
    }
    else if (number3 <= number1 && number1 <= number2)
    {
        printf("%d, %d, %d", number3, number1, number2);
    }
    else if (number1 == number2 && number2 == number3)
    {
        printf("%d, %d, %d", number1, number2, number3);
    }
    else
    {
        printf("%d, %d, %d", number3, number2, number1);
    }
    printf("\n---------------------------------------------------------\n");
}