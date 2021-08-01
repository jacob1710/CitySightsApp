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
    @State var selectedBusiness:Business?
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
                            Button("Switch to Map View"){
                                self.isMapShowing = true
                            }
                                .foregroundColor(.blue)
                        }
                        Divider()
                        ZStack(alignment: .top){
                            BusinessList()
                            HStack{
                                Spacer()
                                YelpAttribution(link: "https://yelp.co.uk")
                            }
                            .padding(.trailing, -20)
                        }
                       
                        
                        
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                    
                }else{
                    //Show Map
                    ZStack(alignment: .top){
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                BusinessDetail(business: business)
                        }
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            HStack{
                                Image(systemName: "location.circle.fill")
                                Text("San Francisco")
                                Spacer()
                                Button("Switch to List View"){
                                    self.isMapShowing = false
                                }
                                    .foregroundColor(.blue)
                            }
                            .padding()
                        }
                        .padding()
                    }
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
