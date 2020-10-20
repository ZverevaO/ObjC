//
//  Studen.m
//  lesson4
//
//  Created by Оксана Зверева on 20.10.2020.
//

#import "Studen.h"

@implementation Studen

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname andAge:(NSInteger )age
{
    self = [super init];
    if (self) {
        self.name = [name stringByAppendingString: @" "];
        self.surname = [surname stringByAppendingString: @" "];
        self.fullname = [self.name stringByAppendingString: self.surname];
        self.age = age;
        
    }
    return self;
}

-(void)increaseage:(NSInteger )years {
    _age += years;
}

- (NSInteger )age {
    return _age;
}

- (NSString *)description
{
    return [self.fullname stringByAppendingString: [NSString stringWithFormat:@"%ld",(long)self.age]];
}

@end
