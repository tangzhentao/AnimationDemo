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

@end

@implementation ScalingFilterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addViews];
}

- (void)addViews
{
    _views = [NSMutableArray array];
    
    UIImage *image = [UIImage imageNamed:@"Digits"];
    for (int i = 0; i < 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50 * i + 50, 100, 50, 70)];
        [self.view addSubview:view];

        view.layer.borderWidth = .5;
        view.layer.contents = (__bridge id)image.CGImage;
        view.layer.contentsScale = image.scale;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1);

        view.layer.contentsGravity = kCAGravityResizeAspect;
    }
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
