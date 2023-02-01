//
//  WriteDocument.cpp
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#include "WriteDocumentCPP.h"

std::string WriteDocumentCPP::readTxt() {
    char buffer[256];
    //HOME is the home directory of your application
    //points to the root of your sandbox
    strcpy(buffer,getenv("HOME"));
    
    //concatenating the path string returned from HOME
    strcat(buffer,"/Documents/myfile.txt");
    std::fstream f(buffer, std::fstream::in );
    std::string s;
    getline( f, s, '\0');
    
    f.close();
    return s;
}

void WriteDocumentCPP::writeTxt(const char * text) {
    char buffer[256];
    //HOME is the home directory of your application
    //points to the root of your sandbox
    strcpy(buffer,getenv("HOME"));
    
    //concatenating the path string returned from HOME
    strcat(buffer,"/Documents/myfile.txt");
    
    
    //Creates an empty file for writing
    FILE *f = fopen(buffer,"w");
    
    //Writing something
    fprintf(f, "%s", text);
    
    //Closing the file
    fclose(f);
}
