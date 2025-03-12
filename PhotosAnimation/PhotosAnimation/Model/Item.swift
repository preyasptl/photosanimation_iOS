//
//  Item.swift
//  PhotosAnimation
//
//  Created by iMacPro on 12/03/25.
//

import SwiftUI

struct Item: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var image: UIImage?
    var previewImage: UIImage?
    var appeared: Bool = false
}

var sampleItems: [Item] = [
    .init(title: "File01",image: UIImage(named: "File1")),
    .init(title: "File02",image: UIImage(named: "File2")),
    .init(title: "File03",image: UIImage(named: "File3")),
    .init(title: "File04",image: UIImage(named: "File4")),
    .init(title: "File05",image: UIImage(named: "File5")),
    .init(title: "File06",image: UIImage(named: "File6")),
    .init(title: "File07",image: UIImage(named: "File7")),
    .init(title: "File08",image: UIImage(named: "File8")),
    .init(title: "File09",image: UIImage(named: "File9")),
    .init(title: "File10",image: UIImage(named: "File10")),
    .init(title: "File11",image: UIImage(named: "File11")),
    .init(title: "File12",image: UIImage(named: "File12")),
    .init(title: "File13",image: UIImage(named: "File13")),
    .init(title: "File14",image: UIImage(named: "File14")),
    .init(title: "File15",image: UIImage(named: "File15")),
    .init(title: "File16",image: UIImage(named: "File16")),
    .init(title: "File17",image: UIImage(named: "File17")),
    .init(title: "File18",image: UIImage(named: "File18")),
    .init(title: "File19",image: UIImage(named: "File19")),
    .init(title: "File20",image: UIImage(named: "File20")),
    .init(title: "File21",image: UIImage(named: "File21")),
    .init(title: "File22",image: UIImage(named: "File22")),
    .init(title: "File23",image: UIImage(named: "File23")),
    .init(title: "File24",image: UIImage(named: "File24")),
    .init(title: "File25",image: UIImage(named: "File25")),
    .init(title: "File26",image: UIImage(named: "File26")),
    .init(title: "File27",image: UIImage(named: "File27")),
    .init(title: "File28",image: UIImage(named: "File28")),
    .init(title: "File29",image: UIImage(named: "File29")),
    .init(title: "File30",image: UIImage(named: "File30")),
    .init(title: "File31",image: UIImage(named: "File31")),
    .init(title: "File32",image: UIImage(named: "File32")),
    .init(title: "File33",image: UIImage(named: "File33")),
    .init(title: "File34",image: UIImage(named: "File34")),
    .init(title: "File35",image: UIImage(named: "File35")),
    .init(title: "File36",image: UIImage(named: "File36")),
    .init(title: "File37",image: UIImage(named: "File37")),
    .init(title: "File38",image: UIImage(named: "File38")),
    .init(title: "File39",image: UIImage(named: "File39")),
    .init(title: "File40",image: UIImage(named: "File40")),
    .init(title: "File41",image: UIImage(named: "File41")),
    .init(title: "File42",image: UIImage(named: "File42")),
    .init(title: "File43",image: UIImage(named: "File43")),
    .init(title: "File44",image: UIImage(named: "File44")),
]
