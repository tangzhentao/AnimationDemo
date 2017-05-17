//
//  ShadowPathVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/17.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ShadowPathVC.h"

@interface ShadowPathVC ()

@end

@implementation ShadowPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLayer];
    
    [self addShadow];
    
    [self addShadowPath];
}

- (void)addLayer
{
    self.layerView.frame = CGRectMake(100, 100, 100, 100);
//    self.layerView.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:self.layerView];
    
    UIImage *image = [UIImage imageNamed:@"Cone"];
    self.layerView.contents = (__bridge id)image.CGImage;
    self.layerView.contentsScale = image.scale;
}

- (void)addShadow
{
//    self.layerView.shadowColor = [UIColor yellowColor].CGColor;
    self.layerView.shadowOpacity = 0.4;
    self.layerView.shadowOffset = CGSizeMake(0, 3);
    self.layerView.shadowRadius = 5;
    
    // 这样会把阴影也剪切掉
//    self.layerView.masksToBounds = YES;
}

- (void)addShadowPath
{
    CGMutablePathRef squarePath = CGPathCreateMutable();
//    CGPathAddRect(squarePath, NULL, self.layerView.bounds);
    CGPathAddEllipseInRect(squarePath, NULL, self.layerView.bounds);
    self.layerView.shadowPath = squarePath;
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
