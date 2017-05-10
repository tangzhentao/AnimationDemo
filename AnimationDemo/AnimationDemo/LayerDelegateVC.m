//
//  LayerDelegateVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "LayerDelegateVC.h"

@interface LayerDelegateVC () <CALayerDelegate>

@end

@implementation LayerDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView.delegate = self;
    [self addBlueLayer];
    
    [self.layerView display];
}

- (void)addBlueLayer
{
    self.layerView.frame = CGRectMake(50, 50, 100, 100);
    [self.view.layer addSublayer:self.layerView];
    self.layerView.backgroundColor = [UIColor blueColor].CGColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ---------- CALayerDelegate
//- (void)displayLayer:(CALayer *)layer
//{
//    NSLog(@"%s", __func__);
//    UIImage *image = [UIImage imageNamed:@"button"];
//
//    layer.contents = (__bridge id)image.CGImage;
//    
//    layer.contentsScale = image.scale;
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"%s", __func__);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

-(void)dealloc
{
    self.layerView.delegate = nil;
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
