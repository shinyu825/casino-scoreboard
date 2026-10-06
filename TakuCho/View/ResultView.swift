//
//  ResultView.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import Foundation
import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        ForEach(viewModel.results, id: \.self) { item in
                            if item == "BlackJack" {
                                Text(item)
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red.opacity(0.8))
                            } else if item == "Burst" {
                                Text(item)
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black.opacity(0.8))
                            } else {
                                Text(item)
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.5))
                            }
                        }
                        Color.clear
                            .frame(height: 0)
                            .id("bottom")
                    }
                }
                .onChange(of: viewModel.results) { _ in
                    withAnimation {
                        proxy.scrollTo("bottom", anchor: .bottom)
                    }
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: MainViewModel())
    }
}
