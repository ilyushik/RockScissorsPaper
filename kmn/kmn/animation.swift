//
//  animation.swift
//  kmn
//
//  Created by  illia on 24/6/2022.
//

import SwiftUI

struct animation: View {
    @State private var dragAmoun = CGSize.zero
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.45)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        
                    
                    Button {
                        self.dragAmoun = .zero
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.05)
                                .foregroundColor(.black)
                            Text("Close")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                        
                }.offset(y: UIScreen.main.bounds.height * 0.41)
                .offset(x: dragAmoun.width, y: dragAmoun.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.dragAmoun = value.translation
                        }
                    
                )
                .animation(.spring())
            }
        }
    }
}

struct animation_Previews: PreviewProvider {
    static var previews: some View {
        animation()
    }
}
