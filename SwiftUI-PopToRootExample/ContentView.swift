
import SwiftUI

struct ContentView: View {
   @State private var isActive : Bool = false
   var body: some View {
       NavigationView {
           Text("Welcome")
               .toolbar {
                   NavigationLink(destination: ContentView2(), isActive: self.$isActive )
                   {Label("", systemImage: "plus")                    }
               }
       }
       .navigationViewStyle(StackNavigationViewStyle())
       .environment(\.rootPresentationMode, self.$isActive)
   }
}

struct ContentView2: View {
   @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
   var body: some View {
       VStack {
           Text("First View")
           NavigationLink(destination: ContentView3())
           {Text("Go to Next View")}
       }
       .navigationBarTitle("First View")
   }
}
struct ContentView3: View {
   @Environment(\.rootPresentationMode) private var rootPresentationMode: Binding<RootPresentationMode>
   var body: some View {
       VStack {
           Text("Last View")
           Button (action: { self.rootPresentationMode.wrappedValue.dismiss() } )
           { Text("Pop to root") }
       }
       .navigationBarTitle("Last View")
   }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
