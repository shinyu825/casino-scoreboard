//
//  MainViewModel.swift
//  TakuCho
//
//  Created by Apple on 2024/07/08.
//

import Foundation

class MainViewModel: ObservableObject {
    let defaults = UserDefaults.standard
    
// --- BlackJack -------------------------------------------------------
    @Published var results: [String] = []
    @Published var thirteens: [String] = []
    
    @Published var isShowBJ = false
    @Published var isShowBaccarat = false
    
    func getResults() {
        self.results = defaults.stringArray(forKey: "result") ?? []
    }
    
    func getThirteens() {
        self.thirteens = defaults.stringArray(forKey: "thirteen") ?? []
    }
// --- Baccarat --------------------------------------------------------
    @Published var baResults: [String] = []
    
    func getBaResults() {
        self.baResults = defaults.stringArray(forKey: "baResult") ?? []
    }
    
}
