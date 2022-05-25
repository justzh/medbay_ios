//
//  TheBayView.swift
//  MedBay
//
//  Created by Justin Zhang on 4/20/22.
//

import SwiftUI

struct TheBayView: View {
    @State var presentPopup: Bool
    @State var questions: [Question]
    
    var body: some View {
        NavigationView {
            VStack {
//                Divider()
//                Text("Welcome!")
//                    .font(.title)
//                Spacer()
                Button("Ask a question!") {
                  presentPopup = true
                }
                .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                    WriteView(questions: $questions)
                }
                List(questions, id: \.id) { question in
                    NavigationLink(destination: QuestionView(question: question)) {
                        QuestionRow(question: question)
                    }
                }
            }
            .navigationTitle("Welcome to MedBay!")
        }
        .onAppear() {
            HelloRequest.request()
            QuestionsRequest.request { questions in
                self.questions = questions
            }
        }
    }
}
