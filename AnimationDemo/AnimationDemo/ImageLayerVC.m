//
//  ImageLayerVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ImageLayerVC.h"

@interface ImageLayerVC ()

@end

@implementation ImageLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addImageLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addImageLayer
{
    self.layerView.frame = CGRectMake(150, 250, 100, 100);
    [self.view.layer addSublayer:self.layerView];
    UIImage *image = [UIImage imageNamed:@"tip"];
    self.layerView.contents = (__bridge id)image.CGImage;
    self.layerView.contentsGravity = kCAGravityCenter; //kCAGravityResizeAspect;
    
    // set background
    self.layerView.backgroundColor = [UIColor blueColor].CGColor;
    
    // content scale
    CGFloat scale = self.layerView.contentsScale;
    NSLog(@"contents scale: %f", scale);
    
    CGFloat viewScale = self.view.contentScaleFactor;
    NSLog(@"view scale: %f", viewScale);
    
    CGFloat scrennScale = [UIScreen mainScreen].scale;
    NSLog(@"screen scale: %f", scrennScale);
    
    CGFloat imageScale = image.scale;
    NSLog(@"image scale: %f", imageScale);
    
    scale = image.scale;
    self.layerView.contentsScale = scale;
    
    // set content rect
    self.layerView.contentsRect = CGRectMake(0, 0, 1, 1);
    
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
