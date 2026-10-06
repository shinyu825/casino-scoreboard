//
//  ButtonsView.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import Foundation
import SwiftUI

struct ButtonsView: View {
    @ObservedObject var viewModel: MainViewModel
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                CustomButton(title: "21", color: Color.green, isNormal: true) {
                    saveToResult(value: "21")
                }
                CustomButton(title: "20", color: Color.green, isNormal: true) {
                    saveToResult(value: "20")
                }
                CustomButton(title: "19", color: Color.green, isNormal: true) {
                    saveToResult(value: "19")
                }
                CustomButton(title: "18", color: Color.green, isNormal: true) {
                    saveToResult(value: "18")
                }
            }.padding(15)
            HStack(spacing: 30) {
                CustomButton(title: "17", color: Color.green, isNormal: true) {
                    saveToResult(value: "17")
                }
                CustomButton(title: "Black\nJack", color: Color.red, isNormal: false) {
                    saveToResult(value: "BlackJack")
                }
                CustomButton(title: "Burst", color: Color.blue, isNormal: true) {
                    saveToResult(value: "Burst")
                }
                CustomButton(title: "Delete", color: Color.purple, isNormal: true) {
                    deletetoResult()
                }
            }.padding(15)
            HStack(spacing: 30) {
                CountsView(viewModel: viewModel)
                CustomButton(title: "Reset", color: Color.yellow, isNormal: true) {
                    saveToResult(value: "Reset")
                }
            }
        }
    }
    
    func saveToResult(value: String) {
        var results = defaults.stringArray(forKey: "result") ?? []
        if value != "Reset" {
            results.append(value)
            defaults.set(results, forKey: "result")
            viewModel.getResults()
        } else {
            defaults.removeObject(forKey: "result")
            viewModel.getResults()
        }
    }
    
    func deletetoResult() {
        var results = defaults.stringArray(forKey: "result") ?? []
        if !results.isEmpty {
            results.removeLast()
            defaults.set(results, forKey: "result")
            viewModel.getResults()
        }
    }
    
    func saveToThirteen(value: String) {
        var results = defaults.stringArray(forKey: "thirteen") ?? []
        if value != "Reset" {
            results.append(value)
            defaults.set(results, forKey: "thirteen")
            viewModel.getThirteens()
        } else {
            defaults.removeObject(forKey: "thirteen")
            viewModel.getThirteens()
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(viewModel: MainViewModel())
    }
}
