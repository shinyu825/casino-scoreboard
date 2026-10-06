//
//  CustomButton2.swift
//  TakuCho
//
//  Created by Apple on 2024/08/05.
//

import Foundation
import SwiftUI

struct CustomButton2: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 80, height: 80)
                .background(color)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 18))
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

struct CustomButton2_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton2(title: "21", color: Color.green) {}
    }
}
