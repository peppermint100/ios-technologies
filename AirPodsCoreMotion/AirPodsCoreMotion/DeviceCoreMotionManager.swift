//
//  DeviceCoreMotionManager.swift
//  AirPodsCoreMotion
//
//  Created by peppermint100 on 7/8/24.
//

import Foundation
import CoreMotion

class DeviceCoreMotionManager: ObservableObject {
    
    private let cmManager = CMMotionManager()
    
    var isDeviceAvailable = false
    var isSquatting = false
    var squatCount = 0
    
    @Published var upOffset = -0.5
    
    init() {
        checkAuthorization()
        startUpdates()
    }
    
    private func checkAuthorization() {
        if cmManager.isDeviceMotionAvailable {
            self.isDeviceAvailable = true
        }
    }
    
    func startUpdates() {
        cmManager.accelerometerUpdateInterval = 0.1
        cmManager.startAccelerometerUpdates(to: OperationQueue.current!) { [weak self] data, error in
            if error != nil {
                print(#file, #function, error)
                return
            }
            
            guard let self = self else { return }
            
            if let acceleration = data?.acceleration {
                let zAcceleration = acceleration.z
                
                print(zAcceleration)
                if zAcceleration < self.upOffset {
                    if !isSquatting {
                        isSquatting = true
                    }
                } else if zAcceleration > -0.1 { 
                    if isSquatting {
                        isSquatting = false
                        squatCount += 1
                        print("Squat count: \(squatCount)")
                    }
                }
            }
        }
    }
}
