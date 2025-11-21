//
//  Untitled.swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    let name: String
    var completed: Bool
}

struct HabitsView: View {
    @State private var habits = [
        Habit(name: "早起", completed: false),
        Habit(name: "阅读30分钟", completed: true),
        Habit(name: "运动", completed: false)
    ]
    
    var body: some View {
        List {
            ForEach($habits) { $habit in
                HStack {
                    Text(habit.name)
                    Spacer()
                    Toggle("完成", isOn: $habit.completed)
                        .labelsHidden() // 隐藏“完成”文字
                }
            }
        }
        .navigationTitle("打卡习惯")
    }
}

#Preview {
    HabitsView()
}
