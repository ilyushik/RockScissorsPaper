//
//  Function.swift
//  kmn
//
//  Created by  illia on 10/6/2022.
//

import SwiftUI


func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

func impakt(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}
    
struct Function: View {
    @State private var switchToggle = false
    @State private var dragAmoun = CGSize.zero
    @Environment(\.colorScheme) var colorScheme
    @State private var themeChoise = false
    @State private var smenaTsveta = 0
    @State private var playerLose = 0
    @State private var playerWin = 0
    @State private var notLoseNotWin = 0
    @State private var score = 0
    @State private var dragAmount = CGSize.zero
    @State private var buttonRotation = 0.0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMatch = 0
    @State private var scoreMessage = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var image = ["камень", "ножницы", "бумага"]
    var body: some View {
        ZStack {
                if smenaTsveta == 0 {
                    Image("phon1")
                        .resizable()
                        .ignoresSafeArea()
                }
                if smenaTsveta == 1 {
                    Image("phon2")
                        .resizable()
                        .ignoresSafeArea()
                }
                if smenaTsveta == 2 {
                    Image("phon5")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                    HStack {
                        Text("Камень")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame()
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20)
                        Text("Ножницы")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame()
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20)
                        Text("Бумага")
                            .font(.title2)
                            .foregroundColor(.black)
                            .frame()
                            .padding(10)
                            .background(.white)
                            .cornerRadius(20)
                    }.offset(y: UIScreen.main.bounds.height * 0.055)
                    Spacer()
                    VStack {
                        HStack {
                            ForEach(0..<3) { number in
                                Button(action: {
                                    withAnimation(.interpolatingSpring(stiffness: 4, damping: 3)) {
                                        buttonRotation += 360
                                    }
                                    self.handTapped(number)
                                }) {
                                    Image(self.image[number])
                                        .resizable()
                                        .frame(width: 70, height: 60)
                                        .padding()
                                        .frame()
                                        .background(.white)
                                        .cornerRadius(20)
                                        .shadow(color: .black, radius: 3)
                                        .rotation3DEffect(.degrees(buttonRotation), axis: (x:1, y:0, z:0))
                                        
                                    }
                                }
                        }.frame()
                        .padding(8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                        .padding(.top, UIScreen.main.bounds.height * 0.05)
                        .padding(.bottom, UIScreen.main.bounds.height * -0.05)
                        .offset(y: UIScreen.main.bounds.height * 0.05)
                        
                    }.offset(y: UIScreen.main.bounds.height * -0.06)
                    
                    HStack {
                        Text("Ваш счёт:")
                            .font(.system(size: 25))
                        Text("\(scoreMatch)")
                            .font(.largeTitle)
                    }.padding()
                        .foregroundColor(.white)
                    HStack(spacing: 20.0) {
                        VStack(alignment: .leading) {
                        Text("Побед:")
                        Text("Ничьих:")
                        Text("Поражений:")
                        }
                        VStack {
                            Text("\(playerWin)")
                            Text("\(notLoseNotWin)")
                            Text("\(playerLose)")
                        }
                    }.foregroundColor(.white)
                        .padding(10)
                        .frame()
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth:3)
                            .foregroundColor(.white)
                        )
                    
