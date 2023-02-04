//
//  WriteDocument.m
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#import "WriteDocument.h"
#import "WriteDocumentCPP.h"

@implementation WriteDocument
+ (NSArray<NSString *> *)getFiles {
    NSMutableArray *arr = [NSMutableArray array];
    auto [files, count] = WriteDocumentCPP::getFiles();
    for (int i = 0; i < count; i++) {
        [arr addObject: [NSString stringWithCString:files[i].c_str() encoding:NSUTF8StringEncoding]];
    }
    return arr;
}
+ (NSString *)readFrom:(NSString *)fileName {
    string fileContents = WriteDocumentCPP::readFrom([fileName cStringUsingEncoding: NSUTF8StringEncoding]);
    return [NSString stringWithCString:fileContents.c_str() encoding:NSUTF8StringEncoding];
}
+ (void)writeTo:(NSString *)fileName :(NSString *)withText {
    WriteDocumentCPP::writeTo([fileName cStringUsingEncoding:NSUTF8StringEncoding],
                                [withText cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end
