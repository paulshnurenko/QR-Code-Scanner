//
//  ContentView.swift
//  QR Code Scanner
//
//  Created by Pavlo Shnurenko on 03.03.2024.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
                
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan a QR Code") {
                self.isPresentingScanner = true
            }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

#Preview {
    ContentView()
}
