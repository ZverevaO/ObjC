//
//  main.m
//  lesson1
//
//  Created by Оксана Зверева on 09.10.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //калькулятор
        float first = 0;
        float second = 0;
        float three = 0;
        float result = 0;
        char operation;
        
        printf("First number: ");
        scanf("%f", &first);
        printf("Second number: ");
        scanf("%f", &second);
        printf("Enter operation * or + or - or /: ");
        scanf("%s", &operation);
        
        switch (operation) {
            case '*':
                NSLog(@"%f %c %f = %f", first, operation, second, first * second);
                break;
                
            case '-':
                NSLog(@"%f %c %f = %f", first, operation, second, first - second);
                break;
                
            case '+':
                NSLog(@"%f %c %f = %f", first, operation, second, first + second);
                break;
                
            case '/':
                NSLog(@"%f %c %f = %f", first, operation, second, first / second);
                break;
                
            default:
                printf("operation selection error");
                break;
        }
        
        //среднее арифмитическое из трех чисел
        first = 0;
        second = 0;
        printf("First number: ");
        scanf("%f", &first);
        printf("Second number: ");
        scanf("%f", &second);
        printf("Three number: ");
        scanf("%f", &three);
        
        result = (first + second + three)/3;
        
        NSLog(@"(%f + %f + %f)/3 = %f", first, second, three, result);
 
    }
    return 0;
}
