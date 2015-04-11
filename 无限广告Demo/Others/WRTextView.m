//
//  WRTextView.m
//  无限广告Demo
//
//  Created by zjsruxxxy3 on 15/4/11.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "WRTextView.h"

@interface WRTextView ()



@end

@implementation WRTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        self.textColor = [UIColor redColor];

        self.font = [UIFont systemFontOfSize:20];
        
        [self setupPlaceholderLabel];

    }
    
    return self;
    
}

-(void)setupPlaceholderLabel
{
    UILabel *placeHolderLabel = [[UILabel alloc]init];
    
    self.placeholderLabel = placeHolderLabel;
    
    placeHolderLabel.text =self.placeHolderText;
 
    
    placeHolderLabel.frame = CGRectMake(10, 10, 150, 20);

    placeHolderLabel.textColor = [UIColor grayColor];
    
    [self addSubview:placeHolderLabel];
    
    
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
    
}

-(void)setPlaceHolderText:(NSString *)placeHolderText
{
    _placeHolderText = placeHolderText;
    
    [self setupPlaceholderLabel];
    
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
}

-(void)dealloc
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
