//
//  ContentView.swift
//  PhotosAnimation
//
//  Created by iMacPro on 12/03/25.
//

import SwiftUI

struct ContentView: View {
    var coordinator: UICoordinator = .init()
    var body: some View {
        NavigationStack{
            Home()
                .environment(coordinator)
                .allowsHitTesting(coordinator.selectedItem == nil)
        }
        .overlay {
            Rectangle()
                .fill(.background)
                .ignoresSafeArea()
                .opacity(coordinator.animatedView ? 1 -  coordinator.dragProgress : 0)
        }
        .overlay {
            if coordinator.selectedItem != nil {
                Detail().environment(coordinator)
                    .allowsHitTesting(coordinator.showDetailView)
            }
        }
        .overlayPreferenceValue(HeroKey.self) { value in
            if let selectedItem = coordinator.selectedItem,
               let sAnchor = value[selectedItem.id + "SOURCE"],
                let dAnchor = value[selectedItem.id + "DEST"] {
                Hero(
                    item: selectedItem,
                    sAnchor: sAnchor,
                    dAnchor: dAnchor
                )
                .environment(coordinator)
            }
        }
    }
}

#Preview {
    ContentView()
}
