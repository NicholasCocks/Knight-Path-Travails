# Knight-Path-Travails
Welcome to the Knight-Path-Travails wiki!

The goal of Knight Path Travails is to create a Ruby class that will output the shortest path for a chess Knight from one square to another. This function will output an array of positions based on a valid moveset.

![chess_knight.gif](chess_knight.gif)

## Functionality And Experience
Built a movetree using poly-tree-nodes to build a path from start to finish and then traverse the tree. Tree traversal required implementing a breath-first search algorithm to ensure the eventual final arry output represents only the shortest path to a given position.

The moveset given to calculate the path can be swapped out for any other chess piece's allowing this project to easily be repurposed for other piece's perhaps to make an AI opponent to play against.
