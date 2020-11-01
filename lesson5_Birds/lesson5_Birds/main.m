//
//  main.m
//  lesson5_Birds
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import <Foundation/Foundation.h>
#import "Bird.h"
#import "FlockBirds.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        //создали стаю
        FlockBirds *flock = [[FlockBirds alloc] init];
        
        //создаем птиц
        Bird *bird1 = [[[Bird alloc] initWithSpecies:@"swan" andAge:@3] autorelease];
        Bird *bird2 = [[[Bird alloc] initWithSpecies:@"swan" andAge:@5] autorelease];
        Bird *bird3 = [[[Bird alloc] initWithSpecies:@"goose" andAge:@1] autorelease];
        Bird *bird4 = [[[Bird alloc] initWithSpecies:@"goose" andAge:@3] autorelease];
        Bird *bird5 = [[[Bird alloc] initWithSpecies:@"duck" andAge:@3] autorelease];
        Bird *bird6 = [[[Bird alloc] initWithSpecies:@"duck" andAge:@2] autorelease];
        
        //создаем массив птиц
        NSArray *birds = [[NSArray alloc] initWithObjects:bird1,bird2, bird3, bird4, bird5, bird6, nil];
        
        //конфигурируем стаю
        [flock configWithBird:birds];
        
        [flock release];
    }
   
    return 0;
}
