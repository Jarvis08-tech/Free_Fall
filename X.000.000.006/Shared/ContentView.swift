//
//  ContentView.swift
//  Shared
//
//  Created by Develop on 04.04.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        ScrollView {
            if stopWatchManager.isPicking {
                VStack {
                    Button(action: {
                        stopWatchManager.place = .earth
                        stopWatchManager.isPicking = false
                    }) {
                        TimerButton(label: "Earth 🌎", buttonColor: .gray)
                    }
                    .padding(.top, 100)
                    Button(action: {
                        stopWatchManager.place = .moon
                        stopWatchManager.isPicking = false
                    }) {
                        TimerButton(label: "Moon 🌑", buttonColor: .gray)
                    }
                    .padding(.top, 50)
                    Button(action: {
                        stopWatchManager.place = .mars
                        stopWatchManager.isPicking = false
                    }) {
                        TimerButton(label: "Mars 🟠", buttonColor: .gray)
                    }
                    .padding(.top, 50)
                }
            } else if stopWatchManager.informationIsShown {
                VStack {
                    Text("You have to drop a dense object. During the fall you have to stop the time with this app. The app will calculate the height of the free fall.")
                        .font(.custom("Avenir", size: 20))
                        .bold()
                        .padding(.bottom, 50)
                        .padding(.top, 50)
                        .padding()
                    Button(action: {
                        stopWatchManager.informationIsShown = false
                    }) {
                        TimerButton(label: "OK", buttonColor: .blue)
                    }
                    
                }
                .padding()
            } else {
                VStack {
                    HStack {
                        Text("How Deep? ")
                            .font(.custom("Avenir", size: 50))
                            .bold()
                        Button(action: {
                            stopWatchManager.informationIsShown = true
                        }) {
                            Image("Information")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.top, 50)
                    
                    Button(action: {
                        stopWatchManager.isPicking = true
                        stopWatchManager.secondsElapsed = 0.0
                        stopWatchManager.meter = 0.0
                        stopWatchManager.foot = 0.0
                    }) {
                        switch stopWatchManager.place {
                        case .earth:
                            TimerButton(label: "Earth 🌎", buttonColor: .gray)
                        case .moon:
                            TimerButton(label: "Moon 🌑", buttonColor: .gray)
                        case .mars:
                            TimerButton(label: "Mars 🟠", buttonColor: .gray)
                        }
                    }
                    .padding(.top, 50)
                    
                    Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                        .font(.custom("Avenir", size: 40))
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    if stopWatchManager.mode == .stopped {
                        Button(action: { stopWatchManager.start() }) {
                            TimerButton(label: "Start", buttonColor: .blue)
                        }
                    }
                    if stopWatchManager.mode == .running {
                        Button(action: { stopWatchManager.stop() }) {
                            TimerButton(label: "Stop", buttonColor: .red)
                        }
                    }
                    Text(String(format: "%.1f", stopWatchManager.meter) + "m")
                        .font(.custom("Avenir", size: 30))
                        .padding(.top, 50)
                    Text(String(format: "%.1f", stopWatchManager.foot) + "ft")
                        .font(.custom("Avenir", size: 30))
                    Spacer()
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
