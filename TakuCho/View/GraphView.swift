//
//  GraphView.swift
//  TakuCho
//
//  Created by Apple on 2024/08/02.
//

import SwiftUI

struct GraphView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.black)
                .padding(10)
                .background(Color.white)
                .overlay(
                    ZStack(alignment: .bottom) {
                        ScrollView(.horizontal) {
                            HStack(alignment: .top, spacing: 10) {
                                ForEach(groupedResults(), id: \.self) { group in
                                    VStack(alignment: .leading) {
                                        ForEach(group, id: \.self) { item in
                                            Circle()
                                                .fill(getColor(for: item))
                                                .frame(width: 30, height: 30)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        }
                        .padding(20)
                        Text("\(viewModel.baResults.count) 回")
                            .foregroundColor(Color.black)
                            .padding()
                            .padding(.bottom, 0)
                    }
                )
                .frame(maxHeight: .infinity, alignment: .topLeading)
        }.padding(10)
        .onAppear {
            viewModel.getBaResults()
        }
    }
    
    func groupedResults() -> [[String]] {
        var grouped: [[String]] = []
        var currentGroup: [String] = []
        var lastItem: String? = nil
        let maxCount = 6

        for item in viewModel.baResults {
            if let last = lastItem, (last != item || currentGroup.count >= maxCount) {
                grouped.append(currentGroup)
                currentGroup = []
            }
            currentGroup.append(item)
            lastItem = item
        }
        if !currentGroup.isEmpty {
            grouped.append(currentGroup)
        }

        return grouped
    }
    
    func getColor(for item: String) -> Color {
        switch item {
            case "B":
                return Color.red
            case "P":
                return Color.blue
            case "D":
                return Color.green
            default:
                return Color.gray
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(viewModel: MainViewModel())
    }
}
