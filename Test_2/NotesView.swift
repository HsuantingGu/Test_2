//
//  Untitled.swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI

struct NotesView: View {
    @State private var notes: [String] = []
    @State private var newNote: String = ""
    
    var body: some View {
            VStack {
                // 输入 + 添加按钮
                HStack {
                    TextField("输入新笔记...", text: $newNote)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button("添加") {
                        if !newNote.isEmpty {
                            notes.append(newNote)
                            newNote = "" // 清空输入框
                        }
                    }
                }
                .padding(.vertical)
                
                // 列表显示所有笔记
                List {
                    ForEach(notes, id: \.self) { note in
                        Text(note)
                    }
                    .onDelete { indexSet in
                        notes.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("备忘录")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

