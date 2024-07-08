//
//  JumpView.swift
//  AirPodsCoreMotion
//
//  Created by peppermint100 on 6/23/24.
//

import SwiftUI

struct SqautView: View {
    
    @StateObject private var motionManager = DeviceCoreMotionManager()
    
    var body: some View {
        VStack(spacing: 80) {
            Slider(value: $motionManager.upOffset, in: (-0.9)...(-0.3)) {
            }
            Text("\(motionManager.upOffset)")
        }
    }
}

#Preview {
    SqautView()
}
