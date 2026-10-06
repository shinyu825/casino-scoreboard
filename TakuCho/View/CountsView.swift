//
//  CountsView.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import Foundation
import SwiftUI

struct CountsView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text("21: \(getCounts(of: "21")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("20: \(getCounts(of: "20")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            HStack(spacing: 10) {
                Text("19: \(getCounts(of: "19")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("18: \(getCounts(of: "18")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("17: \(getCounts(of: "17")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            HStack(spacing: 10) {
                Text("BJ: \(getCounts(of: "BlackJack")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("Br: \(getCounts(of: "Burst")) 回")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            Text("合計: \(viewModel.results.count) 回")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
        }
    }
    
    func getCounts(of result: String) -> Int {
        viewModel.results.filter { $0 == result }.count
    }
}

struct CountsView_Previews: PreviewProvider {
    static var previews: some View {
        CountsView(viewModel: MainViewModel())
    }
}
