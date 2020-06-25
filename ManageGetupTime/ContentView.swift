import SwiftUI
import SSCustomTabbar

struct SSCustomTabViewSample: View {
    @State var isTabBarHidden:Bool = false
    
    var body: some View {
        tabView
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                SwiftUITabBarController.refreshViews()
        }
    }
    var tabView: some View {
        let vc1 = SwiftUITabView(
            content: UIHostingController(rootView: TabItem_Sample(backColor: Color.red,
                                                                  foreColor: Color.blue)),
            title: "Home",
            selectedImage: "iconHomeSelected",
            unSelectedImage: "iconHome")
        
        let vc2 = SwiftUITabView(
            content: UIHostingController(rootView: TabItem_Sample(backColor: Color.black,
                                                                  foreColor: Color.yellow)),
            title: "Favorite",
            selectedImage: "iconFavoriteSelected",
            unSelectedImage: "iconFavorite")
        
        let vc3 = SwiftUITabView(
            content: UIHostingController(rootView:
                TabItem_Sample(backColor: Color.white,
                               foreColor: Color.green)),
            title: "Profile",
            selectedImage: "iconProfileSelected",
            unSelectedImage: "iconProfile")
        
        let tabBarView = SwiftUITabBarController(tabItems: [vc1,vc2,vc3], configuration: .constant(SSTabConfiguration()), isTabBarHidden: self.$isTabBarHidden)
        
        return tabBarView
    }
    
}

struct TabItem_Sample: View {
    @State var backColor:Color
    @State var foreColor:Color
    
    var body: some View {
        ZStack{
            self.backColor.edgesIgnoringSafeArea(.all)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(self.foreColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
