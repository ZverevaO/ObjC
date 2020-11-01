//
//  FlockBirds.h
//  lesson5_Birds
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import <Foundation/Foundation.h>
#import "Bird.h"


NS_ASSUME_NONNULL_BEGIN

@interface FlockBirds : NSObject

@property (nonatomic, copy) NSArray <Bird *> *birds;
- (void)configWithBird:(Bird *)birds;

@end

NS_ASSUME_NONNULL_END
