//
//  FileReaderView.swift
//  Infotecs
//
//  Created by sergey on 04.02.2023.
//

import SwiftUI

struct FileReaderView: View {
    @State var textFieldText = ""
    @State var files: [String] = WriteDocument.getFiles()
    var body: some View {
        List {
            ForEach(files, id: \.self) { file in
                FileView(fileName: file)
            }
        }
    }
}

struct FileReaderView_Previews: PreviewProvider {
    static var previews: some View {
        FileReaderView()
    }
}
