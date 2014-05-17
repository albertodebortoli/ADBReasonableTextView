//
//  ADBCursoredText.m
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 18/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import "ADBCursoredText.h"

@interface ADBCursoredText ()

@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, assign, readwrite) NSUInteger caretPosition;

@end

@implementation ADBCursoredText

+ (instancetype)cursoredTextWithText:(NSString *)text caretPosition:(NSUInteger)caretPosition {
    ADBCursoredText *retVal = [[self alloc] initWithText:text caretPosition:caretPosition];
    return retVal;
}

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (instancetype)initWithText:(NSString *)text caretPosition:(NSUInteger)caretPosition {
    if ((self = [super init])) {
        _text = text ?: @"";
        _caretPosition = MIN(caretPosition, [text length]);
    }
    return self;
}

#pragma mark - Equality

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    return [self isEqualToCursoredText:(ADBCursoredText *)object];
}

- (BOOL)isEqualToCursoredText:(ADBCursoredText *)object {
    if (!object) {
        return NO;
    }
    
    BOOL objectsMatch = [_text isEqualToString:object.text] && _caretPosition == object.caretPosition;
    return objectsMatch;
}

- (NSUInteger)hash {
    return [_text hash] ^ _caretPosition;
}

#pragma mark - Description

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, cursored text: %@|%@>", NSStringFromClass([self class]), self, [self prefix], [self suffix]];
}

#pragma mark - Public Methods

- (NSString *)prefix {
    return [_text substringToIndex:_caretPosition];
}

- (NSString *)suffix {
    return [_text substringFromIndex:_caretPosition];
}

@end
