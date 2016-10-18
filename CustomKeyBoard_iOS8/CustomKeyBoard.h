//
//  CustomKeyBoard.h
//  CustomKeyBoard
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol keyBoardDelelagte <NSObject>

- (void) didTapKeyTag : (NSInteger) tag text : (NSString *)text;

@end


@interface CustomKeyBoard : UIInputView

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keyButtons;
@property (nonatomic, weak) id<keyBoardDelelagte> delegate;

@end
