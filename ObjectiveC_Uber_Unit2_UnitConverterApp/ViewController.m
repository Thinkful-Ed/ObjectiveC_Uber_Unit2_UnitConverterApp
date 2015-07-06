//
//  ViewController.m
//  ObjectiveC_Uber_Unit2_UnitConverterApp
//
//  Created by Craig on 6/07/2015.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) UISlider *celsiusSlider;
@property (weak, nonatomic) UILabel *celsiusLabel;
@property (weak, nonatomic) UILabel *fahrenheitLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISlider *celsiusSlider = [UISlider new];
    UILabel *celsiusLabel = [UILabel new];
    UILabel *fahrenheitLabel = [UILabel new];
    [self.view addSubview:celsiusSlider];
    [self.view addSubview:celsiusLabel];
    [self.view addSubview:fahrenheitLabel];
    self.celsiusSlider = celsiusSlider;
    self.celsiusLabel = celsiusLabel;
    self.fahrenheitLabel = fahrenheitLabel;
    
    self.celsiusSlider.minimumValue = -100;
    self.celsiusSlider.maximumValue = 100;
    [self.celsiusSlider addTarget:self action:@selector(changedSlider) forControlEvents:UIControlEventValueChanged];
    
    self.celsiusLabel.text = @"0°C";
    self.fahrenheitLabel.text = @"32°F";
    
    CGFloat leadingOffset = 16;
    CGFloat trailingOffset = -16;
    CGFloat verticalSpace = 16;
    
    [self.celsiusSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.celsiusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *topLayoutGuide = (id)self.topLayoutGuide;
        make.top.equalTo(topLayoutGuide.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.fahrenheitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.celsiusLabel.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changedSlider {
    //TODO: update labels
}

@end