//
// RockPaperScissors.swift
//
// Created by Ina Tolo
// Created on 2022-3-22
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The RockPaperScissors program implements an application that
// asks the user to choose rock, paper, or scissors, then
// generates a random selection and tells the user if they
// have won, lost, or tied.

// declaring constants
let rock: Int = 1
let paper: Int = 2
let scissors: Int = 3
let win: String = "You win!"
let lose: String = "You lose."

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("This cannot be accepted as a valid number.")
}

func gameResults(choice: Int, randomNumber: Int) -> String {
  // declaring variables
  var result: String

  // deterimes tie or winner of the game
  if choice == randomNumber {
    result = "Tie Game!"
  } else if choice == rock && randomNumber == paper {
    result = lose
  } else if choice == paper && randomNumber == rock {
    result = win
  } else if choice == rock && randomNumber == scissors {
    result = win
  } else if choice == scissors && randomNumber == rock {
    result = lose
  } else if choice == paper && randomNumber == scissors {
    result = lose
  } else {
    result = win
  }
  return result
}

// declaring variables
var choiceString: String
var resultUser: String
var choiceUserInt: Int
var randomNumberComp: Int
var gameCounter: Int = 0
var tries: Int = 0

print("Today you will be playing a game of rock, paper, scissors!")
print("Your options are 1: rock, 2: paper, or 3: scissors.")
print()

while gameCounter != 1 {
  // gets choice input from the user
  print("Enter one of the above choices: ", terminator: "")
  choiceString = readLine()!

  // generates random number corresponding to computer choice
  randomNumberComp = Int.random(in: rock..<scissors + rock)

  do {
    choiceUserInt = Int(choiceString) ?? 0

    if choiceUserInt != Int(choiceString) {
      try catchString()
    }

    if choiceUserInt >= rock && choiceUserInt <= scissors {
      // calls function to determine tie game or a winner
      resultUser = gameResults(choice: choiceUserInt, randomNumber: randomNumberComp)

      print("The computer chose: \(randomNumberComp)")
      print("\(resultUser)")
      print()

      tries += 1

      // checks if user has won in order to break loop
      if resultUser == win {
        print("It took you \(tries) tries to win!")
        gameCounter += 1
      }
    } else {
      print("This is not a valid choice!")
      print()
    }
  } catch MyError.runtimeError(let errorMessage) {
    print(errorMessage)
    print()
  }
}
