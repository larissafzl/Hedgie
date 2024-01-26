/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct IntroView1: View {
    @State var currentIndex = 0
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }

    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                
                VStack(spacing: 32) {
                    Spacer()
                    
                    GetCharacterImage(currentIndex: $currentIndex, imageName: content[currentIndex].imageName)
                    
                    TextBoxIntroView1(currentIndex: $currentIndex)
                    
                    Spacer()
                }
            }
        }
    }
}
