//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Kristiyan Dilov on 09/03/2024.
//

import SwiftUI


struct DetailEditView: View {
    
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form{
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lenghtInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }.accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes").accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indicies in
                    scrum.attendees.remove(atOffsets: indicies)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill").accessibilityLabel("Add attendees")
                    }.disabled(newAttendeeName.isEmpty)
                }
            }
            
        }
    }
}


#Preview {
    DetailEditView()
}
