//
//  QrCode.swift
//  QRCode
//
//  Created by Manoj Amsavel on 9/7/23.
//

import SwiftUI
import CodeScanner
struct QRCodeScannerExampleView: View {
    @State private var PresentingScannerView = false
    @State private var scannedQRCode: String = "Scanner QR Demo"
    
    var scanner : some View{
        CodeScannerView(codeTypes: [.qr], completion: { result in
            if case let .success(code) = result {
                self.scannedQRCode = code.string
                self.PresentingScannerView = false
            }
        }
        )
        
    }
    var body: some View {
        VStack() {
            Text(scannedQRCode)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .font(.headline)
            
            
            Button("Scan Code") {
                self.PresentingScannerView = true
            }
            
           
                
                
            
            
            .padding()
            .background(Color(red: 0,green: 0,blue: 0.5))
            .clipShape(Capsule())
            .sheet(isPresented: $PresentingScannerView) {
                self.scanner
            }
        }
    }
}
struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}

