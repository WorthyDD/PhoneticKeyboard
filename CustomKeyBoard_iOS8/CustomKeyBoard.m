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
    
    _titles = @[@"p", @"t", @"k", @"f", @"θ", @"s", @"ts", @"ʃ", @"tʃ", @"Delete",
                @"b", @"d", @"g", @"v", @"ð", @"z", @"dz", @"ʒ", @"dʒ", @"Return",
                @"m", @"n", @"ŋ", @"l", @"w", @"j", @"h", @"r", @"tr", @"dr", @",",
                @"ɑ:", @"ɔ:", @"u:", @"i:", @"ə:", @"æ", @"ɑi", @"ei", @"ɑu", @"əu", @".",
                @"ʌ", @"ɔ", @"u", @"i", @"ə", @"e", @"iə", @"uə", @"eə", @"ɔi", @"'",
                @"英语之音", @"🌐", @" ", @"[", @"]"];
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
