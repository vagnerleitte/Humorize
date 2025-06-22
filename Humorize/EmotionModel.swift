//
//  HumorModel.swift
//  FabulousApp
//
//  Created by Vagner Leite da Silva on 07/06/25.
//

import Foundation
import SwiftUI

enum EmotionalState: String, Codable, CaseIterable, Identifiable {
    case angry = "🤬"
    case mad = "😠"
    case confused = "😕"
    case calm = "😌"
    case happy = "🥳"

    var id: String { self.rawValue }
}
    

struct EmotionRecord: Identifiable, Codable {
    var id: UUID
    var emotion:EmotionalState
    var title: String
    var description: String
    var codableColor: CodableColor
    var isCompleted: Bool
    var date: Date
    
    init(
        emotion: EmotionalState,	
         title: String,
         description: String,
         color: Color,
         isCompleted: Bool,
         id: UUID = UUID()
    ) {
        self.id = id 
        self.emotion = emotion
        self.title = title
        self.description = description
        self.codableColor = CodableColor(color)
        self.isCompleted = isCompleted
        self.date =  Date()
    }
    
    var color: Color {
        codableColor.color
    }
}


class ToggleCompletionEventModel: ObservableObject {
    @Published var isCompleted: Bool = false
}
