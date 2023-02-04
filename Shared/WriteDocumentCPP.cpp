//
//  WriteDocument.cpp
//  InfotecsTest
//
//  Created by sergey on 01.02.2023.
//

#include "WriteDocumentCPP.h"

bool has_suffix(const std::string &str, const std::string &suffix)
{
    return str.size() >= suffix.size() &&
           str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0;
}

int filesCount(filesystem::path path)
{
    int counter = 0;
    for (const auto & entry : fs::directory_iterator(path)) {
        if ( has_suffix(entry.path().filename(), ".txt") ) {
            counter += 1;
        }
    }
    return counter;
}

tuple<string*,int> WriteDocumentCPP::getFiles() {
    char buffer[256];
    
    strcpy(buffer,getenv("HOME"));
    strcat(buffer,"/Documents/");
    string *strs = NULL;
    strs = new string[filesCount(buffer)];
    int counter = 0;
    for (const auto & entry : fs::directory_iterator(buffer)) {
        if ( has_suffix(entry.path().filename(), ".txt") ) {
        strs[counter] = entry.path().filename();
        counter += 1;
        }
    }
    return {strs,counter};
}

string WriteDocumentCPP::readFrom(const char * fileName) {
    char buffer[256];
    //HOME is the home directory of your application
    //points to the root of your sandbox
    strcpy(buffer,getenv("HOME"));
    
    //concatenating the path string returned from HOME
    strcat(buffer,"/Documents/");
    strcat(buffer, fileName);
    fstream f(buffer, fstream::in );
    string s;
    getline( f, s, '\0');
    
    f.close();
    return s;
}

void WriteDocumentCPP::writeTo(const char *fileName, const char *text) {
    char buffer[256];
    
    strcpy(buffer,getenv("HOME"));
    strcat(buffer,"/Documents/");
    strcat(buffer,fileName);
    
    //Creates an empty file for writing
    FILE *f = fopen(buffer,"w");
    
    //Writing something
    fprintf(f, "%s", text);
    
    //Closing the file
    fclose(f);
}
