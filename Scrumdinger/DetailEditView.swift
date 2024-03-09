//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Kristiyan Dilov on 09/03/2024.
//

import SwiftUI


struct DetailEditView: View {
    
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form{
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lenghtInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indicies in
                    scrum.attendees.remove(atOffsets: indicies)
                }
            }
            
        }
    }
}


#Preview {
    DetailEditView()
}
