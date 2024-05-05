//
//  ItemDetailView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ItemDetailView: View {
	
	var item: ItemModel
	
    var body: some View {
		GeometryReader { proxy in
			let size = proxy.size
			
			VStack {
				TabView {
					ForEach(1..<4) { _ in
						Image("iphone14proImage")
							.resizable()
							.frame(width: size.width, height: size.width)
					}
				}
				.tabViewStyle(PageTabViewStyle())
				.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
				.frame(
					width: size.width,
					height: size.width)
			}
		}
		.navigationTitle(item.itemName)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	ItemDetailView(item: ItemModel(itemName: "iPhone 14 Pro",
								   itemPrice: 990.0,
								   itemImage: "iphone14proImage"))
}
