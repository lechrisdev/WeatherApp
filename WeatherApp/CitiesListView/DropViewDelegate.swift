//
//  DropViewDelegate.swift
//  WeatherApp
//
//  Created by Le Chris on 11.05.2023.
//

import Foundation

//struct DropViewDelegate: DropDelegate {
//    
//    let destinationItem: Color
//    @Binding var colors: [Color]
//    @Binding var draggedItem: Color?
//    
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//    
//    func performDrop(info: DropInfo) -> Bool {
//        draggedItem = nil
//        return true
//    }
//    
//    func dropEntered(info: DropInfo) {
//        // Swap Items
//        if let draggedItem {
//            let fromIndex = colors.firstIndex(of: draggedItem)
//            if let fromIndex {
//                let toIndex = colors.firstIndex(of: destinationItem)
//                if let toIndex, fromIndex != toIndex {
//                    withAnimation {
//                        self.colors.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
//                    }
//                }
//            }
//        }
//    }
//    
//}
