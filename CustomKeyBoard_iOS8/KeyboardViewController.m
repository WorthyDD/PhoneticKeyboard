//
//  KeyboardViewController.m
//  CustomKeyBoard_iOS8
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

/*
 
 _titles = @[@"æ", @"e", @"w", @"ə", @"r", @"t", @"ʃ", @"u", @"Delete",
            @"i", @"ɔ", @"p", @"ʌ", @"ɑ", @"s", @"d", @"[", @"]",
            @"f", @"g", @"h", @"j", @"k", @"l", @"ʒ", @":", @"'",
            @"z", @"θ", @"ð", @"v", @"b", @"n", @"m", @"ŋ", @",",
            @"英语之音", @"🌐", @" ", @".", @"Enter"];
 */

#import "KeyboardViewController.h"
#import "CustomKeyBoard.h"
#import "UIView+Toast.h"

@interface KeyboardViewController ()<keyBoardDelelagte>
@property (strong, nonatomic) CustomKeyBoard *keyBoard;

@property (nonatomic, assign) BOOL isDeletePress;
@property (nonatomic) NSTimer *timer;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}
//-(CustomKeyBoard *)keyBoard{
//    if (_keyBoard) {
//        _keyBoard = [[[NSBundle mainBundle] loadNibNamed:@"CustomKeyBoard" owner:nil options:nil] firstObject];
//    }
//    return _keyBoard;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.keyBoard = [[[NSBundle mainBundle] loadNibNamed:@"CustomKeyBoard" owner:nil options:nil] firstObject];
    self.inputView = self.keyBoard;
    self.keyBoard.delegate = self;
    [self.keyBoard.keyButtons[38] addTarget:self action:@selector(handleInputModeListFromView:withEvent:) forControlEvents:UIControlEventAllTouchEvents];
    [self.keyBoard.keyButtons[36] addTarget:self action:@selector(deleteButtonPress:) forControlEvents:UIControlEventTouchDown];
    [self.keyBoard.keyButtons[36] addTarget:self action:@selector(deleteButtonUpPress:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside|UIControlEventTouchDragInside];
    
    CGFloat _expandedHeight = 230;
    NSLayoutConstraint *_heightConstraint =      [NSLayoutConstraint constraintWithItem: self.view      attribute: NSLayoutAttributeHeight      relatedBy: NSLayoutRelationEqual      toItem: nil      attribute: NSLayoutAttributeNotAnAttribute      multiplier: 0.0      constant: _expandedHeight];
    _heightConstraint.active = YES;
//    [self addActionToKeyBoard];
   
}


- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    
}

#pragma Mark Keyboards Action 

- (void)didTapKeyTag:(NSInteger)tag text:(NSString *)text
{
    if(tag == 36){
        //[self.textDocumentProxy deleteBackward];
    }
    else if(tag == 40){
        //键盘消失
        [self.textDocumentProxy insertText:@"\n"];
//        [self dismissKeyboard];
    }
    else if(tag == 37){
        //英语之音
        [self.view makeToast:@"公益音标全课程, 喜马拉雅<<英语之音>>"];
    }
    else if(tag == 38){
        //切换键盘
        
    }
    else{
        [self.textDocumentProxy insertText:text];
    }
}


- (void) deleteButtonPress : (id)sender
{
    NSLog(@"in");
//    UIButton *b = (UIButton *)sender;
//    [b setTitle:@"按下" forState:UIControlStateNormal];
    [self.textDocumentProxy deleteBackward];
    if(!_timer){
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self.textDocumentProxy deleteBackward];
        }];
    }

}

- (void) deleteButtonUpPress : (id)sender
{
    NSLog(@"out");
//    UIButton *b = (UIButton *)sender;
//    [b setTitle:@"松开" forState:UIControlStateNormal];
    _isDeletePress = NO;
    [_timer invalidate];
    _timer = nil;
    
}

-(void)clearButtonTapped{
    [self.textDocumentProxy deleteBackward];
}

-(void)deletButtonTapped{
    [self.textDocumentProxy insertText:@"/n"];
}

-(void)spaceButtonTapped{
    [self.textDocumentProxy insertText:@" "];
}

-(void)buttonTapped:(UIButton *)button{
    [self.textDocumentProxy insertText:[button currentTitle]];
}



















@end
