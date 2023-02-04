//
//  FileView.swift
//  Infotecs
//
//  Created by sergey on 04.02.2023.
//

import SwiftUI

struct FileView: View {
    var fileName: String
    @State var fileContents: String
    init(fileName: String) {
        self.fileName = fileName
        self.fileContents = WriteDocument.read(from: fileName)
    }
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Image(systemName: "doc.text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                Text(fileName)
            }
            TextEditor(text: $fileContents)
                .onChange(of: fileContents) { newValue in
                    WriteDocument.write(to: fileName, newValue)
                }
        }
    }
}

struct FileView_Previews: PreviewProvider {
    static var previews: some View {
        FileView(fileName: "filename")
            .padding()
    }
}
