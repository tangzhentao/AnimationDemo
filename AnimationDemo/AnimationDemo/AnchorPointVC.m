//
//  AnchorPositionVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/11.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "AnchorPointVC.h"

@interface AnchorPointVC ()

@property (strong, nonatomic) UIView *clockView;
@property (strong, nonatomic) UIImageView *hourHandImageView;
@property (strong, nonatomic) UIImageView *minuteHandImageView;
@property (strong, nonatomic) UIImageView *secondHandImageView;

@property (strong, nonatomic) NSTimer * timer;

@end

@implementation AnchorPointVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [_timer fire];
    
}

- (void)createUI
{
    _clockView = [[UIView alloc] initWithFrame:CGRectMake(110, 110, 200, 200)];
    
    _hourHandImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hourhand"]];
    _minuteHandImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minutehand"]];
    _secondHandImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"secondhand"]];
    
    _hourHandImageView.frame = CGRectMake(90, 50, 20, 50);
    _minuteHandImageView.frame = CGRectMake(95, 40, 10, 60);
    _secondHandImageView.frame = CGRectMake(98, 30, 4, 70);
    
    [self addImageWithName:@"dial" toLayer:_clockView.layer];

    
    [self.view addSubview:_clockView];

    [self.clockView addSubview:_hourHandImageView];
    [self.clockView addSubview:_minuteHandImageView];
    [self.clockView addSubview:_secondHandImageView];

    [self setAnchorPoints];
    
    _hourHandImageView.frame = CGRectMake(90, 50, 20, 50);
    _minuteHandImageView.frame = CGRectMake(95, 40, 10, 60);
    _secondHandImageView.frame = CGRectMake(98, 30, 4, 70);
    
    
    [self tick];

}

- (void)setAnchorPoints
{
    _hourHandImageView.layer.anchorPoint = CGPointMake(0.5, 1);
    _minuteHandImageView.layer.anchorPoint = CGPointMake(0.5, 1);
    _secondHandImageView.layer.anchorPoint = CGPointMake(0.5, 1);
}

- (void)addImageWithName:(NSString *)imageName toLayer:(CALayer *)layer
{
    UIImage *image = [UIImage imageNamed:imageName];
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsScale = image.scale;
    layer.contentsGravity = kCAGravityResizeAspect;
}

- (void)tick
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *compents = [calendar components:units fromDate:[NSDate date]];
    NSLog(@"%ld:%ld:%ld", compents.hour, compents.minute, compents.second);
    
    CGFloat hoursAngle = compents.hour / 12.0 * M_PI * 2.0;
    CGFloat minutesAngle = compents.minute / 60.0 * M_PI * 2.0;
    CGFloat secondsAngle = compents.second / 60.0 * M_PI * 2.0;

    _hourHandImageView.transform = CGAffineTransformMakeRotation(hoursAngle);
    _minuteHandImageView.transform = CGAffineTransformMakeRotation(minutesAngle);
    _secondHandImageView.transform = CGAffineTransformMakeRotation(secondsAngle);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s", __func__);
    [_timer invalidate];
}

-(void)dealloc
{
    NSLog(@"%s", __func__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
