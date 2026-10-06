//
//  CustomButton.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    
    let title: String
    let color: Color
    let isNormal: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 80, height: 80)
                .background(color)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "21", color: Color.green, isNormal: true) {}
    }
}
