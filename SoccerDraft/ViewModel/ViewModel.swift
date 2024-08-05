//
//  ViewModel.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import Foundation
import CoreData

final class ViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var allPlayers: [Player] = []
    @Published var favoritePlayers: [Player] = []
    
    init(){
        getAllPlayers()
    }
    
    func getAllPlayers(){
        let request = NSFetchRequest<Player>(entityName: "Player")
        
        do{
            allPlayers = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
}
