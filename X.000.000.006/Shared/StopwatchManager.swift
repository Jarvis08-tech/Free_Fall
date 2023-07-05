//
//  StopwatchManager.swift
//  X.000.000.006
//
//  Created by Develop on 04.04.22.
//

import SwiftUI
class StopWatchManager: ObservableObject {
    @Published var secondsElapsed = 0.0
    @Published var mode: stopWatchMode = .stopped
    @Published var meter = 0.0
    @Published var foot = 0.0
    @Published var place: places = .earth
    @Published var isPicking = false
    @Published var informationIsShown = false
    
    init(place: places = .earth) {
        self.place = place
    }
    
    var timer = Timer()
    
    func start() {
        secondsElapsed = 0
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        switch place {
        case .earth:
            meter = 0.5 * 9.81 * pow(secondsElapsed, 2.0)
        case .moon:
            meter = 0.5 * 1.625 * pow(secondsElapsed, 2.0)
        case .mars:
            meter = 0.5 * 3.72076 * pow(secondsElapsed, 2.0)
        }
        foot = meter / 0.3048
        mode = .stopped
    }
    
    
    
}
