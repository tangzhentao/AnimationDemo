//
//  MaskLayerVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/17.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "MaskLayerVC.h"

@interface MaskLayerVC ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation MaskLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addImageView];
    
    [self addMaskLayer];
}

- (void)addImageView
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"Igloo"];
//    _imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_imageView];
}

- (void)addMaskLayer
{
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    UIImage *image = [UIImage imageNamed:@"Cone"];
    maskLayer.contents = (__bridge id)image.CGImage;
    maskLayer.contentsScale = image.scale;
    self.imageView.layer.mask = maskLayer;
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
