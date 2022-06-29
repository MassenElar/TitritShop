//
//  PayementButton.swift
//  TitritShop
//
//  Created by developer on 6/29/22.
//

import SwiftUI
import PassKit

struct PayementButton: View {
    
    var action: () ->  Void
    
    var body: some View {
        Representable(action: action)
            .frame(minWidth: 200, maxWidth: 400)
            .frame(height: 40)
            .cornerRadius(8)
            .frame(maxWidth: .infinity)
            .padding()
    }
}

struct PayementButton_Previews: PreviewProvider {
    static var previews: some View {
        PayementButton(action: {})
    }
}

extension PayementButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc func callback(_ sender: Any) {
            action()
        }
    }
}
