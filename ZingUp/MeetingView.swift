//
//  ContentView.swift
//  ZingUp
//
//  Created by Scott on 12/16/20.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyStandUp
    @StateObject var scrumTimer = ScrumTimer()
    
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            
            VStack {
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining, scrumColor: scrum.color)
                
                Circle()
                    .strokeBorder(lineWidth: 24.0, antialiased: true)
                MeetingFooterView(speakers: $scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear(perform: {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            
            scrumTimer.startScrum()
        })
        .onDisappear(perform: {
            scrumTimer.stopScrum()
        })
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyStandUp.data[0]))
    }
}
