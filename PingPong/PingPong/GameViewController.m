//
//  ViewController.m
//  PingPong
//
//  Created by Оксана Зверева on 07.11.2020.
//

#import "GameViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH (SCREEN_WIDTH/2)
#define HALF_SCREEN_HEIGHT (SCREEN_HEIGHT/2)
#define MAX_SCORE 6

@interface GameViewController ()
@property (nonatomic, weak) UIImageView *paddleTop;
@property (nonatomic, weak) UIImageView *paddleBottom;
@property (nonatomic, weak) UIView *gridView;
@property (nonatomic, weak) UIView *ball;

@property (nonatomic, strong) UITouch *topTouch;
@property (nonatomic, strong) UITouch *bottomTouch;
@property (nonatomic, strong) NSTimer * timer;

@property (nonatomic, assign) float dx;
@property (nonatomic, assign) float dy;
@property (nonatomic, assign) float speed;

@property (nonatomic, weak) UILabel *scoreTop;
@property (nonatomic, weak) UILabel *scoreBottom;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];

}

- (void)config {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    UIView *grid = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    grid.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview: grid];
    
    UIImageView *top = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleTop"]];
    top.frame = CGRectMake(30.0, 40.0, 90.0, 60.0);
    top.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:top];
    self.paddleTop = top;
    
    UIImageView *bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddleBottom"]];
    bottom.frame = CGRectMake(30.0, SCREEN_HEIGHT - 90.0, 90.0, 60.0);
    bottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bottom];
    self.paddleBottom = bottom;
    
    UIView *ball =  [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x -10.0, self.view.center.y - 10.0, 20.0, 20.0)];
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10.0;
    ball.hidden = YES;
    [self.view addSubview:ball];
    self.ball = ball;
    
    UILabel *scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    scoreTop.textColor = [UIColor whiteColor];
    scoreTop.text = @"0";
    scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoreTop];
    self.scoreTop = scoreTop;
    
    UILabel *scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 20, 50, 50)];
    scoreBottom.textColor = [UIColor whiteColor];
    scoreBottom.text = @"0";
    scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    scoreBottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoreBottom];
    self.scoreBottom = scoreBottom;
}

@end
