//
//  ContentsCenterVCViewController.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ContentsCenterVC.h"

@interface ContentsCenterVC ()<CALayerDelegate>

@property (strong, nonatomic) UIButton * button1;
@property (strong, nonatomic) UIButton * button2;


@end

@implementation ContentsCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    _button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    
    _button1.backgroundColor = [UIColor greenColor];
    _button2.backgroundColor = [UIColor greenColor];

    
    [self.view addSubview:_button1];
    [self.view addSubview:_button2];
    
    UIImage *image = [UIImage imageNamed:@"button"];
    
    [self addStreshImage:image withContentsCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:_button1.layer];
    [self addStreshImage:image withContentsCenter:CGRectMake(0, 0, 1, 1) toLayer:_button2.layer];

}

- (void)addStreshImage:(UIImage *)image withContentsCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
//    layer.contentsGravity = kCAGravityResize;
    layer.contentsCenter = rect;
    
    layer.contentsScale = image.scale;
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
