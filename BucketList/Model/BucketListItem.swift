//
//  BucketList.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import Foundation
import SwiftUI

struct BucketListItem: Identifiable, Hashable {
    var id: String?

    var title: String
    
    var description: String
    
    var imageName: String
    
    var years: Int
}
