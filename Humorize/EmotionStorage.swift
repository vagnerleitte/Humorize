//
//  EmotionStorage.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 21/06/25.
//

import Foundation

class EmotionStorage {
    private let key = "emotions"
    
    func save(_ records: [EmotionRecord]) {
        if let data = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load() -> [EmotionRecord] {
        if let data = UserDefaults.standard.data(forKey: key),
           let records = try? JSONDecoder().decode([EmotionRecord].self, from: data) {
            return records
        }
        return []
    }

}
	
