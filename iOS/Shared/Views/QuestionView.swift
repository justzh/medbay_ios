//
//  QuestionView.swift
//  MedBay
//
//  Created by Justin Zhang on 4/20/22.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question: Question
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(question.id)")
            Text(question.title)
            Text(question.body)
        }
    }
}
