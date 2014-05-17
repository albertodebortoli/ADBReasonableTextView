//
//  ADBCursoredText.h
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 18/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADBCursoredText : NSObject

@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, assign, readonly) NSUInteger caretPosition;

+ (instancetype)cursoredTextWithText:(NSString *)text caretPosition:(NSUInteger)caretPosition;

- (NSString *)prefix;
- (NSString *)suffix;

- (BOOL)isEqualToCursoredText:(ADBCursoredText *)object;

@end
