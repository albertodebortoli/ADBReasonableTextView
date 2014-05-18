//
//  ADBReasonableTextView.m
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 17/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import "ADBReasonableTextView.h"

@interface ADBReasonableTextView ()

@property (nonatomic, copy) NSString *previousText;
@property (nonatomic, assign) NSRange previousRange;
@property (nonatomic, copy) NSString *substitutionText;

@end

@implementation ADBReasonableTextView

#pragma mark - Public Methods

- (void)setDelegate:(id<UITextViewDelegate>)delegate
{
    [super setDelegate:self];
}

- (void)setReasonableDelegate:(id<ADBReasonableTextViewDelegate>)reasonableDelegate
{
    self.delegate = self;
    if (_reasonableDelegate != reasonableDelegate) {
        _reasonableDelegate = reasonableDelegate;
    }
}

- (ADBCursoredText *)currentCursoredText
{
    return [ADBCursoredText cursoredTextWithText:self.text caretPosition:self.selectedRange.location + self.selectedRange.length];
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    BOOL retVal = YES;
    if ([self.reasonableDataSource respondsToSelector:@selector(reasonableTextViewShouldBeginEditing:)]) {
        [self.reasonableDataSource reasonableTextViewShouldBeginEditing:self];
    }
    return retVal;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    BOOL retVal = YES;
    if ([self.reasonableDataSource respondsToSelector:@selector(reasonableTextViewShouldEndEditing:)]) {
        [self.reasonableDataSource reasonableTextViewShouldEndEditing:self];
    }
    return retVal;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.reasonableDelegate respondsToSelector:@selector(reasonableTextViewDidBeginEditing:)]) {
        [self.reasonableDelegate reasonableTextViewDidBeginEditing:self];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.reasonableDelegate respondsToSelector:@selector(reasonableTextViewDidEndEditing:)]) {
        [self.reasonableDelegate reasonableTextViewDidEndEditing:self];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    self.previousText = self.text;
    self.previousRange = range;
    self.substitutionText = text;
    
    ADBCursoredText *currentCursoredText = [ADBCursoredText cursoredTextWithText:self.text
                                                                   caretPosition:self.selectedRange.location + self.selectedRange.length];
    NSString *finalText = [self.text stringByReplacingCharactersInRange:range withString:text];
    
    ADBCursoredText *finalCursoredText = [ADBCursoredText cursoredTextWithText:finalText
                                                                 caretPosition:range.location + [text length]];
    
    BOOL retVal = YES;

    if ([self.reasonableDataSource respondsToSelector:@selector(reasonableTextView:willChangeText:toText:substitutionText:range:)]) {
        retVal = [self.reasonableDataSource reasonableTextView:self
                                              shouldChangeText:currentCursoredText
                                                        toText:finalCursoredText
                                              substitutionText:text
                                                         range:range];
    }
    
    if (retVal) {
        if ([self.reasonableDelegate respondsToSelector:@selector(reasonableTextView:willChangeText:toText:substitutionText:range:)]) {
            [self.reasonableDelegate reasonableTextView:self
                                         willChangeText:currentCursoredText
                                                 toText:finalCursoredText
                                       substitutionText:text
                                                  range:range];
        }
    }
    
    return retVal;
}

- (void)textViewDidChange:(UITextView *)textView
{
    ADBCursoredText *previousCursoredText = [ADBCursoredText cursoredTextWithText:self.previousText
                                                                    caretPosition:self.previousRange.location + self.previousRange.length];
    ADBCursoredText *currentCursoredText = [self currentCursoredText];
    
    if ([self.reasonableDelegate respondsToSelector:@selector(reasonableTextView:didChangeText:toText:substitutionText:range:)]) {
        [self.reasonableDelegate reasonableTextView:self
                                      didChangeText:previousCursoredText
                                             toText:currentCursoredText
                                   substitutionText:self.substitutionText
                                              range:self.previousRange];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if ([self.reasonableDelegate respondsToSelector:@selector(reasonableTextView:didChangeSelection:toSelection:)]) {
        [self.reasonableDelegate reasonableTextView:self
                                 didChangeSelection:self.previousRange
                                        toSelection:self.selectedRange];
    }
    self.previousRange = self.selectedRange;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if ([self.reasonableDataSource respondsToSelector:@selector(reasonableTextView:shouldInteractWithURL:inRange:)]) {
        return [self.reasonableDataSource reasonableTextView:self shouldInteractWithURL:URL inRange:characterRange];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    if ([self.reasonableDataSource respondsToSelector:@selector(reasonableTextView:shouldInteractWithTextAttachment:inRange:)]) {
        return [self.reasonableDataSource reasonableTextView:self shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    return YES;
}

@end
