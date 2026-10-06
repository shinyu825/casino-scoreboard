//
//  ContentView.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            HStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ResultView(viewModel: viewModel)
                            .frame(width: geometry.size.width * 0.4)
                        Divider()
                            .background(Color.black)
                        ButtonsView(viewModel: viewModel)
                            .frame(width: geometry.size.width * 0.6)
                    }
                    .background(
                        Image("roulette")
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
                            .font(.system(size: 15))
                    }.padding(.top, 10)
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.getResults()
            viewModel.getThirteens()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

