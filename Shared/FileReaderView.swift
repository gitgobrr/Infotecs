//
//  FileReaderView.swift
//  Infotecs
//
//  Created by sergey on 04.02.2023.
//

import SwiftUI

struct FileReaderView: View {
    @State private var files: [String] = WriteDocument.getFiles()
    @State private var isPresented: Bool = false
    var body: some View {
        List {
            ForEach($files, id: \.self) { fileName in
                NavigationLink {
                    FileView(fileName: fileName.wrappedValue)
                        .navigationTitle(fileName.wrappedValue)
                } label: {
                    HStack {
                        Image(systemName: "doc.text")
                        Text(fileName.wrappedValue)
                    }
                }
            }
            .onDelete { indexSet in
                for i in indexSet {
                    WriteDocument.removeFile(files[i])
                }
                files.remove(atOffsets: indexSet)
            }
        }
        .toolbar {
            Button {
                let newFile = "File \(files.count+1).txt"
                WriteDocument.write(to: newFile, "")
                files.append(newFile)
            } label: {
                Image(systemName: "doc.badge.plus")
            }

        }
    }
}

struct FileReaderView_Previews: PreviewProvider {
    static var previews: some View {
        FileReaderView()
    }
}
