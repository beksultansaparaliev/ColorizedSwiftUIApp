//
//  TextFieldView.swift
//  ColorizedSwiftUIApp
//
//  Created by Masaie on 19/5/22.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        DecimalTextField(text: $text)
            .frame(width: 60, height: 36, alignment: .trailing)
            .onChange(of: text) { newValue in
                withAnimation {
                    check(newValue)
                }
            }
            .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                Text("Please enter value from 0 to 255")
            }
    }
}

extension TextFieldView {
    private func check(_ textValue: String) {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct SliderValueTF_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextFieldView(text: .constant("128"), value: .constant(128.0))
        }
    }
}
