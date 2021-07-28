//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 27/07/2021.
//

import SwiftUI

struct BusinessDetail: View {
    
   
    
    var business: Business
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                VStack(alignment: .leading, spacing: 0){
                    GeometryReader(){ geo in
                        let uiImage = UIImage(data: business.imageData ?? Data())
                        
                        //https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/
                        
                        if geo.frame(in: .global).minY <= 0 {
                            Image(uiImage: uiImage ?? UIImage())
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width, height: geo.size.height)
                                .offset(y: geo.frame(in: .global).minY/9)
                                .clipped()
                        }else{
                            Image(uiImage: uiImage ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geo.frame(in: .global).minY)
                        }
                        
                    }
                    
                    .frame(height: 250)
                    
                    
                    ZStack(alignment: .leading){
                        Rectangle()
                            .frame(height: 36)
                            .foregroundColor(business.isClosed! ? .gray:.blue)
                        Text(business.isClosed! ? "Closed":"Open")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.leading)
                        
                    }
                }
                
                Group{
                    //Name
                    Text(business.name!)
                        .font(.largeTitle)
                        .padding()
                    
                    
                    //address
                    if business.location?.displayAddress !=  nil{
                        ForEach(business.location!.displayAddress!, id: \.self) { addressLine in
                            Text(addressLine)
                                .padding(.horizontal)
                        }
                    }
                    
                    //rating
                    Image("regular_\(business.rating ?? 0)")
                        .padding()
                    
                    Divider()
                    
                    //phone
                    HStack{
                        Text("Phone")
                            .bold()
                        Text(business.displayPhone ?? "")
                        Spacer()
                        Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                    }
                    .padding()
                    
                    Divider()
                    
                    //Reviews
                    HStack{
                        Text("Reviews")
                            .bold()
                        Text(String(business.reviewCount ?? 0))
                        Spacer()
                        Link("Read", destination: URL(string: business.url ?? "")!)
                    }
                    .padding()
                    
                    Divider()
                    
                    //Web
                    HStack{
                        Text("Website")
                            .bold()
                        Text(business.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Link("Visit", destination: URL(string: business.url ?? "")!)
                    }
                    .padding()
                    
                    Divider()
                }
                
                //Directions btn
                Button(action: {
                    //TODO: Show directions
                    
                }, label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        Text("Get Directions")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
                .padding()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}
