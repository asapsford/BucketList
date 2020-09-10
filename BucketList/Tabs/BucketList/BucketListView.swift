//
//  BucketListView.swift
//  BucketList
//
//  Created by Alex Sapsford on 07/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI
import Combine

struct BucketListView: View {
    
    @ObservedObject var bucketListStore = BucketListStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Travel destination?", text: self.$newToDo)
            Button(action: self.addNewBucketListItem, label: {
                Text("Add a new bucket list")
            })
        }
    }
    
    func addNewBucketListItem () {
        bucketListStore.bucketListItems.append(BucketListItem(id: String(bucketListStore.bucketListItems.count + 1), title: newToDo))
        self.newToDo = ""
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                searchBar.padding()
            List {
                Section (header:
                    Text("Dream Locations")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.vertical, 4.0)) {
                            ForEach( self.bucketListStore.bucketListItems) {
                                bucketListItem in
                                BucketListCardView(bucketListItem: bucketListItem, action: {})
                            }.onMove(perform: self.move)
                            .onDelete(perform: self.delete)
                    }
                }
            .navigationBarTitle("Bucket List")
            .navigationBarItems(trailing: EditButton())
            }
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
        bucketListStore.bucketListItems.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        bucketListStore.bucketListItems.remove(atOffsets: offsets)
    }
    
}
struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
