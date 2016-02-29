//
//  FirstViewController.m
//  LocalizationPresentation
//
//  Created by Cemal Eker on 29/02/16.
//  Copyright © 2016 Cemal Eker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectZero];
    [container setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:container];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[container]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(container)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:container
                                                          attribute:NSLayoutAttributeCenterYWithinMargins
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterYWithinMargins
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label1 setText:NSLocalizedString(@"Welcome!", nil)];
    [container addSubview:label1];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[label1]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(label1)]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formatter setDateFormat:@"MMMM"];
    
    NSString *title2 = [NSString stringWithFormat:NSLocalizedString(@"We a in the month of %@", nil),
                        [formatter stringFromDate:[NSDate date]]];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label2 setText:title2];
    [label2 setLineBreakMode:NSLineBreakByWordWrapping];
    [label2 setNumberOfLines:0];
    [container addSubview:label2];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[label2]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(label2)]];
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];

    NSDateComponents *components = [currentCalendar components:(NSCalendarUnitEra
                                                                | NSCalendarUnitYear
                                                                | NSCalendarUnitMonth)
                                                      fromDate:[NSDate date]];
    
    [components setDay:1];
    [components setMonth:components.month+1];
    [components setDay:components.day-1];
    
    NSString *title3Part1 = [NSString stringWithFormat:
                             NSLocalizedString(@"In %@ there are %U days this year.", nil),
                             [formatter stringFromDate:[NSDate date]],
                             [currentCalendar component:NSCalendarUnitDay
                                               fromDate:[currentCalendar dateFromComponents:components]]];
    
    NSString *title3Part2 = [NSString stringWithFormat:
                        NSLocalizedString(@"We are on %U day of %@.", nil),
                        [currentCalendar component:NSCalendarUnitDay
                                          fromDate:[NSDate date]],
                        [formatter stringFromDate:[NSDate date]]];

    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label3 setText:[@[title3Part1, title3Part2] componentsJoinedByString:@" "]];
    [label3 setNumberOfLines:0];
    [label3 setLineBreakMode:NSLineBreakByWordWrapping];
    [container addSubview:label3];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[label3]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(label3)]];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-[label1]-20.0-[label2]-20.0-[label3]-|"
                               options:NSLayoutFormatAlignAllCenterX
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(label1, label2, label3)]];


}

@end
