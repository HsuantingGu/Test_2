//
//  Databoard.swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI

enum Page : Hashable //枚举类型的值，可哈希计算
{
    case notes, habits, mood, stats, settings
}

struct DashboardView: View
{
    var body: some View
    {
        NavigationStack
        {
            List //列表布局容器
            {
                NavigationLink("🗒️ 备忘录", value:Page.notes)
                NavigationLink("⏰ 打卡习惯", value:Page.habits)
                NavigationLink("💬 心情记录", value:Page.mood)
                NavigationLink("📊 数据统计", value:Page.stats)
                NavigationLink("⚙️ 设置", value:Page.settings)
            }
            .navigationTitle("LifeBoard")
            //.navigationBarTitleDisplayMode(.inline) //这个是将标题栏内置
            .navigationDestination(for: Page.self)
            {page in
                switch page
                {
                case .notes:
                    NotesView()
                case .habits:
                    HabitsView()
                case .mood:
                    MoodView()
                case .stats:
                    StatsView()
                case .settings:
                    SettingsView()
            
                }
                
            }
        }
    }
}



#Preview {
    DashboardView()
}


