//
//  ItemsView.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import SwiftUI
import Observation

struct ItemsView: View {
	
	@State private var VM = ItemsViewModel()
	
    var body: some View {
		NavigationStack(path: $VM.navPath) {
			GeometryReader { proxy in
				let size: CGSize = proxy.size
				
				ScrollView {
					AdSliderView(size: size)
					
					LazyVGrid(columns: VM.columns, spacing: 10) {
						ForEach(try! VM.getItems()) { item in
							ItemView(item: item, size: size)
						}
					}
					.padding()
				}
				.toolbar {
					ToolbarItem {
						Button("Scan QR", systemImage: "barcode.viewfinder") {
							VM.qrScannerIsShown.toggle()
						}
					}
				}
				.sheet(isPresented: $VM.qrScannerIsShown) {
					QRScannerView(isPresented: $VM.qrScannerIsShown)
						.presentationDetents([.medium])
				}
				.searchable(text: $VM.searchText,
							placement: .navigationBarDrawer(displayMode: .always))
			}
			.navigationTitle("🛍️ Shop")
			.navigationDestination(for: ItemModel.self) { selection in
				BottomBarContainer(mainContent: ItemDetailView(item: selection.self),
								   bottomContent: BottomButtonView(text: "Add to cart",
																   image: "cart",
																   action: { print("") }))
			}
		}
		.environment(VM)
    }
}

#Preview {
    ContentView()
}

// MARK: - BottomButtonView
struct BottomButtonView: View {
	
	@State private var VM: BottomButtonViewModel = BottomButtonViewModel()
	
	public let text: String
	public let image: String
	public var action: () -> Void?
	
	var body: some View {
		Button(text, systemImage: image) {
			action()
		}
		.buttonStyle(BorderedProminentButtonStyle())
		.frame(maxWidth: .infinity)
		.background(.blue)
		.padding(.bottom, 1)
		.offset(x: 0, y: VM.viewDidLoad ? 0 : 1000)
		.opacity(VM.viewDidLoad ? 1 : 0)
		.onAppear {
			withAnimation(.snappy(extraBounce: 0.1).delay(0.45)) {
				VM.viewDidLoad = true
			}
		}
		.onDisappear {
			VM.viewDidLoad = false
		}
	}
}

@Observable
final class BottomButtonViewModel {
	
	var viewDidLoad: Bool
	
	init(viewDidLoad: Bool = false) {
		self.viewDidLoad = viewDidLoad
	}
}
