//
//  LandmarkRow.swift
//  MedBay
//
//  Created by Justin Zhang on 4/20/22.
//

import SwiftUI

struct QuestionRow: View {
    @State var question: Question
    
    var body: some View {
        HStack {
            Text(question.title)
            Spacer()
        }
    }
}
