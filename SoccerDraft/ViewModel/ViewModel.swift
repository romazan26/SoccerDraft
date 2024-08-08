//
//  ViewModel.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import Foundation
import CoreData
import UIKit

final class ViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var allPlayers: [Player] = []
    @Published var favoritePlayers: [Player] = []
    
    @Published var sortPlayers: [Player] = []
    @Published var sortCount = 4
    
    @Published var simplePlayerName = ""
    @Published var simpleAge = ""
    @Published var simpleTeam = ""
    @Published var simplePhoto: UIImage = UIImage(resource: .no)
    @Published var simplePost = ""
    @Published var simpleIsFavoritePlayer = false
    
    @Published var isPresentAddView = false
    
    @Published var isEditeMod = false
    @Published var editePlayerId: ObjectIdentifier!
    
    init(){
        getAllPlayers()
        getFavoritePlayer()
    }
    
    //MARK: - Sorting
    func sortPlayer(){
        sortPlayers.removeAll()
        for i in (sortCount - 4...sortCount - 1) {
            if allPlayers.count > i {
                sortPlayers.append(allPlayers[i])
            }
        }
    }
    
    //MARK: - Edite player data
    func editePlayer(editePlayerId: ObjectIdentifier){
        let request = NSFetchRequest<Player>(entityName: "Player")
        
        do{
            allPlayers = try manager.context.fetch(request)
            let player = allPlayers.first(where: {$0.id == editePlayerId})
            player?.playerName = simplePlayerName
            player?.photo = simplePhoto
            player?.age = Int16(simpleAge) ?? 0
            player?.team = simpleTeam
            player?.posr = simplePost
            player?.isFavorite = simpleIsFavoritePlayer
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
        clear()
        isEditeMod = false
        
        
    }
    
    //MARK: - fill in the data player
    func fillData(player: Player){
        simplePlayerName = player.playerName ?? ""
        simpleAge = String(player.age)
        simpleTeam = player.team ?? ""
        simplePhoto = player.photo ?? UIImage(resource: .no)
        simplePost = player.posr ?? ""
        simpleIsFavoritePlayer = player.isFavorite
        
    }
    
    //MARK: - get favorite players
    func getFavoritePlayer(){
        favoritePlayers.removeAll()
        for allPlayer in allPlayers {
            if allPlayer.isFavorite {
                favoritePlayers.append(allPlayer)
            }
        }
    }
    
    //MARK: - Add Player
    func addPlayer(){
        let newPlayer = Player(context: manager.context)
        newPlayer.playerName = simplePlayerName
        newPlayer.age = Int16(simpleAge) ?? 0
        newPlayer.team = simpleTeam
        newPlayer.photo = simplePhoto
        newPlayer.posr = simplePost
        newPlayer.isFavorite = simpleIsFavoritePlayer
        
        save()
        clear()
        
    }
    
    //MARK: - Get data
    func getAllPlayers(){
        let request = NSFetchRequest<Player>(entityName: "Player")
        
        do{
            allPlayers = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear
    func clear(){
        simplePlayerName = ""
        simpleAge = ""
        simpleTeam = ""
        simplePhoto = UIImage(resource: .no)
        simplePost = ""
        simpleIsFavoritePlayer = false
    }
    
    //MARK: - Save
    func save(){
        favoritePlayers.removeAll()
        allPlayers.removeAll()
        self.manager.save()
        getAllPlayers()
        getFavoritePlayer()
    }
}
