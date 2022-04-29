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
    
    @State private var paragraph: String = "Description"
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
            TextField("title", text: $title)
                .focused($titleFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.primary)
            TextEditor(text: $paragraph)
                .focused($paragraphFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
        }
    }
}
