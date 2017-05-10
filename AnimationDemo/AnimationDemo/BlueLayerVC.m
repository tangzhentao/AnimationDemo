//
//  ViewController.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "BlueLayerVC.h"

@interface BlueLayerVC ()

@end

@implementation BlueLayerVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self addBlueLayer];

    
}

- (void)addBlueLayer
{
    self.layerView.frame = CGRectMake(50, 50, 100, 100);
    self.layerView.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.layerView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
