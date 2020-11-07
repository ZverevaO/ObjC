//
//  Bird.h
//  lesson5_Birds
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject

@property (nonatomic, strong) NSString *species;
@property (nonatomic, strong) NSNumber *age;
- (instancetype) initWithSpecies: (NSString *)species andAge: (NSNumber *)age;



@end

NS_ASSUME_NONNULL_END
