//
//  ContentView.swift
//  FullScreenCoverTest
//
//  Created by Korsun Yevhenii on 09.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showView = false
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Button {
                withAnimation {
                    showView.toggle()
                }
                
            } label: {
                Text("Show view")
            }
            .easyFullScreenCover(isPresented: $showView) {
                NewView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
