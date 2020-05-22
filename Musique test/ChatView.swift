//
//  ChatView.swift
//  Musique test
//
//  Created by thomas groux on 07/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            //            TabView{
            //                Home()
            //                .navigationBarTitle("", displayMode: .inline)
            //                .navigationBarHidden(true)
            //                .tabItem {
            //                    Image(systemName: "message.fill").font(.title)
            //                }
            //
            //                Text("Person").tabItem{
            //                    Image(systemName: "person.fill").font(.title)
            //                }
            //            }//.edgesIgnoringSafeArea(.top)
            //                .accentColor(Color.gray)
        }
        
        
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Home : View {
    
    @EnvironmentObject var data : msgDatas
    var body : some View {
        
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.top)
            
            NavigationLink(destination: ConvView(), isActive: $data.show){
                Text("")
            }
            VStack{
                topView()
            }
            
        }
    }
}

struct topView : View {
    
    var body : some View {
        
        VStack{
            
            HStack(spacing: 15){
                
                Text("Chats").fontWeight(.heavy).font(.system(size: 23)).foregroundColor(Color.white)
                
                Spacer()
                
                Button(action: {
                    
                }){
                    Image(systemName: "magnifyingglass").resizable().frame(width: 20, height: 20).foregroundColor(Color.white)
                    
                }
                Button(action: {
                    
                }){
                    Image(systemName: "list.dash").resizable().frame(width: 20, height: 20).foregroundColor(Color.white)
                }
            }.padding()
            GeometryReader{_ in
                MainView().clipShape(Rounded())
                
            }
        }
        
        
    }
    
}

struct MainView : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body: some View{
        List(msgs){i in
            cellView(pic: i.pic, name: i.name, msg: i.msg, time: i.time, msgs: i.msgs).onTapGesture {
                self.data.selectedData = i
                self.data.show.toggle()
            }
        }
    }
}

struct Rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        
        return Path(path.cgPath)
    }
}

struct cellView : View {
    var pic : String
    var name: String
    var msg: String
    var time: String
    var msgs : String
    
    var body : some View{
        HStack(spacing: 10){
            Image(pic).resizable().frame(width: 50, height: 50).clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                
                
                Text(msg).lineLimit(1)
            }
            
            Spacer()
            
            VStack(spacing: 15){
                Text(time)
                if msgs != ""{
                    Text(msgs).padding(6).background(Color.blue).foregroundColor(Color.white).clipShape(Circle())
                }
                else {
                    Spacer()
                }
            }
        }.padding(12)
    }
}



struct ConvView : View {
    var body: some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0){
                convTopView()
                GeometryReader{_ in
                    convList()
                }
                
                convBottomView().padding(.top, 10).background(Color.white)
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct convTopView : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body: some View{
        
        HStack(spacing: 15){
            
            Button(action: {
                
                self.data.show.toggle()
                
            }) {
                Image(systemName: "control").font(.title).rotationEffect(.init(degrees: -90))
            }
            Spacer()
            
            VStack(spacing: 5){
                Image(data.selectedData.pic).resizable().frame(width: 45, height: 45).clipShape(Circle())
                
                Text(data.selectedData.name).fontWeight(.heavy)
            }.offset(x: 25)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "phone.fill").resizable().frame(width: 20, height: 20)
            }.padding(.trailing, 25
            )
            Button(action: {
                
            }) {
                Image(systemName: "video.fill").resizable().frame(width: 23, height: 18)
            }
        }.foregroundColor(.white)
            .padding()
    }
}

struct convBottomView : View {
    
    @State var txt = ""
    
    var body: some View{
        
        HStack{
            HStack(spacing : 8){
                
                Button(action: {
                    
                }) {
                     Image("emoji").resizable().frame(width: 20, height: 20)
                }.foregroundColor(.gray)
                
                TextField("Type something", text: $txt)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "camera.fill").font(.body)
                }.foregroundColor(.gray)
                Button(action: {
                    
                }) {
                    Image(systemName: "paperclip").font(.body)
                }.foregroundColor(.gray)
                
            }.padding()
                .background(Color("Color"))
            .clipShape(Capsule())
            
            Button(action: {
                
            }) {
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 15, height: 23)
                    .padding()
                    .foregroundColor(.white).background(Color("bg"))
                .clipShape(Circle())
                
            }.foregroundColor(.gray)
            
        }.padding(.horizontal, 15)
            .background(Color.white)
        
        
    }
    
}

struct convList : View {
    var body: some View{
        

        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                
                ForEach(Eachmsg){i in
                    
                    convCell(data: i)
                }
            }.padding(.horizontal, 15)
                .padding(.bottom, 999)
                .background(Color.white)
                .clipShape(Rounded())
        }
        
    }
}

struct convCell : View {
    
    var data : msgdataType
    
    var body: some View{
        
        
        HStack{
            if data.myMsg {
                
                Spacer()
                
                Text(data.msg)
                    .padding().background(Color("bg")).clipShape(msgTail(mymsg: data.myMsg))
                    .foregroundColor(.white)
            }
            else {
                Text(data.msg)
                    .padding().background(Color("txtbox")).clipShape(msgTail(mymsg: data.myMsg))
                
                Spacer()
            }
        }.padding(data.myMsg ? .leading : .trailing, 55).padding(.vertical)
    }
}

struct msgTail : Shape {
    
    var mymsg : Bool
    
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}

struct msgdataType : Identifiable {
    var id : Int
    var msg : String
    var myMsg : Bool
}

var Eachmsg = [
    
    msgdataType(id: 0, msg: "ceci ets un mess", myMsg: false),
    msgdataType(id: 1, msg: "Ceci est une réponse", myMsg: true)
]


class msgDatas : ObservableObject{
    @Published var show : Bool = false
    @Published var selectedData : msgType = .init(id: -1, msg: "", time: "", name: "", msgs: "", pic: "")
}




struct msgType : Identifiable {
    var id: Int
    var msg: String
    var time: String
    var name: String
    var msgs: String
    var pic: String
}



var msgs : [msgType] = [
    msgType(id: 0, msg: "Premier msg", time: "12:12", name: "Bob", msgs: "2", pic: "p1"),
    msgType(id: 1, msg: "coucou tu veux voir...", time: "11:11", name: "jean mich", msgs: "2", pic: "p2")
]

