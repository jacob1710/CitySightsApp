//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 25/07/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var contentModel: ContentModel
    @State var isMapShowing = false
    var body: some View {
        if contentModel.restaurants.count != 0 || contentModel.sights.count != 0{
            
            NavigationView{
                
                if !isMapShowing{
                    //Show List
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location.circle.fill")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to map View"){
                                self.isMapShowing = true
                            }
                                .foregroundColor(.blue)
                        }
                        Divider()
                        BusinessList()
                        
                        
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                    
                }else{
                    //Show Map
                    BusinessMap()
                        .ignoresSafeArea()
                }
            }
           
            
           
            
        }else{
            ProgressView()
        }
        
    }
}


//https://filipmolcik.com/navigationview-dynamic-background-color-in-swiftui/

//struct NavigationBarModifier: ViewModifier {
//
//    var backgroundColor: UIColor?
//
//    init( backgroundColor: UIColor?) {
//        self.backgroundColor = backgroundColor
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithTransparentBackground()
//        coloredAppearance.backgroundColor = .clear
//        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//        UINavigationBar.appearance().tintColor = .white
//
//    }
//
//    func body(content: Content) -> some View {
//        ZStack{
//            content
//            VStack {
//                GeometryReader { geometry in
//                    Color(self.backgroundColor ?? .clear)
//                        .frame(height: geometry.safeAreaInsets.top)
//                        .edgesIgnoringSafeArea(.top)
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//extension View {
//
//    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
//        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
//    }
//
//}
