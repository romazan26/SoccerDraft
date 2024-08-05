//
//  AddPlayerView.swift
//  SoccerDraft
//
//  Created by Роман on 05.08.2024.
//

import SwiftUI
import PhotosUI

struct AddPlayerView: View {
    @StateObject var vm: ViewModel
    
    @State private var isPresented: Bool = false

    @FocusState var keyboardIsFocus: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var isEditeMod = false
    var editePlayer: Player = Player()
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - Top tollbar
                HStack {
                    //MARK: - Back button
                    Button {
                        dismiss()
                    } label: {
                        ZStack{
                            Color.gray
                            Text("Back")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .heavy))
                        }
                        .frame(width: 89, height: 35)
                        .cornerRadius(39)
                    }
                    
                    Spacer()
                    
                    Text(vm.simplePlayerName.isEmpty ? "New player" : vm.simplePlayerName)
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .offset(x: -30)
                    Spacer()
                    Button(action: {vm.simpleIsFavoritePlayer.toggle()}, label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(vm.simpleIsFavoritePlayer ? .orangeApp : .gray)
                    })
                    
                    
                }
                
                //MARK: - Photo player
                Button {
                    isPresented.toggle()
                } label: {
                    Image(uiImage: vm.simplePhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 158, height: 188)
                        .cornerRadius(16)
                }
                .frame(width: 158, height: 188)
                .padding(.vertical)
                .sheet(isPresented: $isPresented, content: {
                    PhotoPicker(configuration: self.config, image: $vm.simplePhoto, isPresented: $isPresented)
                })
                
                //MARK: - TF group
                TextFieldCustom(placeholder: "Player name", text: $vm.simplePlayerName)
                    .focused($keyboardIsFocus)
                TextFieldCustom(placeholder: "Age", text: $vm.simpleAge)
                    .focused($keyboardIsFocus)
                    .keyboardType(.numberPad)
                TextFieldCustom(placeholder: "His team", text: $vm.simpleTeam)
                    .focused($keyboardIsFocus)
                
                //MARK: - choise post of team
                HStack{
                    Button(action: {vm.simplePost = "RF"}, label: {
                        PostPlayerView(post: "RF", width: 49)
                            .opacity(vm.simplePost == "RF" ? 1 : 0.5)
                    })
                    Button(action: {vm.simplePost = "LF"}, label: {
                        PostPlayerView(post: "LF", width: 49)
                            .opacity(vm.simplePost == "LF" ? 1 : 0.5)
                    })
                    Button(action: {vm.simplePost = "GK"}, label: {
                        PostPlayerView(post: "GK", width: 49)
                            .opacity(vm.simplePost == "GK" ? 1 : 0.5)
                    })
                    Button(action: {vm.simplePost = "CB"}, label: {
                        PostPlayerView(post: "CB", width: 49)
                            .opacity(vm.simplePost == "CB" ? 1 : 0.5)
                    })
                    Button(action: {vm.simplePost = "LB"}, label: {
                        PostPlayerView(post: "LB", width: 49)
                            .opacity(vm.simplePost == "LB" ? 1 : 0.5)
                    })
                    Button(action: {vm.simplePost = "RB"}, label: {
                        PostPlayerView(post: "RB", width: 49)
                            .opacity(vm.simplePost == "RB" ? 1 : 0.5)
                    })
                }.padding(.vertical)
                Spacer()
                
                //MARK: - Add button
                Button(action: {
                    if isEditeMod{
                        vm.editePlayer(editePlayerId: editePlayer.id)
                        dismiss()
                    }else {
                        vm.addPlayer()
                        dismiss()
                    }
                    
                }, label: {
                    OrangeButtonView(text: isEditeMod ? "Edit card" : "Add new player",
                                     width: 335,
                                     height: 73,
                                     radius: 24)
                })
            }.padding()
        }
        .navigationBarBackButtonHidden()
        .onTapGesture {
            keyboardIsFocus = false
        }
        .onAppear(perform: {
            if isEditeMod{
                vm.fillData(player:editePlayer)
            }
        })
    }
}

#Preview {
    AddPlayerView(vm: ViewModel(), editePlayer: Player())
}
