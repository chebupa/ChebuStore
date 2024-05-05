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
	@State private var qrScannerIsShown: Bool = false
	
    var body: some View {
		NavigationStack {
			GeometryReader { proxy in
				let size = proxy.size
				
				ScrollView {
					AdSliderView(size: size)
					
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
				.toolbar {
					ToolbarItem {
						Button("Scan QR", systemImage: "barcode.viewfinder") {
							qrScannerIsShown.toggle()
						}
					}
				}
				.sheet(isPresented: $qrScannerIsShown) {
					QRScannerView(isPresented: $qrScannerIsShown)
//						.presentationDragIndicator(.visible)
						.presentationDetents([.medium])
				}
				.searchable(text: $searchText,
							placement: .navigationBarDrawer(displayMode: .always))
			}
			.navigationTitle("🛍️ Shop")
		}
    }
}

#Preview {
    ItemsView()
}
