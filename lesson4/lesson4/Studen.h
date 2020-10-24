//
//  Studen.h
//  lesson4
//
//  Created by Оксана Зверева on 20.10.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Studen : NSObject

    @property (nonatomic, strong) NSString *name;
    @property (nonatomic, strong) NSString *surname;
    @property (nonatomic, strong) NSString *fullname;
    //@property (nonatomic, readonly) NSInteger age;
    @property (nonatomic) NSInteger age;

- (instancetype)initWithName:(NSString *)name andSurname:(NSString *)surname andAge:(NSInteger )age;

-(void)increaseage:(NSInteger )years;

- (NSInteger )age;

- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
