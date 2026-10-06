//
//  SelectView.swift
//  TakuCho
//
//  Created by Apple on 2024/08/02.
//

import Foundation
import SwiftUI

struct SelectView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack() {
            HStack(spacing: 100) {
                Button(action: {
                    viewModel.isShowBJ = true
                }) {
                    Text("Black Jack")
                        .frame(width: 100, height: 100)
                        .background()
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                Button(action: {
                    viewModel.isShowBaccarat = true
                }) {
                    Text("Baccarat")
                        .frame(width: 100, height: 100)
                        .background()
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowBJ) {
                ContentView(viewModel: viewModel)
            }
            .navigationDestination(isPresented: $viewModel.isShowBaccarat) {
                BaccaratView(viewModel: viewModel)
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
