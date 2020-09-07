//
//  ExpandedListCardView.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

/// View which provides an expanded layout for displaying a bucket list item.
struct ExpandedListCardView: View {
    
    let bucketListItem: BucketListItem
    let tintColor: Color?
    
    
    init(bucketListItem: BucketListItem, tintColor: Color? = nil) {
        self.bucketListItem = bucketListItem
        self.tintColor = tintColor
    }
    
    var body: some View {
        VStack(spacing: 24.0){
        VStack(alignment: .leading, spacing: 4.0) {
                Text(bucketListItem.title)
                    .font(.title)
                Text(bucketListItem.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct ExpandedListCardView_Previews: PreviewProvider {
    static var previews: some View {
         
        let bucketListItem = BucketListItem(id: UUID().uuidString, title: "Canada", description: "See the beautiful scenery", imageName: "", years: 2)
        
        return ExpandedListCardView(bucketListItem: bucketListItem)
    }
}
