//
//  HumorItemView.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 21/06/25.
//

import SwiftUI

struct HumorItemView: View {
    var record: EmotionRecord
    @State private var taskCompleted: Bool = false
    
    init(record: EmotionRecord ){
        self.record = record
        self.taskCompleted = record.isCompleted
    }

    var body: some View {
        HStack{
            VStack {
                HStack(spacing: 16) {
                    Text(record.emotion.rawValue)
                        .font(.system(size: 48))
                    VStack(alignment: .leading) {
                        Text(record.title)
                            .font(.headline)
                        Text(record.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.vertical, 8)
                Text(self.formatDate( record.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
            }.onTapGesture {
                
            }
            Toggle("Concluido", isOn: $taskCompleted)
                    .labelsHidden()
        }
        
    }
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt-br")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct HumorItemView_Previews: PreviewProvider {
    static var previews: some View {
        HumorItemView(
            record: EmotionRecord(
                emotion: .happy,
                title: "Feliz",
                description: "Dia bom!",
                color: .green,
                isCompleted: true)
        )
    }
}
