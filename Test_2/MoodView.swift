//
//  MoodView.swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI

struct MoodView: View {
    // 保存当前选择的心情（持久化）
    @AppStorage("selectedMood") private var selectedMood: String = "🙂"
    
    // 心情选项
    let moods = ["😄", "🙂", "😐", "😢", "😡"]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("今日心情")
                .font(.largeTitle)
                .bold()
            
            Text(selectedMood)
                .font(.system(size: 80))
            
            Picker("选择心情", selection: $selectedMood) {
                ForEach(moods, id: \.self) { mood in
                    Text(mood)
                        .font(.largeTitle)
                }
            }
            .pickerStyle(.automatic)//设置选择器的风格
            .padding()
            
            Text("点击上方选择你的心情")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .navigationTitle("心情记录")
    }
}

#Preview {
    MoodView()
}

