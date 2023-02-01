//
//  WriteDocument.m
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#import "WriteDocument.h"
#import "WriteDocumentCPP.h"

@implementation WriteDocument
+(NSString* )readDoc {
    return [NSString stringWithCString:WriteDocumentCPP::readTxt().c_str() encoding:NSUTF8StringEncoding];
}
+(void) writeDoc:(NSString*) withText {
    WriteDocumentCPP::writeTxt([withText cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end
