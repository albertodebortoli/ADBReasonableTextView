ADBReasonableTextView
=====================

A UITextView replacement with reasonable delegate methods. 

``` objective-c
@protocol ADBReasonableTextViewDelegate <NSObject>

- (void)reasonableTextView:(ADBReasonableTextView *)textView
            willChangeText:(BMYCursoredText *)currentText
                    toText:(BMYCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (void)reasonableTextView:(ADBReasonableTextView *)textView
             didChangeText:(BMYCursoredText *)previousText
                    toText:(BMYCursoredText *)currentText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (void)reasonableTextView:(ADBReasonableTextView *)textView
        didChangeSelection:(NSRange)previousSelection
               toSelection:(NSRange)finalSelection;

- (void)reasonableTextViewDidBeginEditing:(ADBReasonableTextView *)textView;
- (void)reasonableTextViewDidEndEditing:(ADBReasonableTextView *)textView;

@end
```

``` objetive-c
@protocol ADBReasonableTextViewDataSource <NSObject>

- (BOOL)reasonableTextView:(ADBReasonableTextView *)textView
          shouldChangeText:(BMYCursoredText *)currentText
                    toText:(BMYCursoredText *)finalText
          substitutionText:(NSString *)substitutionText
                     range:(NSRange)range;

- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange;
- (BOOL)reasonableTextView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange;
- (BOOL)reasonableTextViewShouldBeginEditing:(ADBReasonableTextView *)textView;
- (BOOL)reasonableTextViewShouldEndEditing:(ADBReasonableTextView *)textView;

@end
```

# License

Licensed under the New BSD License.

Copyright (c) 2014, Alberto De Bortoli
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Alberto De Bortoli nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Alberto De Bortoli BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Resources

Info can be found on [my website](http://www.albertodebortoli.it), [and on Twitter](http://twitter.com/albertodebo).