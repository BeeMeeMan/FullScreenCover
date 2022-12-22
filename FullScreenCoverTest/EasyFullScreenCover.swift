//
//  EasyFullScreenCover.swift
//  FullScreenCoverTest
//
//  Created by Korsun Yevhenii on 11.07.2022.
//

import SwiftUI

struct EasyFullScreenCover<Content: View>: View {
    @Binding var isPresented: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            content
                .environment(\.easyDismiss, EasyDismiss {
                    isPresented = false
                })
        }
    }
}

extension View {
    func easyFullScreenCover<Content>(isPresented: Binding<Bool>, transition: AnyTransition = .opacity, content: @escaping () -> Content) -> some View where Content : View {
        ZStack {
            self
            
            ZStack { // for correct work of transition animation
                if isPresented.wrappedValue {
                    EasyFullScreenCover(isPresented: isPresented, content: content)
                        .transition(transition)
                }
            }
        }
    }
}

struct EasyDismiss {
    private var action: () -> Void
    func callAsFunction() {
        action()
    }
    
    init(action: @escaping () -> Void = { }) {
        self.action = action
    }
}

struct EasyDismissKey: EnvironmentKey {
    static var defaultValue: EasyDismiss = EasyDismiss()
}

extension EnvironmentValues {
    var easyDismiss: EasyDismiss {
        get { self[EasyDismissKey.self] }
        set { self[EasyDismissKey.self] = newValue }
    }
}
