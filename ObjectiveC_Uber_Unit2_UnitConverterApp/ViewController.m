//
//  ViewController.m
//  ObjectiveC_Uber_Unit2_UnitConverterApp
//
//  Created by Craig on 6/07/2015.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TemperatureConverter.h"

@interface ViewController ()

@property (weak, nonatomic) UIPickerView *celsiusPickerView;
@property (weak, nonatomic) UILabel *celsiusLabel;
@property (weak, nonatomic) UILabel *fahrenheitLabel;
@property (strong, nonatomic) NSArray *celsiusNumbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up celsiusNumbers -> to be displayed by UIPickerView's dataSource.
    NSMutableArray *mutableCelsiusNumbers = [NSMutableArray new];
    for (int i=-100; i<=100; i++) {
        [mutableCelsiusNumbers addObject:@(i)];
    }
    self.celsiusNumbers = [mutableCelsiusNumbers copy];
    
    //set up visual components
    self.view.backgroundColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:0.18 alpha:1.0];
    
    UIPickerView *celsiusPickerView = [UIPickerView new];
    UILabel *celsiusLabel = [UILabel new];
    UILabel *fahrenheitLabel = [UILabel new];
    [self.view addSubview:celsiusPickerView];

    [self.view addSubview:celsiusLabel];
    [self.view addSubview:fahrenheitLabel];
    self.celsiusPickerView = celsiusPickerView;
    self.celsiusLabel = celsiusLabel;
    self.fahrenheitLabel = fahrenheitLabel;
    
    UIColor *color = [UIColor colorWithHue:0.22 saturation:1.0 brightness:0.9 alpha:1.0];
    celsiusPickerView.backgroundColor = [UIColor whiteColor];
    
    self.celsiusLabel.text = @"0°C";
    self.fahrenheitLabel.text = @"32°F";
    
    [self.celsiusLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.celsiusLabel.textColor = color;
    self.celsiusLabel.textAlignment = NSTextAlignmentRight;
    [self.fahrenheitLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.fahrenheitLabel.textColor = color;
    self.fahrenheitLabel.textAlignment = NSTextAlignmentRight;
    
    CGFloat leadingOffset = 16;
    CGFloat trailingOffset = -16;
    CGFloat verticalSpace = 16;
    
    [self.celsiusPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
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
    
    //protocols/delegates
    self.celsiusPickerView.delegate = self;
    self.celsiusPickerView.dataSource = self;
    
    [self.celsiusPickerView selectRow:100 inComponent:0 animated:NO];
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSNumber *celsiusNumber = [self.celsiusNumbers objectAtIndex:row];
    float celsiusFloat = [celsiusNumber floatValue];
    [self updateTemperatureLabelsWithCelsiusValue:celsiusFloat];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSNumber *celsiusNumber = [self.celsiusNumbers objectAtIndex:row];
    int celsiusInt = [celsiusNumber intValue];
    return [NSString stringWithFormat:@"%d°C", celsiusInt];
}

#pragma mark- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.celsiusNumbers.count;
}




- (void)updateTemperatureLabelsWithCelsiusValue:(float)celsius {
    float fahrenheit = [TemperatureConverter celsiusToFahrenheight:celsius];
    
    self.celsiusLabel.text = [NSString stringWithFormat:@"%.02f°C", celsius];
    self.fahrenheitLabel.text = [NSString stringWithFormat:@"%.02f°F", fahrenheit];
}



- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end