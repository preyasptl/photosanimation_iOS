//
//  Ext+View.swift
//  PhotosAnimation
//
//  Created by iMacPro on 12/03/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func didFrameChange(result: @escaping (CGRect, CGRect) -> ()) -> some View {
        self
            .overlay{
                GeometryReader {
                    let frame = $0.frame(in: .scrollView(axis: .vertical))
                    let bounds = $0.bounds(of: .scrollView(axis: .vertical)) ?? .zero
                    
                    Color.clear
                        .preference(key: FrameKey.self, value: .init(frame: frame,bounds: bounds))
                        .onPreferenceChange(FrameKey.self) { value in
                            result(value.frame, value.bounds)
                        }
                }
            }
    }
}

struct ViewFrame: Equatable {
    var frame: CGRect = .zero
    var bounds: CGRect = .zero
}

struct FrameKey: PreferenceKey {
    static var defaultValue: ViewFrame = .init()
    static func reduce(value: inout ViewFrame, nextValue: () -> ViewFrame) {
        value = nextValue()
    }
}
