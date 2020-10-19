//
//  main.m
//  lesson3
//
//  Created by Оксана Зверева on 19.10.2020.
//
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger)
{
  female = 1,
  male = 2
} Sex;

struct Human {
    NSString *Name;
    NSInteger Age;
    Sex Gander;
    
};

typedef struct Human Human;

//-------------------------------
void people () {
    
    Human human1;
    human1.Age = 10;
    human1.Gander = female;
    human1.Name = @"Мария";
    
    Human human2;
    human2.Age = 10;
    human2.Gander = male;
    human2.Name = @"Павел";
    
    NSLog(@"Дети: %@, %@", human1.Name, human2.Name);
}

//--------------------------------
typedef enum  {
    Summa,
    Subtraction,
    Multiplication,
    Divide,
    Modulo
} Operation;

int summa (int a, int b) {
    return a + b;
}

int subtraction (int a, int b) {
    return a - b;
}

int multiplication (int a, int b) {
    return a * b;
}

int divide (int a, int b) {
    return a / b;
}

int modulo (int a, int b) {
    return a % b;
}


int calculate(Operation method, int a, int b) {
    
    if (method == Summa) {
        return summa(a, b);
    }
    else if (method == Subtraction) {
        return subtraction(a, b);
    }
    else if (method == Multiplication) {
        multiplication(a, b);
    }
    else if (method == Divide) {
        return divide(a, b);
    }
    else if (method == Modulo) {
        return modulo(a, b);
    }
    else {
        NSLog(@"Функция не знает переданный метод");
        return 0;
    }
    
    return 0;
    
}
//------------------------------
void funcArray () {
    NSArray *array = [NSArray arrayWithObjects: @"один", @"два", @"три", @"четыре", @"пять", nil];
    for (NSNumber *number in array) {
        NSLog(@"%@", number);
        
    }
}
//-----------------------------


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Operation operation = Summa;
        int a = calculate(operation, 2, 3);
        
        operation = Subtraction;
        int b = calculate(operation, 3, 2);
        operation = Multiplication;
        int c = calculate(operation, 4, 5);
        operation = Divide;
        int d = calculate(operation, 10, 2);
        operation = Modulo;
        int e = calculate(operation, 6, 3);
        NSLog(@"Result: \n a = %i, \n b = %i, \n c = %i, \n d = %i, \n e = %i", a, b, c, d, e);
        
        funcArray ();
        
        people ();
    }
    return 0;
}
