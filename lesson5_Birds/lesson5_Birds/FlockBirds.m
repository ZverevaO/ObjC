//
//  FlockBirds.m
//  lesson5_Birds
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import "FlockBirds.h"
#import "Bird.h"

@implementation FlockBirds

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Create flock of birds");
    }
    return self;
}

- (void)dealloc {
    [self remove];
    NSLog(@"Dealloc flock");
    [super dealloc];
}

- (void)configWithBird:(Bird *)birds  {
    [birds retain];
    [birds release];
    _birds = birds;
    for (Bird *bird in birds) {
        NSLog(@"Add bird (%@) to flock", bird.species);
    }
}

- (void)remove {
    NSLog(@"Remove birds from flock");
//    for (Bird *bird in _birds) {
//        [bird release];
//    }
    [_birds release];
}

@end
