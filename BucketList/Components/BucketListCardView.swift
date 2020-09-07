//
//  BucketListCardView.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct BucketListCardView: View {
    
    // MARK: Properties
    
    let bucketListItem: BucketListItem
    
    // action closure that will be executed when the card is pressed.
    let action: () -> Void
    
    // MARK: Init

    init(bucketListItem: BucketListItem, action: @escaping () -> Void) {
        self.bucketListItem = bucketListItem
        self.action = action
    }
    
    // MARK: View
    
    var body: some View {
        
        Button(action: action, label: {
            Text("hi")
        })
    }
}

struct BucketListCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let bucketListItem = BucketListItem(id: UUID().uuidString, title: "Canada", description: "See the beautiful scenery", imageName: "", years: 2)
        
        return BucketListCardView(bucketListItem: bucketListItem, action: {})
    }
}
