//
//  AddView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 06/09/25.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(white: 0.8745))
                        .clipShape(.buttonBorder)
                    
                    Button {
                        
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
        }
    }
}

#Preview {
    AddView(textFieldText: "")
}
