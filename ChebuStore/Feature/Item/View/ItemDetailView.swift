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
			
			ScrollView {
				VStack {
					TabView {
						ForEach(1..<4) { _ in
							Image(item.itemImage)
								.resizable()
								.frame(width: size.width, height: size.width)
						}
					}
					.tabViewStyle(PageTabViewStyle())
					.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
					.frame(width: size.width, height: size.width)
					
					VStack {
						Text(item.itemName)
							.font(.system(size: 25, weight: .bold))
							.frame(maxWidth: .infinity, alignment: .leading)
						
						Text("$ \(item.itemPrice)")
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.padding()
				}
			}
		}
		.navigationTitle(item.itemName)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button("", systemImage: "heart") {
				//
			}
		}
    }
}

//#Preview {
//	ItemDetailView(item: ItemModel(itemName: "iPhone 14 Pro",
//								   itemPrice: 990,
//								   itemImage: "chebupaImage"))
//}
