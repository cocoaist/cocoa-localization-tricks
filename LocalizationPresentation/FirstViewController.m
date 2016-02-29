//
//  FirstViewController.m
//  LocalizationPresentation
//
//  Created by Cemal Eker on 29/02/16.
//  Copyright © 2016 Cemal Eker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, readonly) UILabel *label1;
@property (nonatomic, readonly) UILabel *label2;
@property (nonatomic, readonly) UILabel *label3;


- (void)setupTitles;

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
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    [_label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [container addSubview:_label1];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[_label1]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_label1)]];

    _label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [_label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_label2 setLineBreakMode:NSLineBreakByWordWrapping];
    [_label2 setNumberOfLines:0];
    [container addSubview:_label2];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[_label2]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_label2)]];

    
    _label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    [_label3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_label3 setNumberOfLines:0];
    [_label3 setLineBreakMode:NSLineBreakByWordWrapping];
    [container addSubview:_label3];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-[_label3]-|"
                               options:NSLayoutFormatAlignAllCenterY
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_label3)]];
    
    [container addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-[_label1]-20.0-[_label2]-20.0-[_label3]-|"
                               options:NSLayoutFormatAlignAllCenterX
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_label1, _label2, _label3)]];
    
    [self setupTitles];
    
}

- (void)setupTitles {
    [self.label1 setText:NSLocalizedString(@"Welcome!", @"Say welcome to the user")];
    
    [@"SITKI" lowercaseString]; //sitki
    
    [@"SITKI" lowercaseStringWithLocale:[NSLocale autoupdatingCurrentLocale]]; //sıtkı
    [@"SITKI" localizedLowercaseString]; // sıtkı when locale is tr_TR
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formatter setDateFormat:@"MMMM"];
    
    NSDictionary *boldAttributes = @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0] };
    
    NSString *title2 = [NSString stringWithFormat:NSLocalizedString(@"|%@| is this months name.", nil),
                        [formatter stringFromDate:[NSDate date]]];
    
    NSArray *title2Components = [title2 componentsSeparatedByString:@"|"];
    
    NSMutableAttributedString *title2AttributedString = [[NSMutableAttributedString alloc] init];
    
    [title2AttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:title2Components[0]]];
    [title2AttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:title2Components[1]
                                                                                   attributes:boldAttributes]];
    [title2AttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:title2Components[2]]];

    
    [self.label2 setAttributedText:title2AttributedString];
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [currentCalendar components:(NSCalendarUnitEra
                                                                | NSCalendarUnitYear
                                                                | NSCalendarUnitMonth)
                                                      fromDate:[NSDate date]];
    
    [components setDay:1];
    [components setMonth:components.month+1];
    [components setDay:components.day-1];
    
    NSString *numberOfDaysString = NSLocalizedString(@"In |%@| there are |%U| days this year.", nil);
    
    NSString *title3Part1 = [NSString stringWithFormat:
                             numberOfDaysString,
                             [formatter stringFromDate:[NSDate date]],
                             [currentCalendar component:NSCalendarUnitDay
                                               fromDate:[currentCalendar dateFromComponents:components]]];
    
    NSArray *title3Part1Components = [title3Part1 componentsSeparatedByString:@"|"];

    NSMutableAttributedString *title3AttributedString = [[NSMutableAttributedString alloc] init];
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part1Components[0]]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part1Components[1] attributes:boldAttributes]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part1Components[2]]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part1Components[3] attributes:boldAttributes]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part1Components[4]]];
    
    [title3AttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    
    NSString *currentDayString = NSLocalizedString(@"We are on |%U|. day of |%@|.", nil);
    
    NSString *title3Part2 = [NSString stringWithFormat:
                        currentDayString,
                        [currentCalendar component:NSCalendarUnitDay
                                          fromDate:[NSDate date]],
                        [formatter stringFromDate:[NSDate date]]];
    
    NSArray *title3Part2Components = [title3Part2 componentsSeparatedByString:@"|"];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part2Components[0]]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part2Components[1] attributes:boldAttributes]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part2Components[2]]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part2Components[3] attributes:boldAttributes]];
    
    [title3AttributedString appendAttributedString:
     [[NSAttributedString alloc] initWithString:title3Part2Components[4]]];


    
    [self.label3 setAttributedText:title3AttributedString];
//    [self.label3 setText:[@[title3Part1, title3Part2] componentsJoinedByString:@" "]];
}

@end
