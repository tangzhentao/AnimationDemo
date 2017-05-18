//
//  GroupOpaqueVC.m
//  AnimationDemo
//
//  Created by tang on 2017/5/18.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "GroupOpaqueVC.h"

@interface GroupOpaqueVC ()

@end

@implementation GroupOpaqueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNormalButton];
    
    [self addSubviewButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)addNormalButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 100, 100, 40)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"hello world" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    button.layer.cornerRadius = 10;
    button.autoresizingMask = YES;
    button.alpha = 0.5;
    [self.view addSubview:button];
    
}

- (void)addSubviewButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(180, 100, 100, 40)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"hello world" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 10;
    button.autoresizingMask = YES;
    button.alpha = 0.5;
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    label.center = button.center;
    
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
