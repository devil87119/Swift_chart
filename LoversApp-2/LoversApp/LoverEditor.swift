//
//  LoverEditor.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var loversData: LoversData
    @State private var name = ""
    @State private var hours = 0
    @State private var trueHeart = true
    var editLover: Lover?
    
    var body: some View {
        Form {
            TextField("行程", text: $name)
            Stepper("小時 \(hours)", value: $hours, in: 0...(24-total.hr+total.pre_hr))
            Toggle("真心", isOn: $trueHeart)
        }
        .navigationBarTitle(editLover == nil ? "Add new lover" : "Edit lover")
        .navigationBarItems(trailing: Button("Save") {
            let lover = Lover(name: self.name, hours: self.hours, trueHeart: self.trueHeart)
            if(!(self.editLover == nil)){
                total.hr = total.hr - total.pre_hr
            }
            total.hr = total.hr + lover.hours
            total.pre_hr = 0
            if let editLover = self.editLover {
                let index = self.loversData.lovers.firstIndex {
                    $0.id == editLover.id
                    }!
                self.loversData.lovers[index] = lover
            } else {
                self.loversData.lovers.insert(lover, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editLover = self.editLover {
                    self.name = editLover.name
                    self.hours = editLover.hours
                    self.trueHeart = editLover.trueHeart
                    total.temp = 0
                    if(!(self.editLover == nil)){
                        total.pre_hr = self.hours
                    }
                    else{
                        total.pre_hr = 0
                    }
                }
        }
        
    }
    
}

struct LoverEditor_Previews: PreviewProvider {
    static var previews: some View {
        LoverEditor(loversData: LoversData())
    }
}
