//
//  ViewController.m
//  CustomLayer
//
//  Created by 乐培培 on 2018/7/6.
//  Copyright © 2018年 乐培培. All rights reserved.
//

#import "ViewController.h"
#import "CameraVC.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *firstIV;
@property (weak, nonatomic) IBOutlet UIImageView *secondIV;
@property (weak, nonatomic) IBOutlet UIImageView *thirdIV;
@property (weak, nonatomic) IBOutlet UIImageView *forthIV;

//firstLayer
@property (nonatomic , strong) CALayer *Layer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self Layer1];
    
    self.firstIV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToCamePage)];
    [self.firstIV addGestureRecognizer:tapGesture];
    
    
}

- (void)jumpToCamePage {
    [self.navigationController pushViewController:[CameraVC new] animated:YES];
}

#pragma mark lazy
- (CALayer *)Layer1 {
    if (!_Layer1) {
        _Layer1 = [CALayer layer];
        _Layer1.frame = CGRectMake(0, 0, CGRectGetWidth(self.firstIV.frame), CGRectGetHeight(self.firstIV.frame));
        _Layer1.contents = (id)[UIImage imageNamed:@"T恤"].CGImage;
        _Layer1.backgroundColor = [UIColor colorWithRed:1 / 255.0 green:1 / 255.0 blue:1 / 255.0 alpha:0.2].CGColor;
        self.firstIV.layer.mask = _Layer1;
    }
    return _Layer1;
}

@end
