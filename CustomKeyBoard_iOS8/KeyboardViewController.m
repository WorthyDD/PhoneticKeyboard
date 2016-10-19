//
//  KeyboardViewController.m
//  CustomKeyBoard_iOS8
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

/*
 
 _titles = @[@"p", @"t", @"k", @"f", @"θ", @"s", @"ts", @"ʃ", @"tf", @"删除",
             @"b", @"d", @"g", @"v", @"ð", @"z", @"dz", @"ʒ", @"dʒ", @"回车",
             @"m", @"n", @"ŋ", @"l", @"w", @"j", @"h", @"r", @"tr", @"dr", @",",
             @"ɑ:", @"ɔ:", @"u:", @"i:", @"ə:", @"æ", @"ɑi", @"ei", @"ɑu", @"əu", @".",
             @"ʌ", @"ɔ", @"u", @"i", @"ə", @"e", @"iə", @"uə", @"eə", @"ɔi", @"'",
             @"键盘切换", @" ", @"[", @"]"];
 */

#import "KeyboardViewController.h"
#import "CustomKeyBoard.h"
#import "UIView+Toast.h"

@interface KeyboardViewController ()<keyBoardDelelagte>
@property (strong, nonatomic) CustomKeyBoard *keyBoard;

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
    [self.keyBoard.keyButtons[54] addTarget:self action:@selector(handleInputModeListFromView:withEvent:) forControlEvents:UIControlEventAllTouchEvents];
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
    if(tag == 9){
        [self.textDocumentProxy deleteBackward];
    }
    else if(tag == 19){
        //键盘消失
        [self.textDocumentProxy insertText:@"\n"];
//        [self dismissKeyboard];
    }
    else if(tag == 53){
        //英语之音
        [self.view makeToast:@"公益音标全课程, 喜马拉雅<<英语之音>>"];
    }
    else if(tag == 54){
        //切换键盘
        
    }
    else{
        [self.textDocumentProxy insertText:text];
    }
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
