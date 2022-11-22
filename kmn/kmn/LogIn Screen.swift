//
//  LogIn Screen.swift
//  kmn
//
//  Created by  illia on 10/6/2022.
//

import SwiftUI

struct LogIn_Screen: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            ZStack {
                Image(colorScheme == .light ? "phone1" : "phone")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    
                    VStack {
                        Text("Очки")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        HStack(spacing: 60.0) {
                            VStack(alignment: .leading) {
                                Text("Победа")
                                Text("Ничья")
                                Text("Поражение")
                            }
                            VStack() {
                                Text("+1")
                                Text("+0")
                                Text("-1")
                            }
                        }.foregroundColor(.white)
                            .padding(10)
                            .frame()
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth:3)
                                .foregroundColor(.white)
                        )
                    }.padding(.bottom)

                    
                    
                    NavigationLink {
                        Function()
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.07)
                                .foregroundColor(.black)
                                .shadow(color: .black .opacity(0.7), radius: 15, x: 0, y: 10)
                            Text("ВХОД")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                        }
                    }
                    
                    
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .padding(.top, UIScreen.main.bounds.height * -0.15)
    }
}

struct LogIn_Screen_Previews: PreviewProvider {
    static var previews: some View {
        LogIn_Screen()
            
    }
}
