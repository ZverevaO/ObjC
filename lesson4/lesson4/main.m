//
//  main.m
//  lesson4
//
//  Created by Оксана Зверева on 20.10.2020.
//

#import <Foundation/Foundation.h>
#import "Studen.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Studen *student1 =  [[Studen alloc] initWithName:@"Иванов" andSurname:@"Иван" andAge:22];
        Studen *student2 =  [[Studen alloc] initWithName:@"Петров" andSurname:@"Петр" andAge:18];
        Studen *student3 =  [[Studen alloc] initWithName:@"Андреев" andSurname:@"Андрей" andAge:20];
        
        [student1 increaseage:5];
        
        NSArray *students = [NSArray arrayWithObjects: student1, student2, student3, nil];
        for (NSNumber *student in students) {
            NSLog(@"%@", [student description]);
        }
        
        NSLog(@"%@", student2.fullname);

    }
    return 0;
}
