//
//  WriteView.swift
//  MedBay
//
//  Created by Justin Zhang on 4/20/22.
//

import SwiftUI

struct WriteView: View {
    @State private var title: String = ""
    @FocusState private var titleFieldIsFocused: Bool
    
    @State private var paragraph: String = ""
    @FocusState private var paragraphFieldIsFocused: Bool
    
    @Binding var questions: [Question]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button("Never mind") {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Button("Okay") {
                    questions.append(Question(id: questions.count, title: title, body: paragraph))
                    presentationMode.wrappedValue.dismiss()
                }
            }
            Divider()
            Text("Question")
                .font(.headline)
            TextField("", text: $title)
                .focused($titleFieldIsFocused)
                .border(.primary)
            Text("Description")
            TextEditor(text: $paragraph)
                .focused($paragraphFieldIsFocused)
                .border(.secondary)
        }
        
        .padding()
    }
}
