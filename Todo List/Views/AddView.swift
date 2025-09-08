//
//  AddView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject private var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.8845))
                    .clipShape(.buttonBorder)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(.capsule)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .alert("Text should be atleast 3 letter long", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack{
        AddView(textFieldText: "")
    }
}
