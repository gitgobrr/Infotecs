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
+(NSString *) readDoc;
+(void) writeDoc:(NSString*) withText;
@end

#endif /* WriteDocument_h */
