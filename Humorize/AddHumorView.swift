//
//  AddHumorView.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 21/06/25.
//

import SwiftUI

struct AddHumorView: View {
    @Environment(\.dismiss) var dismiss
    var existingRecord: EmotionRecord?
    
    @State private var emotion: EmotionalState = .calm
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var color: Color = .gray
    @State private var isCompleted: Bool = false
    var onSave: (EmotionRecord) -> Void
    
    
    var body: some View {
        NavigationView {
            Form {
                VStack(spacing: 24){
                    HStack {
                        ForEach(EmotionalState.allCases, id: \.self) { state in
                            let isSelected = emotion == state
                            let fontSize: CGFloat 	= isSelected ? 48 : 32
                            let borderColor = isSelected ? Color.green : Color.clear
                            
                            Button(action: {
                                emotion = state
                            }) {
                                Text(state.rawValue)
                                    .font(.system(size: fontSize))
                                
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(borderColor, lineWidth: 3)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                    }
                    TextField("Ex: Dia produtivo", text: $title)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray))
                    TextField("Descrição", text: $description).frame(height: 120)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray))
                    ColorPicker("Escolha uma cor", selection: $color)
                    
                    if existingRecord != nil {
                        Section {
                            Toggle("Concluído", isOn: $isCompleted)
                        }
                    }
                    
                }.padding([.bottom, .trailing], 20)
                
                HStack(spacing: 16) {
                    Button(existingRecord == nil ? "Salvar" : "Alterar") {
                        let newRecord = EmotionRecord(
                            emotion: emotion,
                            title: title,
                            description: description,
                            color: color,
                            isCompleted: isCompleted,
                            id: existingRecord?.id ?? UUID()

                        )
                        onSave(newRecord)
                        dismiss()
                    }.frame(maxWidth: .infinity)
                    Button("Cancelar") {
                        dismiss()
                    }.foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                }
                
                
            }.navigationTitle(existingRecord == nil ? "Registrar humor" :  "Alterar Humor")
                .background(Color.clear )
                .scrollContentBackground(.hidden)
            
        }.onAppear {
            if let record	 = existingRecord  {
                emotion = record.emotion
                title = record.title
                description = record.description
                color = record.color
                isCompleted = record.isCompleted
            }
        }
    }
    
}



struct AddHumorView_Previews: PreviewProvider {
    static var previews: some View {
        AddHumorView(
            existingRecord: EmotionRecord(emotion: .happy, title: "Feliz", description: "Dia bom!", color: .green, isCompleted: true),
            onSave: {record in})
    }
    
}
