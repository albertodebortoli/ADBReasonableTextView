//
//  ADBReasonableTextView.h
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 17/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBCursoredText.h"

@class ADBReasonableTextView;

@protocol ADBReasonableTextViewDelegate <NSObject>

- (void)reasonableTextView:(ADBReasonableTextView *)textView
            willChangeText:(ADBCursoredText *)currentText
                    toText:(ADBCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (void)reasonableTextView:(ADBReasonableTextView *)textView
             didChangeText:(ADBCursoredText *)previousText
                    toText:(ADBCursoredText *)currentText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (void)reasonableTextView:(ADBReasonableTextView *)textView
        didChangeSelection:(NSRange)previousSelection
               toSelection:(NSRange)finalSelection;

@end

@protocol ADBReasonableTextViewDataSource <NSObject>

- (BOOL)reasonableTextView:(ADBReasonableTextView *)textView
          shouldChangeText:(ADBCursoredText *)currentText
                    toText:(ADBCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange;
- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange;

@end

@interface ADBReasonableTextView : UITextView <UITextViewDelegate>

@property (nonatomic, weak) id<ADBReasonableTextViewDelegate> reasonableDelegate;
@property (nonatomic, weak) id<ADBReasonableTextViewDataSource> reasonableDataSource;

@property (nonatomic, strong, readonly) ADBCursoredText *currentCursoredText;

@end
