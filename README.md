# War Card Game in SwiftUI

[![War Card Game](https://i.gyazo.com/4176861cdfe20eaf16360b57157905d6.png)](https://youtu.be/ldEqJur2uLM)

## Overview
Welcome to the repository for the War Card Game, a simple yet engaging card game developed using SwiftUI. This project showcases the power of SwiftUI in creating interactive and visually appealing iOS applications.

## Gameplay
The game features a simple competition between a player and the computer (CPU). Each round, both draw a card randomly; the one with the higher card scores a point. The game continues until ten rounds are completed, after which the player with the most points is declared the winner.

## Features
- **Dynamic UI Updates:** The UI updates responsively based on game actions, using SwiftUI's state management features.
- **Simple Logic Implementation:** Game logic is straightforward, focusing on random card draws and score comparison.
- **End Game Determination:** The game automatically evaluates the winner after ten rounds and displays a corresponding message.

## Code Structure
`ContentView` is the core of this project, where the game logic and UI are managed. It uses `@State` properties for reactive UI updates and contains the game's functionality within a visually structured `ZStack` and `VStack`.

For a detailed look at the implementation, please refer to the `war_card_game.swift` file within this repository.


## License
This project is open-sourced under the MIT license.

---
