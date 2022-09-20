//
//  LazyFullScreenCover.swift
//  FullScreenCoverTest
//
//  Created by Korsun Yevhenii on 11.07.2022.
//

import SwiftUI

struct LazyFullScreenCover<Content: View>: View {
    @Binding var isPresented: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            content
                .environment(\.lazyDismiss, LazyDismiss {
                    isPresented = false
                })
        }
    }
}

extension View {
    func lazyFullScreenCover<Content>(isPresented: Binding<Bool>, transition: AnyTransition = .opacity, content: @escaping () -> Content) -> some View where Content : View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                LazyFullScreenCover(isPresented: isPresented, content: content)
                    .transition(transition)
            }
        }
    }
}

struct LazyDismiss {
    private var action: () -> Void
    func callAsFunction() {
        action()
    }
    
    init(action: @escaping () -> Void = { }) {
        self.action = action
    }
}

struct LazyDismissKey: EnvironmentKey {
    static var defaultValue: LazyDismiss = LazyDismiss()
}

extension EnvironmentValues {
    var lazyDismiss: LazyDismiss {
        get { self[LazyDismissKey.self] }
        set { self[LazyDismissKey.self] = newValue }
    }
}
