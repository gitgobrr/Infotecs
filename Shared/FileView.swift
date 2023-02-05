//
//  FileView.swift
//  Infotecs
//
//  Created by sergey on 04.02.2023.
//

import SwiftUI

struct FileView: View {
    private let fileName: String
    private let fileContents: Binding<String>
    init(fileName: String) {
        self.fileName = fileName
        self.fileContents = Binding<String> {
            WriteDocument.read(from: fileName)
        } set: { newValue in
            WriteDocument.write(to: fileName, newValue)
        }
    }
    
    var body: some View {
            TextEditor(text: fileContents)
                .padding(2)
                .font(.body)
                .onChange(of: fileContents.wrappedValue) { newValue in
                    WriteDocument.write(to: fileName, newValue)
                }
    }
}

struct FileView_Previews: PreviewProvider {
    static var previews: some View {
        FileView(fileName: "mytextfile.txt")
    }
}
