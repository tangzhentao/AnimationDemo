//
//  ImageSpritesVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ImageSpritesVC.h"

@interface ImageSpritesVC ()

@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;
@property (strong, nonatomic) UIView *view3;
@property (strong, nonatomic) UIView *view4;

@end

@implementation ImageSpritesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createAndAddSubviews];
    
    UIImage *image = [UIImage imageNamed:@"modules"];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 1.0/5, 1) toLayer:_view1.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(1.0/5, 0, 1.0/5, 1) toLayer:_view2.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(2.0/5, 0, 1.0/5, 1) toLayer:_view3.layer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createAndAddSubviews
{
    _view1 = [self createAndAddSubviewWithFrame:CGRectMake(40, 40, 100, 100)];
    _view2 = [self createAndAddSubviewWithFrame:CGRectMake(200, 50, 100, 100)];
    _view3 = [self createAndAddSubviewWithFrame:CGRectMake(60, 160, 100, 100)];

}

- (UIView *)createAndAddSubviewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    [self.view addSubview:view];
    view.backgroundColor = [UIColor greenColor];
    
    return view;
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsRect = rect;
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.masksToBounds = YES;
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
