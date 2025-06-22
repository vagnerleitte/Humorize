//
//  DashboardView.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 21/06/25.
//

import SwiftUI

struct DashboardView: View {
    
    @State private var records: [EmotionRecord] = []
    @State private var isPresentingAdd = false
    @StateObject var toggleCompletionEvent = ToggleCompletionEventModel()
    
    @State private var selectedRecord: EmotionRecord? = nil
    
    let storage  = EmotionStorage()
    
  
    var body: some View {
           NavigationView {
               VStack {
                   List($records) { $record in
                       HumorItemView(record: record)
                       
                   }
                   .navigationTitle("Historico")
                   .toolbar{
                       ToolbarItem(placement: .navigationBarTrailing){
                           Button {
                               isPresentingAdd = true
                           } label: {
                               Image(systemName: "plus.circle")
                                   .font(.title2)
                           }
                       }
                   }
                   .onAppear {
                       self.records = storage.load()
                   }.fullScreenCover(item: $selectedRecord) { record in
                       AddHumorView(existingRecord: record) { updated in
                           // Atualiza ou substitui o registro
                           if let index = records.firstIndex(where: { $0.id == updated.id }) {
                               records[index] = updated
                           } else {
                               records.append(updated)
                           }
                           storage.save(records)
                           
                       }
                   }.fullScreenCover(isPresented: $isPresentingAdd) {
                       AddHumorView(existingRecord: nil, onSave: { newRecord in
                           var newRecords = storage.load()
                           newRecords.append(newRecord)
                           storage.save(newRecords)
                           records = storage.load()
                           
                       })
                   }
                   
               }
           }
       }
    

}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
	
