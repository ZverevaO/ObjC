//
//  ViewController.m
//  lesson6
//
//  Created by Оксана Зверева on 01.11.2020.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSString* (^greeting)(NSString*) = ^(NSString *name) {
    NSString* greetingSTR = @"Добрый день, ";
    //NSLog(@"%@", [greetingSTR stringByAppendingString: name]);
    return [greetingSTR stringByAppendingString: name];
};

int (^sum)(int, int) = ^(int first, int second) {
    return first + second;
};

void (^currentDate)(void) = ^{
    NSDate *date = [NSDate date];
    NSLog(@"%@", date);
};

void (^valediction)(NSString*) = ^(NSString *name) {
    NSString* valedictionStr = @"Досвидания, ";
    NSLog(@"%@", [valedictionStr stringByAppendingString: name]);
};

void (^yourTimezone)(void) = ^{
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"zzzz"];
    
    NSString *timezoneSTR = [format stringFromDate:date];
    
    NSLog(@"Ваш часовой пояс: %@", timezoneSTR);

};

void (^dayOfWeek)(void) = ^{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"EEEE"];
    
    NSString *dayWeek = [format stringFromDate:date];
    
    NSLog(@"Сегодня %@", dayWeek);
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    
//    dispatch_async(globalQueue, ^{
//        NSLog(@"%@", greeting(@"Иван"));
//
//        NSLog(@"%d", sum(20,30));
//    });
    
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Блок 1");
        NSLog(@"%@", greeting(@"Иван"));
        NSLog(@"%d", sum(20,30));
    });
    
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Блок 2");
        currentDate();
    });
    
//    dispatch_async(globalQueue, ^{
//        currentDate();
//
//    });
    
    dispatch_group_notify(group, globalQueue, ^{
        NSLog(@"Блок 1 и Блок 2 должны быть выполены");
        valediction(@"Иван");
    });

    
//    dispatch_async(globalQueue, ^{
//        valediction(@"Иван");
//
//    });
    
    dispatch_sync(globalQueue, ^{
        yourTimezone();
    });
    
    
    dispatch_sync(globalQueue, ^{
        dayOfWeek();
    });
    
    
}


@end
