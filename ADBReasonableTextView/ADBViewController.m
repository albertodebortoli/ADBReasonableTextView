//
//  ADBViewController.m
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 17/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import "ADBViewController.h"
#import "ADBReasonableTextView.h"

@interface ADBViewController () <ADBReasonableTextViewDelegate, ADBReasonableTextViewDataSource>

@property (nonatomic, weak) IBOutlet ADBReasonableTextView *textView;

@end

@implementation ADBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.reasonableDelegate = self;
    self.textView.reasonableDataSource = self;
}

#pragma mark - ADBReasonableTextViewDelegate

- (void)reasonableTextView:(ADBReasonableTextView *)textView
            willChangeText:(ADBCursoredText *)currentText
                    toText:(ADBCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range
{
    NSLog(@"currentText: %@", currentText);
    NSLog(@"finalText: %@", finalText);
    NSLog(@"substitutionText: %@", substitutionText);
    NSLog(@"range: %@", NSStringFromRange(range));
}

- (void)reasonableTextView:(ADBReasonableTextView *)textView
             didChangeText:(ADBCursoredText *)previousText
                    toText:(ADBCursoredText *)currentText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range
{
    NSLog(@"previousText: %@", previousText);
    NSLog(@"currentText: %@", currentText);
    NSLog(@"substitutionText: %@", substitutionText);
    NSLog(@"range: %@", NSStringFromRange(range));
}

- (void)reasonableTextView:(ADBReasonableTextView *)textView
        didChangeSelection:(NSRange)previousSelection
               toSelection:(NSRange)finalSelection
{
    NSLog(@"prev range: %@", NSStringFromRange(previousSelection));
    NSLog(@"curr range: %@", NSStringFromRange(finalSelection));
}

#pragma mark - ADBReasonableTextViewDataSource

- (BOOL)reasonableTextView:(ADBReasonableTextView *)textView
          shouldChangeText:(ADBCursoredText *)currentText
                    toText:(ADBCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range
{
    return YES;
}

- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return YES;
}

- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    return YES;
}

@end
