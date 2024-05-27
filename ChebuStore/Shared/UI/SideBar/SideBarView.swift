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
	private let openedSidebarOffset: CGFloat = UIScreen.screenWidth * 0.6
	
	var body: some View {
		ZStack {
			VStack {
				Rectangle()
					.frame(width: 270, height: .infinity)
					.ignoresSafeArea()
					.foregroundStyle(color)
					.overlay {
						sideContent
							.rotation3DEffect(.degrees(mainContentOffsetX / 14),
											  axis: (x: 0, y: 1, z: 0))
							.scaleEffect(x: mainContentOffsetX / 200,
										 y: mainContentOffsetX / 200)
					}
			}
			.frame(maxWidth: .infinity,
				   maxHeight: .infinity,
				   alignment: position == .left ? .leading : .trailing)
			.background(color)
			
			VStack {
				mainContent()
//					.allowsHitTesting(mainContentOffsetX >= 270 ? false : true)
			}
			.zIndex(1)
//			.blur(radius: mainContentOffsetX >= 270 ? 1 : 0)
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
								mainContentOffsetX = position == .left ? 0 : openedSidebarOffset
							}
						}
						
						// right
						if value.translation.width > 50 {
							withAnimation(.smooth) {
								mainContentOffsetX = position == .left ? openedSidebarOffset : 0
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
