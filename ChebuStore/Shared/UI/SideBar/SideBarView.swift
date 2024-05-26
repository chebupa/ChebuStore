//
//  AnotherSideBarView.swift
//  ChebuStore
//
//  Created by aristarh on 26.05.2024.
//

import SwiftUI

// Helpers
public enum SideBarPosition {
	
	case left
	case right
}

// View
struct SideBarView<SideContent: View, MainContent: View>: View {
	
	public var sideBarPosition: SideBarPosition
	public var sideContent: SideContent
	@ViewBuilder public var mainContent: () -> MainContent
	
	@State private var mainContentOffsetX: CGFloat = 0
	
	var body: some View {
		ZStack {
			VStack {
				Rectangle()
					.frame(width: 270, height: .infinity)
					.ignoresSafeArea()
					.foregroundStyle(.blue)
					.overlay {
						sideContent
					}
			}
			.frame(maxWidth: .infinity,
				   maxHeight: .infinity,
				   alignment: sideBarPosition == .left ? .leading : .trailing)
			.background(.blue)
			
			VStack {
				mainContent()
					.allowsHitTesting(mainContentOffsetX == 270 ? false : true)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(.red)
			.offset(x: sideBarPosition == .left ? mainContentOffsetX : -mainContentOffsetX)
			.onTapGesture {
				withAnimation(.smooth) {
					mainContentOffsetX = 0
				}
			}
			.gesture(
				DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
					.onChanged({ value in
						
						// left
						if value.translation.width < 10 {
							withAnimation(.smooth) {
								mainContentOffsetX = sideBarPosition == .left ? 0 : 275
							}
						}
						
						// right
						if value.translation.width > 50 {
							withAnimation(.smooth) {
								mainContentOffsetX = sideBarPosition == .left ? 275 : 0
							}
						}
					})
					.onEnded({ value in })
			)
		}
    }
}

#Preview {
	SideBarView(sideBarPosition: .left, sideContent: Text("test")) {
		TabView {
			ItemsView()
		}
	}
}
