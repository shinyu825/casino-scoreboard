//
//  BaccaratView.swift
//  TakuCho
//
//  Created by Apple on 2024/08/02.
//

import SwiftUI

struct BaccaratView: View {
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            HStack {
                GeometryReader { geometry in
                    VStack {
                        GraphView(viewModel: viewModel)
                            .frame(height: geometry.size.height * 0.8)
                        BaButtonsView(viewModel: viewModel)
                            .frame(height: geometry.size.height * 0.2)
                    }
                    .background(
                        Image("background2")
                            .resizable()
                            .ignoresSafeArea()
                    )
                }
            }
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("<戻る")
                            .font(.system(size: 12))
                    }.padding(.top, 10)
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BaccaratView_Previews: PreviewProvider {
    static var previews: some View {
        BaccaratView(viewModel: MainViewModel())
    }
}
