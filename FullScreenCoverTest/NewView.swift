//
//  NewView.swift
//  FullScreenCoverTest
//
//  Created by Korsun Yevhenii on 09.07.2022.
//

import SwiftUI

struct NewView: View {
    @Environment(\.easyDismiss) var easyDismiss: EasyDismiss
    
    var body: some View {
        ZStack {
//            Color.green.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                
                Button {
                    withAnimation {
                        easyDismiss()
                    }
                } label: {
                    Text("Close view")
                }
                
                    
                    Spacer()
                }
                .padding(.vertical, 50)
                .background(Color.green)
                Spacer()
            }
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
