//
//  WriteDocument.h
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#ifndef WriteDocument_h
#define WriteDocument_h

#import <Foundation/Foundation.h>

@interface WriteDocument : NSObject
+(NSArray<NSString*>*) getFiles;
+(NSString *) readFrom:(NSString*) fileName;
+(void) writeTo:(NSString*) fileName :(NSString*) withText;
+(void) removeFile:(NSString*) fileName;
@end

#endif /* WriteDocument_h */
