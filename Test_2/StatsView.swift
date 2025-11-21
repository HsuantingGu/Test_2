//
//  StatsView().swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI
import Charts

struct MoodRecord: Identifiable {
    let id = UUID()
    let date: String
    let moodLevel: Int
}

struct StatsView: View {
    // 模拟数据
    let notesCount = 12
    let totalHabits = 3
    let completedHabits = 2
    let currentMood = "😄"
    
    // 模拟心情数据
    let moodData = [
        MoodRecord(date: "11/01", moodLevel: 4),
        MoodRecord(date: "11/02", moodLevel: 3),
        MoodRecord(date: "11/03", moodLevel: 2),
        MoodRecord(date: "11/04", moodLevel: 5),
        MoodRecord(date: "11/05", moodLevel: 4)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("🗒️ 笔记条数：\(notesCount)")
                    Text("✅ 打卡完成：\(completedHabits)/\(totalHabits)")
                    Text("💬 当前心情：\(currentMood)")
                }
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // 图表部分
                VStack(alignment: .leading) {
                    Text("📈 心情趋势")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Chart(moodData) { item in
                        LineMark(
                            x: .value("日期", item.date),
                            y: .value("心情等级", item.moodLevel)
                        )
                        .symbol(.circle)
                        .foregroundStyle(.blue)
                    }
                    .frame(height: 200)
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("数据统计")
    }
}


#Preview {
    StatsView()
}

