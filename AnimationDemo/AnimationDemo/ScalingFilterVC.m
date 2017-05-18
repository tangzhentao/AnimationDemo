//
//  ScalingFilterVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/17.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ScalingFilterVC.h"

@interface ScalingFilterVC ()

@property (strong, nonatomic) NSMutableArray *views;
@property (strong, nonatomic) NSTimer * timer;

@end

@implementation ScalingFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addViews];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(tick)
                                            userInfo:nil
                                             repeats:YES];
    [_timer fire];
}

- (void)tick
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    NSInteger hour = components.hour;
    NSInteger minute = components.minute;
    NSInteger second = components.second;
    
    [self setDigit:hour / 10 forView:_views[0]];
    [self setDigit:hour % 10 forView:_views[1]];

    [self setDigit:minute / 10 forView:_views[2]];
    [self setDigit:minute % 10 forView:_views[3]];

    [self setDigit:second / 10 forView:_views[4]];
    [self setDigit:second % 10 forView:_views[5]];


}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_timer invalidate];
}

- (void)addViews
{
    _views = [NSMutableArray array];
    
    UIImage *image = [UIImage imageNamed:@"Digits"];
    for (int i = 0; i < 6; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50 * i + 50, 100, 50, 70)];
        [self.view addSubview:view];

        view.layer.borderWidth = .5;
        view.layer.contents = (__bridge id)image.CGImage;
        view.layer.contentsScale = image.scale;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1);

        view.layer.contentsGravity = kCAGravityResizeAspect;
        view.layer.magnificationFilter = kCAFilterNearest;

        [_views addObject:view];
    }
}

- (void)setDigit:(NSUInteger)digit forView:(UIView *)view
{
    UIImage *image = [UIImage imageNamed:@"Digits"];
    view.layer.contents = (__bridge id)image.CGImage;
    view.layer.contentsScale = image.scale;
    view.layer.contentsRect = CGRectMake(0.1 * digit, 0, 0.1, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
