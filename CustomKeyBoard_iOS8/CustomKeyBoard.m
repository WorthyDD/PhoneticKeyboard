//
//  CustomKeyBoard.m
//  CustomKeyBoard
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CustomKeyBoard.h"

@interface CustomKeyBoard()

@property (nonatomic) NSArray *titles;
@end
@implementation CustomKeyBoard

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _titles = @[@"æ", @"e", @"w", @"ə", @"r", @"t", @"ʃ", @"u", @"i", @"ɔ", @"p",
                @"ʌ", @"ɑ", @"s", @"d", @"f", @"g", @"h", @"j", @"k", @"l",
                @"ʒ", @"z", @"θ", @"ð", @"v", @"b", @"n", @"m", @"ŋ",
                @":" ,@",", @".", @"'", @"[", @"]", @"Delete",
                @"英语之音", @"🌐", @" ", @"Enter"];
    for(NSInteger i = 0; i < _keyButtons.count;i++){
        UIButton *button = _keyButtons[i];
        button.layer.cornerRadius = 4;
        button.clipsToBounds = YES;
        button.tag = i;
        [button setTitle:_titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didTypeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void) didTypeButton : (UIButton*)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(didTapKeyTag:text:)]){
        [_delegate didTapKeyTag:sender.tag text:sender.titleLabel.text];
    }
}

@end
