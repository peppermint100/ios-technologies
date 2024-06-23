//
//  HeadPhoneJumpManager.swift
//  AirPodsCoreMotion
//
//  Created by peppermint100 on 6/23/24.
//

import Foundation
import CoreMotion

class HeadPhoneJumpManager: ObservableObject {
    
    @Published var count = 0
    @Published var jumpMax = -1.0
    var isTracking = false
    
    private let cmHeadPhoneManager = CMHeadphoneMotionManager()
    
    func calibrate() {
        if isTracking {
            print("이미 작동중입니다.")
            return
        }
        
        print("테스트를 시작합니다.")
        
        cmHeadPhoneManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            guard let motion = motion, let self = self, error == nil else {
                print("Jump CoreMotion에서 에러가 발생했습니다. error = ", error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                print(motion.gravity.z)
                self.jumpMax = max(self.jumpMax, motion.gravity.z)
            }
        }
    }
    
    func startJump() {
        if isTracking {
            print("이미 작동중입니다.")
            return
        }
        
        cmHeadPhoneManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            guard let motion = motion, let self = self, error == nil else {
                print("Jump CoreMotion에서 에러가 발생했습니다. error = ", error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                if motion.gravity.z >= self.jumpMax {
                    self.count += 1
                }
            }
        }
    }
    
    func stopUpdates() {
        print("점프 모션 추적을 중지합니다.")
        
        if !isTracking {
            print("이미 점프 모션이 종료되었습니다.")
        }
        
        jumpMax = -1.0
        isTracking = false
        cmHeadPhoneManager.stopDeviceMotionUpdates()
    }
    
    func stopTesting() {
        print("테스트를 중지합니다.")
        
        if !isTracking {
            print("이미 점프 모션이 종료되었습니다.")
        }
        
        isTracking = false
        cmHeadPhoneManager.stopDeviceMotionUpdates()
    }
    
    deinit {
        stopUpdates()
    }
    
}
