//
//  BucketList.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct BucketListItem: Identifiable, Hashable {
    var id: String?

    var title: String

}

class BucketListStore : ObservableObject {
    @Published var bucketListItems = [BucketListItem]()
}
