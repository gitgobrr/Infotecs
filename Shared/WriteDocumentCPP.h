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
#include <iostream>
#include <fstream>
#include <filesystem>
#include <tuple>

using namespace std;
namespace fs = filesystem;


class WriteDocumentCPP {
public:
    static string readFrom(const char * fileName);
    static void writeTo(const char * fileName, const char * text);
    static tuple<string*, int> getFiles();
};

#endif /* WriteDocumentCPP_hpp */
