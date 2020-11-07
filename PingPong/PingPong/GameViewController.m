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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self newGame];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (self.bottomTouch == nil && point.y > HALF_SCREEN_WIDTH) {
            self.bottomTouch = touch;
            self.paddleBottom.center = point;
        } else if (self.topTouch == nil && point.y < HALF_SCREEN_HEIGHT) {
            self.topTouch = touch;
            self.paddleTop.center = point;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (touch == self.topTouch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                self.paddleTop.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
            } else {
                self.paddleTop.center = point;
            }
             
        } else if (touch == self.bottomTouch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                self.paddleBottom.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
            }
            else {
                self.paddleBottom.center = point;
            }
        }
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch == self.topTouch) {
            self.topTouch = nil;
        } else if (touch == self.bottomTouch) {
            self.bottomTouch = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}
// MARK: - Private area
- (void)displayMessage:(NSString *) message {
    [self stop];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver] != 0) {
                    [self newGame];
                    return;
                }
                [self reset];
                [self start];

    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)newGame {
    [self reset];
    
    self.scoreTop.text = @"0";
    self.scoreBottom.text = @"0";
    
    [self displayMessage:@"Готовы к игре?"];
}

- (int)gameOver {
    if ([self.scoreTop.text intValue] >= MAX_SCORE) return 1;
    if ([self.scoreBottom.text intValue] >= MAX_SCORE) return 2;
    return 0;
}

- (void)start {
    self.ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    self.ball.hidden = NO;
}

- (void)reset {
    if ((arc4random() % 2) == 0) {
        _dx = -1;
    } else {
        _dx = 1;
    }
    
    if (_dy != 0) {
        _dy = -_dy;
    } else if ((arc4random() % 2) == 0) {
        _dy = -1;
    } else  {
        _dy = 1;
    }
    
    self.ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    
    _speed = 2;
}

- (void)stop {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.ball.hidden = YES;
}

- (void)animate {
    self.ball.center = CGPointMake(self.ball.center.x + self.dx*self.speed, self.ball.center.y + self.dy*self.speed);
    [self checkCollision:CGRectMake(0, 0, 20, SCREEN_HEIGHT) X:fabs(self.dx) Y:0];
    [self checkCollision:CGRectMake(SCREEN_WIDTH, 0, 20, SCREEN_HEIGHT) X:-fabs(self.dx) Y:0];
    if ([self checkCollision:self.paddleTop.frame X:(self.ball.center.x - self.paddleTop.center.x) / 32.0 Y:1]) {
        [self increaseSpeed];
    }
    if ([self checkCollision:self.paddleBottom.frame X:(self.ball.center.x - self.paddleBottom.center.x) / 32.0 Y:-1]) {
        [self increaseSpeed];
    }
    [self goal];
}

- (void)increaseSpeed {
    self.speed += 0.5;
    if (self.speed > 10) self.speed = 10;
}

- (BOOL)checkCollision: (CGRect)rect X:(float)x Y:(float)y {
    if (CGRectIntersectsRect(self.ball.frame, rect)) {
        if (x != 0) self.dx = x;
        if (y != 0) self.dy = y;
        return YES;
    }
    return NO;
}

- (BOOL)goal
{
    if (self.ball.center.y < 0 || self.ball.center.y >= SCREEN_HEIGHT) {
        int s1 = [self.scoreTop.text intValue];
        int s2 = [self.scoreBottom.text intValue];
        
        if (self.ball.center.y < 0) ++s2; else ++s1;
        self.scoreTop.text = [NSString stringWithFormat:@"%u", s1];
        self.scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
        
        int gameOver = [self gameOver];
        if (gameOver) {
            [self displayMessage:[NSString stringWithFormat:@"Игрок %i выиграл", gameOver]];
        } else {
            [self reset];
        }
        
        return YES;
    }
    return NO;
}


@end
