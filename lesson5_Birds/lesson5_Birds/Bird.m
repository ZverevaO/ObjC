//
//  Bird.m
//  lesson5_Birds
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import "Bird.h"

@implementation Bird

- (instancetype) initWithSpecies: (NSString *)species andAge: (NSNumber *)age {
    
    self = [super init];
       if (self) {
           [age retain];
           [age release];
           _age = age;
           
           [species retain];
           [species release];
           _species = species;
          
           NSLog(@"Create bird %@ %@", species, age);
       }
       return self;
}

- (void)dealloc {
    NSLog(@"Dealloc bird - %@, %@", _species, _age);
    [_species release];
    [_age release];
    [super dealloc];
}

@end
