//
//  WRTextView.h
//  无限广告Demo
//
//  Created by zjsruxxxy3 on 15/4/11.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRTextView : UITextView

@property(nonatomic,weak)UILabel *placeholderLabel;

@property(nonatomic,strong)UIColor *placeholderColor;

@property(nonatomic,assign)CGSize placeholderTextSize;

@property(nonatomic,copy)NSString *placeHolderText;


@end
