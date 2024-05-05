//
//  QRScannerView.swift
//  ChebuStore
//
//  Created by aristarh on 05.05.2024.
//

import SwiftUI

struct QRScannerView: View {
	
	@Binding var isPresented: Bool
	
    var body: some View {
		VStack(alignment: .leading) {
			VStack {
				Button("Close") {
					isPresented.toggle()
				}
			}
			.padding()
			.frame(maxWidth: .infinity, alignment: .trailing)
			
			
			Text("QR Scanner")
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
	QRScannerView(isPresented: .constant(true))
}
