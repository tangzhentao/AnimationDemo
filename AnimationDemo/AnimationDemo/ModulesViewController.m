//
//  ModulesViewController.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "ModulesViewController.h"

@interface ModulesViewController ()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (strong, nonatomic) UIButton *button5;

@end

@implementation ModulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createAndAddButtons];
    
    [self layoutButtons];
    
    [self setImages];
}

- (void)createAndAddButtons
{
    _button1 = [self createAndAddButton];
    _button2 = [self createAndAddButton];
    _button3 = [self createAndAddButton];
    _button4 = [self createAndAddButton];
    _button5 = [self createAndAddButton];

}

- (UIButton *)createAndAddButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//    button.layer.borderWidth = 1;
//    button.layer.borderColor = [UIColor greenColor].CGColor;
//    [button setTitle:@"sdfasf" forState:UIControlStateNormal];
    return button;
}

- (void)buttonTapped:(UIButton *)sender
{
    NSLog(@"%s", __func__);
}

- (void)layoutButtons
{
    // row
    NSString *hFormat = @"H:|-(0)-[_button1]-(0)-[_button2(_button1)]-(0)-[_button3(_button1)]-(0)-[_button4(_button1)]-(0)-[_button5(_button1)]-(0)-|";
    NSDictionary *hViews = NSDictionaryOfVariableBindings(_button1, _button2, _button3, _button4, _button5);
    NSArray *hConstraints = [NSLayoutConstraint
                            constraintsWithVisualFormat:hFormat
                            options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                            metrics:nil
                            views:hViews];
    [self.view addConstraints:hConstraints];
    
    // column
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraint:center];
    
    CGFloat ratio = 750.0 / 181;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = width / ratio;
    
    NSLayoutConstraint *btnHeightConstraint = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    
    [_button1 addConstraint:btnHeightConstraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImages
{
    UIImage *image = [UIImage imageNamed:@"modules"];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 1.0/5, 1) toLayer:_button1.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(1.0/5, 0, 1.0/5, 1) toLayer:_button2.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(2.0/5, 0, 1.0/5, 1) toLayer:_button3.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(3.0/5, 0, 1.0/5, 1) toLayer:_button4.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(4.0/5, 0, 1.0/5, 1) toLayer:_button5.layer];
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
