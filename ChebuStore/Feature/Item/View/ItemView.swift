//
//  ItemView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ItemView: View {
	
	let item: ItemModel
	let size: CGSize
	
	var body: some View {
		VStack {
			PhotoTabView(size: size)
			
			NavigationLink(destination: ItemDetailView(item: item)) {
				VStack {
					Text(item.itemName)
						.frame(maxWidth: size.width / 2, alignment: .leading)
						.padding(.leading)
						.font(.system(.headline, weight: .bold))
						.lineLimit(1)
					
					Text("$ \(item.itemPrice)")
						.frame(maxWidth: size.width / 2, alignment: .leading)
						.padding(.leading)
						.font(.footnote)
				}
			}
		}
		.padding(.bottom)
		.background(.lightgray)
		.clipShape(RoundedRectangle(cornerRadius: 20))
	}
}

#Preview {
	GeometryReader { proxy in
		let size = proxy.size
		
		ItemView(item: ItemModel(itemName: "iPhone 14 Pro",
								 itemPrice: 990.0,
								 itemImage: "iphone14proImage"),
				 size: size)
	}
}

// MARK: - PhotoTabView
struct PhotoTabView: View {
	
	let size: CGSize
	
	var body: some View {
		TabView {
			ForEach(1..<4) { _ in
				Image("iphone14proImage")
					.resizable(resizingMode: .stretch)
			}
		}
		.tabViewStyle(PageTabViewStyle())
		.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
		.frame(idealWidth: size.width / 2.25,
			   idealHeight: size.width / 2.25)
		.clipShape(RoundedRectangle(cornerRadius: 20))
	}
}
