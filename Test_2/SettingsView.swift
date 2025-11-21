//
//  SettingsView.swift
//  Test_2
//
//  Created by Hsuanting on 2025/11/5.
//

import SwiftUI

struct SettingsView: View {
    // 持久化设置项
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("fontSize") private var fontSize: Double = 16.0
    
    var body: some View {
        
            Form {
                Section(header: Text("外观设置")) {
                    Toggle(isOn: $darkModeEnabled) {
                        Label("深色模式", systemImage: "moon.fill")
                    }
                    
                    HStack {
                        Label("字体大小", systemImage: "textformat.size")
                        Spacer()
                        Slider(value: $fontSize, in: 12...24, step: 1)
                    }
                    Text("当前字体大小：\(Int(fontSize)) pt")
                        .font(.system(size: fontSize))
                        .foregroundColor(.gray)
                }
                
                Section(header: Text("应用信息")) {
                    HStack {
                        Text("应用名称")
                        Spacer()
                        Text("LifeBoard")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("版本号")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("设置")
            .preferredColorScheme(darkModeEnabled ? .dark : .light)
        }
    
}

#Preview {
    SettingsView()
}
