//
//  ADBCursoredTextTests.m
//  ADBReasonableTextView
//
//  Created by Alberto De Bortoli on 18/05/2014.
//  Copyright (c) 2014 Alberto De Bortoli. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ADBCursoredText.h"

@interface BMYCursoredTextTests : XCTestCase

@end

@implementation BMYCursoredTextTests

- (void)test_GivenValidTextAndValidCaretPosition_WhenCreatedCursoredText_ThenCursoredTextIsProperlyCreated {
    ADBCursoredText *cursoredText = [ADBCursoredText cursoredTextWithText:@"I want to watch Game of Thrones tonight" caretPosition:31];
    XCTAssertEqualObjects(cursoredText.text, @"I want to watch Game of Thrones tonight");
    XCTAssertEqual(cursoredText.caretPosition, 31);
}

- (void)test_GivenValidTextAndNotValidCaretPosition_WhenCreatedCursoredText_ThenCursoredTextIsProperlyCreated {
    ADBCursoredText *cursoredText = [ADBCursoredText cursoredTextWithText:@"I want to watch Game of Thrones tonight" caretPosition:131];
    XCTAssertEqualObjects(cursoredText.text, @"I want to watch Game of Thrones tonight");
    XCTAssertEqual(cursoredText.caretPosition, 39);
}

- (void)test_GivenNilValidTextAndNotValidCaretPosition_WhenCreatedCursoredText_ThenCursoredTextIsProperlyCreated {
    ADBCursoredText *cursoredText = [ADBCursoredText cursoredTextWithText:nil caretPosition:131];
    XCTAssertEqualObjects(cursoredText.text, @"");
    XCTAssertEqual(cursoredText.caretPosition, 0);
}

- (void)test_GivenValidCursoredText_WhenAskedForThePrefix_ThenCorrectPrefixIsReturned {
    ADBCursoredText *cursoredText = [ADBCursoredText cursoredTextWithText:@"I want to watch Game of Thrones tonight" caretPosition:31];
    XCTAssertEqualObjects([cursoredText prefix], @"I want to watch Game of Thrones");
}

- (void)test_GivenValidCursoredText_WhenAskedForTheSuffix_ThenCorrectSuffixIsReturned {
    ADBCursoredText *cursoredText = [ADBCursoredText cursoredTextWithText:@"I want to watch Game of Thrones tonight" caretPosition:31];
    XCTAssertEqualObjects([cursoredText suffix], @" tonight");
}

@end
