//
//  JumpView.swift
//  AirPodsCoreMotion
//
//  Created by peppermint100 on 6/23/24.
//

import SwiftUI

struct JumpView: View {
    
    @StateObject var jumpManager = HeadPhoneJumpManager()
    
    var body: some View {
        VStack(spacing: 80) {
            
            Text("Jump max = \(jumpManager.jumpMax)")
            
            Text("\(jumpManager.count)")
                .font(.title)
            
            HStack {
                
                Button("테스트") {
                    jumpManager.calibrate()
                }
                .buttonStyle(.borderedProminent)
                
                Button("테스트 중지") {
                    jumpManager.stopTesting()
                }
                .buttonStyle(.borderedProminent)
                
                Button("시작") {
                    jumpManager.startJump()
                }
                .buttonStyle(.borderedProminent)
                
                Button("종료") {
                    jumpManager.stopUpdates()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    JumpView()
}
