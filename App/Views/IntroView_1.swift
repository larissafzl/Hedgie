/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct IntroView_1: View {
    var body: some View {
        ZStack {
            Background()
            
            VStack(spacing: 32) {
                CharacterImage(imageName: "happyHedge")
                TextBox()
            }
        }
    }
}
