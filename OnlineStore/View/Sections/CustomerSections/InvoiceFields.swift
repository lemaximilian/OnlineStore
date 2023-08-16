//
//  InvoiceFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct InvoiceFields: View {
    @EnvironmentObject var appVM: AppViewModel
    @Binding var checkedShipping: Bool
    let total: Float
    
    var body: some View {
        InvoiceRow(text: "Subtotal:", figureString: appVM.numberFormatterDecimal.string(from: NSNumber(value: checkedShipping ? total * 0.81 : (total - 4.99) * 0.81)) ?? "")
        
        InvoiceRow(text: "Taxes:", figureString: appVM.numberFormatterDecimal.string(from: NSNumber(value: checkedShipping ? total * 0.19 : (total - 4.99) * 0.19)) ?? "")
        
        InvoiceRow(text: "Shipping:", figureString: checkedShipping ? "0" : "4,99")
        
        Divider()
            .padding(.horizontal)
        
        InvoiceRowBold(text: "Total:", figureString: appVM.numberFormatterDecimal.string(from: NSNumber(value: total)) ?? "")
        
        Divider()
            .padding(.horizontal)
    }
}

