//
//  MainView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct MainView: View {
    @State var name = "Phi cunt"
    @State var input = ""
    @State var word = Word(title: "Tuan")
    var body: some View {
            NavigationView{
                ScrollView{
                    VStack{
                        ZStack{
                            Image("background")
                            VStack{
                                SearchBlock(name: $name, word: $input)
                            }
                        }.background(Color("Hard-purple")).cornerRadius(20).foregroundColor(Color("White"))
                        VStack(alignment: .leading){
                            Text("Word of the day").fontWeight(.bold).font(.custom("Inter", size: 25)).padding(.top, 40).padding(.horizontal, 40).padding(.bottom, 20)
                            TopWord(word: word)
                        }.frame(maxWidth: .infinity)
                        
                        VStack{
                            HStack{
                                Text("Search history").fontWeight(.bold).font(.custom("Inter", size: 25)).padding().padding(.horizontal, 20.0)
                                Spacer()
                                NavigationLink(destination: WordListHistory(), label: {
                                    Text("See more >>").foregroundColor(Color("Soft-purple"))
                                }).padding(.horizontal)
                            }
                            
                            SearchHistory()
                        }.padding(.vertical)
                        
                    }
                }.frame(maxHeight: .infinity).background(Color("Purple")).edgesIgnoringSafeArea(.all)
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
