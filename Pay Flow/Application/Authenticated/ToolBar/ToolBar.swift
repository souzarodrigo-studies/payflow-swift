//
//  CustomTabBar.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 15/07/21.
//

import SwiftUI


enum ToolBarItens: String, CaseIterable {
    case Home
    case List
    case Add
}

var tabs: [ToolBarItens] = [.Home, .Add, .List ]

struct ToolBar: View {
    
    @State var selectedTab: ToolBarItens = .Home
    @Namespace var animation
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    let initialColor = UIColor.red
    let finalColor = UIColor.red.withAlphaComponent(0.0)
    
    func Home() -> some View {
        let view = HomeFactory.make(with: HomeViewModel())
        return view
    }
    
    func List() -> some View {
        return Text("List")
    }
    
    var body: some View {
        GeometryReader { bounds in
            ZStack(alignment: .top) {
                GeometryReader { _ in
                    switch selectedTab {
                    case .Home:
                        Home()
                    case .List:
                        List()
                    case .Add:
                        Home()
                    }
                }
                .frame(height: bounds.size.height)
                
                ZStack(alignment: .bottom) {
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(tabs, id: \.self) { tab in
                            TabButton(toobarItem: tab, animation: animation, selectedTab: $selectedTab)
                        }
                    }
                    .frame(width: bounds.size.width, height: 80, alignment: .bottom)
                    .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .white.opacity(0.0)]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .bottom)
            }
        }
        .ignoresSafeArea(.all,  edges: .bottom)
    }
}

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ToolBar()
    }
}

struct TabButton: View {
    var toobarItem: ToolBarItens
    var animation: Namespace.ID
    
    @Binding var selectedTab: ToolBarItens
    
    var body: some View {
        Image(toobarItem.rawValue)
            .renderingMode(toobarItem == .Add ? .original : .template)
            .resizable()
            .foregroundColor(
                toobarItem != .Add &&
                    selectedTab == toobarItem ? Color(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)) : Color.black.opacity(0.2)
                
            )
            .frame(width: toobarItem == .Add ? 54 : 24, height: toobarItem == .Add ? 54 : 24)
            .padding(.horizontal, toobarItem == .Add ? 46 : 0)
            
            .onTapGesture {
                withAnimation{
                    selectedTab = toobarItem
                }
            }
    }
    
}

