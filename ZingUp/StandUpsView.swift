//
//  StandUpsView.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

struct StandUpsView: View {
    let scrums: [DailyStandUp]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: StandUpDetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Stand Ups")
        .navigationBarItems(trailing: Button(action: {}) {
            Text("Add")
            Image(systemName: "plus")
        })
        .listStyle(InsetListStyle())
        
    }
}

struct StandUpsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StandUpsView(scrums: DailyStandUp.data)
        }
    }
}
