//
//  TutorialView.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

struct BlackBackground: View {
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .opacity(0.5)
    }
}

struct BrownRectangle: View {
    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("brown"))
                .frame(width: 600, height: 300)
            
            Spacer()
        }

    }
}

struct TutorialIndex: View {
    var currentIndex: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(currentIndex)
                    .foregroundColor(.white)
                    .font(Font.custom("GillSans", size: 20))
                    .padding(.top, 60)
                    .padding(.trailing, 30)
            }
            Spacer()
        }
    }
}

struct TutorialArrow: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "triangleshape.fill")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom, 45)
                    .padding(.trailing, 20)
            }
        }
    }
}

struct TutorialViewTitle: View {
    var titleCalled: String
    
    var body: some View {
        Image(titleCalled)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 40)
    }
}

struct TutorialView1Text: View {
    var body: some View {
        VStack {
            HStack {
                Text("Help")
                
                Text("Hedgie's").italic()
                
                Text("socialization by preserving his")
                
                Text("Social Energy").italic().foregroundColor(Color("blue"))
            }
            
            HStack {

                Text("and increasing the opponent's")

                Text("Quality Time").italic().foregroundColor(Color("red"))
            }
        }
        .font(Font.custom("GillSans", size: 20))
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
}

struct Balloons: View {
    var body: some View {
        HStack(spacing: 32) {
            Image("balloonLeft")
                .resizable()
                .scaledToFill()
                .frame(width: 195, height: 110)
                .overlay(
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Hedgie")
                            .font(Font.custom("GillSans", size: 20)).italic()
                        
                        HStack(spacing: 16) {
                            Text("Social Energy")
                            Text("35/35")
                        }
                        .font(Font.custom("GillSans", size: 14))
                        
                        ProgressView(value: 1)
                            .frame(width: 135)
                            .tint(Color("blue"))
                        
                        Spacer()
                    }
                    .padding(.top, 23)
                )
            
            Image("balloonRight")
                .resizable()
                .scaledToFill()
                .frame(width: 195, height: 110)
                .overlay(
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Otty")
                            .font(Font.custom("GillSans", size: 20)).italic()
                        
                        HStack(spacing: 16) {
                            Text("Quality Time")
                            Text("15/50")
                        }
                        .font(Font.custom("GillSans", size: 14))
                        
                        ProgressView(value: 0.3)
                            .frame(width: 135)
                            .tint(Color("red"))
                        
                        Spacer()
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 23)
                )
        }
    }
}

struct RedSkills: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("The")
                    Text("red skills").italic().foregroundColor(Color("red"))
                    Text("are")
                }
                HStack {
                    Text("offensive and increase the")
                }
                HStack {
                    Text("opponent's")
                    Text("Quality Time").italic().foregroundColor(Color("red"))
                }
            }
            .foregroundColor(.white)
            .font(Font.custom("GillSans", size: 20))
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("red"))
                .frame(width: 110, height: 110)
                .overlay(
                    VStack {
                        Text("Just Smile")
                            .font(Font.custom("GillSans", size: 20)).italic()
                            .frame(height: 50)
                            .multilineTextAlignment(.center)
                        
                        Divider()
                            .frame(width: 100)
                            .background(.black)
                            .padding(.top, -8)
                        
                        HStack {
                            Text("+15")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                            
                            Text("Quality Time")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, -11)
                    }
                        .padding(.horizontal, 6)
                        .padding(.bottom, 6)
                )
        }
    }
}

struct BlueSkills: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("The")
                    Text("blue skills").italic().foregroundColor(Color("blue"))
                    Text("are")
                }
                HStack {
                    Text("defensive and restore")
                }
                HStack {
                    Text("Hedgie's").italic()
                    Text("Social Energy").italic().foregroundColor(Color("blue"))
                }
            }
            .foregroundColor(.white)
            .font(Font.custom("GillSans", size: 20))
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("blue"))
                .frame(width: 110, height: 110)
                .overlay(
                    VStack {
                        Text("Stay Silent")
                            .font(Font.custom("GillSans", size: 20)).italic()
                            .frame(height: 50)
                            .multilineTextAlignment(.center)
                        
                        Divider()
                            .frame(width: 100)
                            .background(.black)
                            .padding(.top, -8)
                        
                        HStack {
                            Text("+5")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                            
                            Text("Social Energy")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, -11)
                    }
                        .padding(.horizontal, 6)
                        .padding(.bottom, 6)
                )
        }
    }
}

struct SkillCooldown: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Each skill has its own recharge time. Use them wisely")
                .foregroundColor(.white)
                .font(Font.custom("GillSans", size: 20))
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("red"))
                .frame(width: 110, height: 110)
                .overlay(
                    VStack {
                        Text("Ask a Question")
                            .font(Font.custom("GillSans", size: 20)).italic()
                            .frame(height: 50)
                            .multilineTextAlignment(.center)
                        
                        Divider()
                            .frame(width: 100)
                            .background(.black)
                            .padding(.top, -8)
                        
                        HStack {
                            Text("+25")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                            
                            Text("Quality Time")
                                .font(Font.custom("GillSans", size: 14))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, -11)
                    }
                        .padding(.horizontal, 6)
                        .padding(.bottom, 6)
                )
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color("yellow"))
                                .frame(width: 60, height: 40)
                                .overlay(
                                    HStack {
                                        Text("2")
                                        Image(systemName: "clock")
                                    }
                                    .font(Font.custom("GillSans", size: 16))
                                )
                        }
                        .padding(.bottom, 120)
                        
                        Spacer()
                    }
                )
        }
    }
}


struct TutorialView1: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            BattleView()
            
            ZStack {
                BlackBackground()
                
                BrownRectangle()
                    .overlay(
                        VStack(spacing: 16) {
                            Spacer()
                            
                            TutorialViewTitle(titleCalled: "yourGoal")
                            
                            TutorialView1Text()
                            
                            Balloons()
                            
                            Spacer()
                        }
                    )
                    .overlay(
                        TutorialIndex(currentIndex: "1/3")
                    )
                    .overlay(
                        NavigationLink(destination: {
                            TutorialView2()
                        }, label: {
                            TutorialArrow()
                        })
                    )
            }
        }
    }
}

struct TutorialView2: View {
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            BattleView()
            
            ZStack {
                BlackBackground()

                BrownRectangle()
                    .overlay(
                        VStack(spacing: 16) {
                            Spacer()

                            TutorialViewTitle(titleCalled: "yourSkills")

                            HStack(spacing: 32) {
                                RedSkills()
                                BlueSkills()
                            }

                            Spacer()
                        }
                    )
                    .overlay(
                        TutorialIndex(currentIndex: "2/3")
                    )
                    .overlay(
                        NavigationLink(destination: {
                            TutorialView3()
                        }, label: {
                            TutorialArrow()
                        })
                    )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct TutorialView3: View {
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            BattleView()
            
            ZStack {
                BlackBackground()

                BrownRectangle()
                    .overlay(
                        VStack(spacing: 16) {
                            Spacer()

                            TutorialViewTitle(titleCalled: "cooldown")

                            SkillCooldown()

                            Spacer()
                        }
                    )
                    .overlay(
                        TutorialIndex(currentIndex: "3/3")
                    )
                    .overlay(
                        NavigationLink(destination: {
                            BattleView()
                        }, label: {
                            TutorialArrow()
                        })
                    )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
