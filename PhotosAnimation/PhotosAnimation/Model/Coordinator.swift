//
//  Coordinator.swift
//  PhotosAnimation
//
//  Created by iMacPro on 12/03/25.
//

import SwiftUI

@Observable
class UICoordinator {
    var items:[Item] = sampleItems.compactMap({
        Item(title: $0.title, image: $0.image, previewImage: $0.image)
    })
    
    ///Animation Properties
    var selectedItem: Item?
    var animatedView: Bool = false
    var showDetailView: Bool = false
    ///Scroll Position
    var detailScrollPosition: String?
    var detailIndicatorPosition: String?
    /// Gesture Properties
    var offset: CGSize = .zero
    var dragProgress: CGFloat = 0

    func didDetailPageChanged() {
        if let updatedItem = items.first(where: {$0.id == detailScrollPosition}) {
            selectedItem = updatedItem
            
            ///Updating Indicator Position
            withAnimation(.easeInOut(duration: 0.1)) {
                detailIndicatorPosition = updatedItem.id
            }
        }
    }
    
    func didDetailIndicatorPageChanged() {
        if let updatedItem = items.first(where: {$0.id == detailIndicatorPosition}) {
            selectedItem = updatedItem
            
            /// Updating detail paging view as well
            detailScrollPosition = updatedItem.id
        }
    }
    
    func toogleView(show: Bool){
        if show {
            detailScrollPosition = selectedItem?.id
            detailIndicatorPosition = selectedItem?.id
            withAnimation(.easeInOut(duration: 0.2), completionCriteria: .removed){
                animatedView = true
            } completion: {
                self.showDetailView = true
            }
        } else {
            showDetailView = false
            withAnimation(.easeInOut(duration : 0.2), completionCriteria: .removed){
                animatedView = false
                offset = .zero
            } completion: {
                self.resetAnimationProperties()
            }
        }
    }
    
    func resetAnimationProperties(){
        selectedItem = nil
        detailScrollPosition = nil
        offset = .zero
        dragProgress = 0
        detailIndicatorPosition = nil
    }
    
    // Other properties and methods...
    
    func showNextItem() {
        guard let currentItem = selectedItem, let currentIndex = items.firstIndex(where: { $0.id == currentItem.id }) else { return }
        let nextIndex = (currentIndex + 1) % items.count
        selectedItem = items[nextIndex]
        updateDetailPosition()
    }
    
    func showPreviousItem() {
        guard let currentItem = selectedItem, let currentIndex = items.firstIndex(where: { $0.id == currentItem.id }) else { return }
        let previousIndex = (currentIndex - 1 + items.count) % items.count
        selectedItem = items[previousIndex]
        updateDetailPosition()
    }
    
    private func updateDetailPosition() {
        detailScrollPosition = selectedItem?.id
        detailIndicatorPosition = selectedItem?.id
    }
}
