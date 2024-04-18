//
//  ItemsView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ItemsView: View {
	
	let columns: [GridItem] = [GridItem(), GridItem()]
	
	@State private var searchText: String = ""
	
    var body: some View {
		GeometryReader { proxy in
			let size = proxy.size
			
			ScrollView {
				LazyVGrid(columns: columns, spacing: 10) {
					ItemView(item: ItemModel(itemName: "iPhone 14 Pro",
											 itemPrice: 990.0,
											 itemImage: "iphone14proImage"),
							 size: size)
					ItemView(item: ItemModel(itemName: "iPhone 14 Pro",
											 itemPrice: 990.0,
											 itemImage: "iphone14proImage"),
							 size: size)
					ItemView(item: ItemModel(itemName: "iPhone 14 Pro",
											 itemPrice: 990.0,
											 itemImage: "iphone14proImage"),
							 size: size)
				}
				.padding()
			}
			.searchable(text: $searchText)
		}
    }
}

#Preview {
    ItemsView()
}
