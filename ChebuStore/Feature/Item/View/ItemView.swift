//
//  ItemView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI

struct ItemView: View {
	
	@Environment(ItemsViewModel.self) private var VM
	
	let item: ItemModel
	let size: CGSize
	
	var body: some View {
		VStack {
			PhotoTabView(item: item, size: size)
			
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
		.padding(.bottom)
		.background(.lightgray)
		.clipShape(RoundedRectangle(cornerRadius: 20))
		.onTapGesture {
			VM.navPath.append(item)
		}
	}
}

#Preview {
	GeometryReader { proxy in
		let size = proxy.size
		
		ItemView(item: ItemModel(itemName: "iPhone 14 Pro",
								 itemPrice: 990,
								 itemImage: "iphone14proImage"),
				 size: size)
	}
}

// MARK: - PhotoTabView
struct PhotoTabView: View {
	
	let item: ItemModel
	let size: CGSize
	
	var body: some View {
		TabView {
			ForEach(1..<4) { _ in
				Image(item.itemImage)
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
