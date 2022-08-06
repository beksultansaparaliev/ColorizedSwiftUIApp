//
//  StarterView.swift
//  ColorizedSwiftUIApp
//
//  Created by Masaie on 6/8/22.
//

import SwiftUI

struct StarterView: View {
    @State private var swiftUIViewIsPresented = false
    @State private var uiKitViewIsPresented = false
    
    var body: some View {
        VStack {
            Button("Show SwiftUI View") {
                swiftUIViewIsPresented.toggle()
            }
            .sheet(isPresented: $swiftUIViewIsPresented) {
                ContentView()
            }
            
            Button("Show UIKit View") {
                uiKitViewIsPresented.toggle()
            }
            .sheet(isPresented: $uiKitViewIsPresented) {
                ColorViewControllerRepresentation()
                    .ignoresSafeArea()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
