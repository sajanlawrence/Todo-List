//
//  NoItemsView.swift
//  Todo List
//
//  Created by Sajan Lawrence on 08/09/25.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate: Bool = false
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        VStack(spacing: 20){
            Text("There are no items!")
                .font(.title)
                .bold()
            Text("Are you a productive person? I think you should click the Add button and add a bunch of items to your todo list!")
                .padding(.bottom, 20)
            NavigationLink(
                destination: AddView(),
                label: {
                    Text("Add Something 🥳")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(animate ? SecondaryAccentColor : Color.accentColor)
                        .clipShape(.buttonBorder)
                        .padding(.horizontal, animate ? 30 : 50)
                        .shadow(
                            color: animate ? SecondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: 10,
                            x: 0,
                            y: animate ? 20 : 5
                        )
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .offset(y: animate ? -7 : 0)
                })
        }
        .frame(maxWidth: 400)
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
            
        }
    }
}

#Preview {
    NoItemsView()
}
