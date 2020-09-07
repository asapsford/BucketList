//
//  BucketListView.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct BucketListView: View {
    var body: some View {
        NavigationView {
            List {
                Section (header:
                    Text("Dream Locations")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.vertical, 4.0)) {
                            Image(systemName: "circle")
                }
            }
            .navigationBarTitle("Bucket List")
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
