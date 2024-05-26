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
	
	public var position: SideBarPosition
	public var color: Color
	public var sideContent: SideContent
	@ViewBuilder public var mainContent: () -> MainContent
	
	@State private var mainContentOffsetX: CGFloat = 0
	
	var body: some View {
		ZStack {
			VStack {
				Rectangle()
					.frame(width: 270, height: .infinity)
					.ignoresSafeArea()
					.foregroundStyle(color)
					.overlay {
						sideContent
					}
			}
			.frame(maxWidth: .infinity,
				   maxHeight: .infinity,
				   alignment: position == .left ? .leading : .trailing)
			.background(color)
			
			VStack {
				mainContent()
					.allowsHitTesting(mainContentOffsetX == 270 ? false : true)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.offset(x: position == .left ? mainContentOffsetX : -mainContentOffsetX)
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
								mainContentOffsetX = position == .left ? 0 : 275
							}
						}
						
						// right
						if value.translation.width > 50 {
							withAnimation(.smooth) {
								mainContentOffsetX = position == .left ? 275 : 0
							}
						}
					})
					.onEnded({ value in })
			)
		}
    }
}

#Preview {
	SideBarView(position: .left, color: .blue, sideContent: Text("test")) {
		TabView {
			ItemsView()
		}
	}
}
