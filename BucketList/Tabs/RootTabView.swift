//
//  TabViewController.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    
    var body: some View {
        TabView {
            
            BucketListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Bucket List")
            }
            BucketMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
            }
        }
    }
}
