//
//  main.m
//  lesson2
//
//  Created by Оксана Зверева on 14.10.2020.
//

#import <Foundation/Foundation.h>

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


int calculate(NSString *method, int a, int b) {
    
    if ([method isEqualToString:@"+"]) {
        return summa(a, b);
    }
    else if ([method isEqualToString:@"-"]) {
        return subtraction(a, b);
    }
    else if ([method isEqualToString:@"*"]) {
        multiplication(a, b);
    }
    else if ([method isEqualToString:@"/"]) {
        return divide(a, b);
    }
    else if ([method isEqualToString:@"%"]) {
        return modulo(a, b);
    }
    else {
        NSLog(@"Функция не знает переданный метод");
        return 0;
    }
    
    return a + b;
    
}

BOOL includedInAlphabet (NSString *letter) {
    BOOL result = NO;
    NSString *alphabet = @"AEIOUYBCDFGHJKLMNPQRSTVWXZ";
    
    if ([alphabet rangeOfString: [letter uppercaseString]].length != 0) {
        result = YES;
    }
    
    return result;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = calculate(@"+", 2, 3);
        int b = calculate(@"-", 3, 2);
        int c = calculate(@"*", 4, 5);
        int d = calculate(@"/", 10, 2);
        int e = calculate(@"%", 6, 3);
        NSLog(@"Result: \n a = %i, \n b = %i, \n c = %i, \n d = %i, \n e = %i", a, b, c, d, e);
        
        
        
        if   (includedInAlphabet(@"p")) {
            NSLog(@"Буква входит в ангийский алфавит");
        }
        else {
            NSLog(@"Буква не входит в ангийский алфавит");
        }
        
    }
    return 0;
}

