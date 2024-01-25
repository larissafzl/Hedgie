/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct IntroView1: View {
    @State var currentIndex = 0
    
    var body: some View {
        ZStack {
            Background()
            
            VStack(spacing: 32) {
                CharacterImage(currentIndex: $currentIndex, imageName: content[currentIndex].imageName)
                
                TextBox(currentIndex: $currentIndex)
            }
        }
    }
}
