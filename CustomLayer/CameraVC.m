//
//  CameraVC.m
//  CustomLayer
//
//  Created by 乐培培 on 2018/7/6.
//  Copyright © 2018年 乐培培. All rights reserved.
//

#import "CameraVC.h"
#import <AVFoundation/AVFoundation.h>


@interface CameraVC ()
//device
@property (nonatomic , strong) AVCaptureDevice *device;
//input
@property (nonatomic , strong) AVCaptureDeviceInput *input;
//output
@property (nonatomic , strong) AVCaptureStillImageOutput *output;
//session
@property (nonatomic , strong) AVCaptureSession *session;
//previewLayer
@property (nonatomic , strong) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation CameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.device = [self getCaptureDeviceWithCapturePosition:AVCaptureDevicePositionBack];
    [self previewLayer];
    [self.session startRunning];
}

- (AVCaptureDevice *)getCaptureDeviceWithCapturePosition:(AVCaptureDevicePosition )position {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *de in devices) {
        if (position == de.position) {
            return de;
        }
    }
    return nil;
}

#pragma mark lazy
- (AVCaptureDeviceInput *)input {
    if (!_input) {
        _input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
    }
    return _input;
}

-  (AVCaptureStillImageOutput *)output {
    if (!_output) {
        _output = [[AVCaptureStillImageOutput alloc]init];
    }
    return _output;
}

- (AVCaptureSession *)session {
    if (!_session) {
        _session = [[AVCaptureSession alloc]init];
        if ([_session canAddInput:self.input]) {
            [_session addInput:self.input];
        }
        if ([_session canAddOutput:self.output]) {
            [_session addOutput:self.output];
        }
    }
    return _session;
}

- (AVCaptureVideoPreviewLayer *)previewLayer {
    if (!_previewLayer) {
        _previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
        [_previewLayer setFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 400, 400);
        layer.contents = (id)[UIImage imageNamed:@"T恤"].CGImage;
        layer.backgroundColor = [UIColor colorWithRed:1/ 255.0 green:1/ 255.0 blue:1/ 255.0 alpha:0].CGColor;
        _previewLayer.mask = layer;
        
        [self.view.layer addSublayer: _previewLayer];
    }
    return _previewLayer;
}

@end
