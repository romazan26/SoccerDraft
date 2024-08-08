//
//  CategoriesListView.swift
//  AffirmationsTestWork
//
//  Created by Роман on 31.07.2024.
//

import SwiftUI

struct PlayersListView: View {
    @StateObject var vm: ViewModel
    let items: [Player]
    let screenWidth = 2
    @State var groupedItems: [[Player]] = [[Player]]()
    
    
    private  func createGroupItems(_ items: [Player]) -> [[Player]]{
        var groupedItems: [[Player]] = [[Player]]()
        var tempItems: [Player] = [Player]()
        
        var count = 0
        for item in items {
            
            if count < screenWidth {
                tempItems.append(item)
                count += 1
            }else {
                count = 1
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(item)
            }
        }
        groupedItems.append(tempItems)
        
        return groupedItems
    }
    
    var body: some View {
        
        VStack{
            ForEach(groupedItems, id: \.self) { subItem in
                HStack{
                    
                    ForEach(subItem, id: \.self) { item in
                        
                        VStack {
                            PlayerCellView(player: item)
                            NavigationLink {
                                AddPlayerView(vm: vm, isEditeMod: true, editePlayer: item)
                            } label: {
                                OrangeButtonView(text: "View card")
                                
                            }
                            
                        }
                        Spacer()
                        
                    }
                    Spacer()
                    
                }.padding(.leading, 30)
            }
            
        }
        
        
        
        .onAppear(perform: {
            self.groupedItems = createGroupItems(items)
        })
        
    }
}

//#Preview {
//    PlayersListView()
//}
