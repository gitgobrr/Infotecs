//
//  WriteDocument.hpp
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#ifndef WriteDocumentCPP_h
#define WriteDocumentCPP_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<iostream>
#include<fstream>


class WriteDocumentCPP {
public:
    static std::string readTxt(void);
    static void writeTxt(const char * text);
};

#endif /* WriteDocumentCPP_hpp */