                    Button {
                        self.scoreMatch = 0
                        self.playerLose = 0
                        self.playerWin = 0
                        self.notLoseNotWin = 0
                    } label: {
                        Text("Сброс")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame()
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth:3)
                                .foregroundColor(.white)
                            )
                    }
                   
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.1)
                            .foregroundStyle(.ultraThinMaterial)
                            .cornerRadius(20)
                        HStack {
                            Text("Чтобы поменять фон")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                                .cornerRadius(20)

                            ZStack {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.16, height: UIScreen.main.bounds.height * 0.04)
                                    .foregroundColor(themeChoise ? .green : .gray)
                                    .cornerRadius(25)
                                    .animation(.spring())
                                Circle()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width * 0.07)
                                    .foregroundColor(.white)
                                    .offset(x: themeChoise ? UIScreen.main.bounds.width * 0.035 : UIScreen.main.bounds.width * -0.035)
                                    
                                    .animation(.linear(duration: 0.35))
                            }.onTapGesture {
                                self.themeChoise.toggle()
                                impact(style: .light)
                            }
                        }
                        
                        
                        
                    }.offset(y: UIScreen.main.bounds.height * 0.05)
                   
                    VStack {
                    
                        ZStack {
                                Capsule()
                                    .frame(width: UIScreen.main.bounds.width * 0.6 )
                                    .frame(height: UIScreen.main.bounds.height * 0.07)
                                    .foregroundStyle(.thinMaterial)
                                
                                
                                ZStack {
                                        if smenaTsveta == 0 {
                                            Circle()
                                                .frame(width: UIScreen.main.bounds.width * 0.12)
                                                .foregroundColor(colorScheme == .light ? .white : .black)
                                                .offset(x: UIScreen.main.bounds.width * -0.2113)
                                                .animation(.spring())
                                                
                                        }
                                        if smenaTsveta == 1 {
                                            Circle()
                                                .frame(width: UIScreen.main.bounds.width * 0.12)
                                                .foregroundColor(colorScheme == .light ? .white : .black)
                                                .animation(.spring())
                                        }
                                        if smenaTsveta == 2 {
                                            Circle()
                                                .frame(width: UIScreen.main.bounds.width * 0.12)
                                                .foregroundColor(colorScheme == .light ? .white : .black)
                                                .offset(x: UIScreen.main.bounds.width * 0.2113)
                                                .animation(.spring())
                                        }
                                    
                                    
                                    
                                    HStack {
                                        Spacer()
                                        Spacer()
                                        Image("phon1")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width * 0.09)
                                            .clipShape(Circle())
                                            .onTapGesture {
                                                self.smenaTsveta = 0
                                                impact(style: .rigid)
                                            }
                                        Spacer()
                                        Image("phon2")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width * 0.09)
                                            .clipShape(Circle())
                                            
                                            .onTapGesture {
                                                self.smenaTsveta = 1
                                                impact(style: .rigid)
                                            }
                                        Spacer()
                                        Image("phon5")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width * 0.09)
                                            .clipShape(Circle())
                                            .onTapGesture {
                                                self.smenaTsveta = 2
                                                impact(style: .rigid)
                                            }
                                        Spacer()
                                        Spacer()
                                        
                                      
                                    }
                                    
                                }.animation(.spring())
                                
                              
                                
                            }
                        
                        ZStack {
                            Capsule()
                                .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.07)
                                .foregroundColor(.black)
                            Text("OK")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }.onTapGesture {
                            impact(style: .light)
                            self.themeChoise.toggle()
                        }
                    }.padding(.top, UIScreen.main.bounds.height * 0.13)
                        .offset(y: themeChoise ? UIScreen.main.bounds.height * -0.07 : UIScreen.main.bounds.height * 0.2)
                    .animation(.spring())
                    
                    
                    Spacer()
                }.padding(.top, UIScreen.main.bounds.height * 0.1)
            
//            ZStack {
//                Rectangle()
//                    .frame(width: UIScreen.main.bounds.width * 0.9)
//                    .frame(height: UIScreen.main.bounds.height * 0.2)
//                    .foregroundColor(.clear)
//                .cornerRadius(15)
//                .offset(y: themeChoise ? UIScreen.main.bounds.height * 0.35 : UIScreen.main.bounds.height * 0.6)
//                .animation(.spring())
//            }
                
            }
            .alert(isPresented:$showingScore) {
                Alert(title:Text("Выбор компьютера: \(image[correctAnswer])")
                      ,message: Text("\(scoreMessage)\n У вас \(scoreMatch) "),dismissButton: .default(Text("Продолжить")) {
                        self.askQuestion()
                    })
                }
    }
    
    func handTapped(_ number: Int) {
        if number == correctAnswer {
           scoreMessage = "Ничья"
            self.scoreMatch += 0
            self.notLoseNotWin += 1
            impact(style: .heavy)
        } else if number == 0 && correctAnswer == 1 {
            scoreMessage = "Победа, +1"
            self.scoreMatch += 1
            self.playerWin += 1
            impakt(type: .success)
        } else if number == 1 && correctAnswer == 2 {
            scoreMessage = "Победа, +1"
            self.scoreMatch += 1
            self.playerWin += 1
            impakt(type: .success)
        } else if number == 2 && correctAnswer == 0 {
            scoreMessage = "Победа, +1"
            self.scoreMatch += 1
            self.playerWin += 1
            impakt(type: .success)
        } else if number == 0 && correctAnswer == 2 {
            scoreMessage = "Поражение, -1"
            self.scoreMatch -= 1
            self.playerLose += 1
            impakt(type: .error)
        } else if number == 1 && correctAnswer == 0 {
            scoreMessage = "Поражение, -1"
            self.scoreMatch -= 1
            self.playerLose += 1
            impakt(type: .error)
        } else if number == 2 && correctAnswer == 1 {
            scoreMessage = "Поражение, -1"
            self.scoreMatch -= 1
            self.playerLose += 1
            impakt(type: .error)
        }
        showingScore = true
    }
    func askQuestion() {
                correctAnswer = Int.random(in: 0...2)
    }
    
}

struct Function_Previews: PreviewProvider {
    static var previews: some View {
        Function()
    }
}


