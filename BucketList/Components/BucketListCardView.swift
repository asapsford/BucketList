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
        
        return AnyView(
        
        Button(action: action, label: {
            ExpandedListCardView(bucketListItem: bucketListItem)
        })
            .buttonStyle(CardButtonStyle(background: { Color(red: 0.45, green: 0.95, blue: 0.8) }))
        )
    }
}

struct BucketListCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let bucketListItem = BucketListItem(id: UUID().uuidString, title: "Canada")
        
        return BucketListCardView(bucketListItem: bucketListItem, action: {})
    }
}
