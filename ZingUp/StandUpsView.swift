//
//  StandUpsView.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI

struct StandUpsView: View {
    @Binding var scrums: [DailyStandUp]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newScrumData = DailyStandUp.Data()
    
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: StandUpDetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Stand Ups")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
            Text("Add")
        })
        .sheet(isPresented: $isPresented, content: {
            NavigationView {
                EditView(scrumData: $newScrumData)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                        
                    }, trailing: Button("Add") {
                        let newScrum = DailyStandUp(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                        
                        scrums.append(newScrum)
                        isPresented = false
                    })
            }
        })
        .onChange(of: scenePhase, perform: { phase in
            if phase == .inactive { saveAction() }
        })
        .listStyle(InsetGroupedListStyle())
        
    }
    
    private func binding(for scrum: DailyStandUp) -> Binding<DailyStandUp> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Cant find scrum in array")
        }
        return $scrums[scrumIndex]
    }
    
}

struct StandUpsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StandUpsView(scrums: .constant(DailyStandUp.data), saveAction: {})
        }
    }
}
