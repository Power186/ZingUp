//
//  ZingUpApp.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

@main
struct ZingUpApp: App {
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StandUpsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            .onAppear(perform: {
                data.load()
            })
        }
        
    }
}
