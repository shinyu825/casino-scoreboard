//
//  BaButtonsView.swift
//  TakuCho
//
//  Created by Apple on 2024/08/02.
//

import SwiftUI

struct BaButtonsView: View {
    @ObservedObject var viewModel: MainViewModel
    let defaults = UserDefaults.standard

    var body: some View {
        VStack {
            HStack(spacing: 80) {
                CustomButton2(title: "BANKER", color: Color.red) {
                    saveToBaResult(value: "B")
                }
                CustomButton2(title: "DRAW", color: Color.green) {
                    saveToBaResult(value: "D")
                }
                CustomButton2(title: "PLAYER", color: Color.blue) {
                    saveToBaResult(value: "P")
                }
                CustomButton2(title: "DELETE", color: Color.purple) {
                    deleteLastBaResult()
                }
                CustomButton2(title: "RESET", color: Color.yellow) {
                    saveToBaResult(value: "R")
                }
            }
        }
    }
    
    func saveToBaResult(value: String) {
        var results = defaults.stringArray(forKey: "baResult") ?? []
        if value != "R" {
            results.append(value)
            defaults.set(results, forKey: "baResult")
            viewModel.getBaResults()
        } else {
            defaults.removeObject(forKey: "baResult")
            viewModel.getBaResults()
        }
    }
    
    func deleteLastBaResult() {
        var results = defaults.stringArray(forKey: "baResult") ?? []
        if !results.isEmpty {
            results.removeLast()
            defaults.set(results, forKey: "baResult")
            viewModel.getBaResults()
        }
    }
}

struct BaButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BaButtonsView(viewModel: MainViewModel())
    }
}
