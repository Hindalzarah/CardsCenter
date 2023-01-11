//
//  ContentView.swift
//  addNoteView
//
//  Created by Hind on 17/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State var showImagePicker: Bool = false
    @StateObject var imageData = ImageData()
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                if imageData.imageNote.isEmpty {
                    
                    Text("Try adding a card ").italic().foregroundColor(.gray)
                    Text("🪪").accessibilityLabel("business cards")
                   
                } else {
                    HomeView()
                }
            }
            }.navigationTitle("My Cards").sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType:.photoLibrary){
                    image in
                    // add notes/image to array
                    imageData.addNote(image: image, title: "Add a title!", description: "")
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Label("image", systemImage: "photo.on.rectangle.angled").accessibilityHint("add a card photo from photo album")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        withAnimation {
                            // Reset all user data
                            imageData.resetUserData()
                        }
                    } label: {
                        Label("Trash", systemImage: "trash")
                            .accessibilityHint("remove all cards")
                            .tint(.red)
                    }
                }
            }
            
        }
        .environmentObject(imageData)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
