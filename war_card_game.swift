import SwiftUI

// Main view structure for the card game app.
struct ContentView: View {
    // State variables to store the player's and CPU's current card images.
    @State var Playercard = "card8"
    @State var CPUcard = "card7"
    // State variables to store the scores of the player and the CPU.
    @State var playerscore = 0
    @State var cpuscore = 0
    // State variable to count the number of rounds played.
    @State var roundsPlayed = 0
    // State variable to store the end game message.
    @State var gameResult = ""

    // The main view body.
    var body: some View {
        ZStack {
            // Background image setup.
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image("logo")
                Spacer()

                HStack {
                    Spacer()
                    Image(Playercard)  // Display the player's current card.
                    Spacer()
                    Image(CPUcard)    // Display the CPU's current card.
                    Spacer()
                }
                Spacer()

                if gameResult.isEmpty {  // Conditional UI rendering based on game result.
                    Button(action: {
                        deal()  // Button action to deal cards.
                    }) {
                        Image("button")
                    }
                    .foregroundColor(.white)
                } else {
                    Text(gameResult)  // Display "You Won!", "You Lost!", or "It's a Draw!"
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")  // Label for the player's score.
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(playerscore))  // Display the player's score.
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")  // Label for the CPU's score.
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuscore))  // Display the CPU's score.
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    // Function to deal cards and update scores.
    func deal() {
        if roundsPlayed < 10 {  // Only proceed if fewer than 10 rounds have been played.
            // Randomize the player's card.
            var playerCardValue = Int.random(in: 2...14)
            Playercard = "card" + String(playerCardValue)
            // Randomize the CPU's card.
            var cpuCardValue = Int.random(in: 2...14)
            CPUcard = "card" + String(cpuCardValue)

            // Update scores based on card values.
            if playerCardValue > cpuCardValue {
                playerscore += 1  // Increase player score by 1 if player's card is higher.
            } else if cpuCardValue > playerCardValue {
                cpuscore += 1  // Increase CPU score by 1 if CPU's card is higher.
            }
            
            roundsPlayed += 1  // Increment the round counter.
        }
        
        // Check if 10 rounds have been played to determine the winner.
        if roundsPlayed == 10 {
            if playerscore > cpuscore {
                gameResult = "You Won!"  // Set result message if player wins.
            } else if playerscore < cpuscore {
                gameResult = "You Lost!"  // Set result message if CPU wins.
            } else {
                gameResult = "It's a Draw!"  // Set result message for a draw.
            }
        }
    }
}

// Preview provider for Xcode previews.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
