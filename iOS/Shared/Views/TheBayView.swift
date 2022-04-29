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
        VStack {
            Button("Ask") {
              presentPopup = true
            }
            .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
              WriteView(questions: $questions)
            }
            List(questions, id: \.id) { question in
                QuestionRow(question: question)
            }
        }
        .onAppear() {
            TestRequest.request()
            QuestionRequest.request()
        }
    }
}
