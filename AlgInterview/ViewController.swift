//
//  ViewController.swift
//  AlgInterview
//
//  Created by Ash Censo on 15.11.2023.
//

//📌 Task
//Visualize your favorite sorting algorithm, custom UI, swiftUI and animations are welcome in any combination.
//
//
//📖 Details
//The app should have a UI that allows the user to input an array of integers and a button that starts visualization which reflects sorting of the user input. Also the app should have two buttons: step back and forward which visualize transition to the next and previous step in the algorithm.
//
//
//💡 Tech requirements
//App should be an iOS application that runs on a modern device (iPhone 13 /14) and latest OS
//(iOS 16). Compatibility with older devices/OS is not required.
//
//You are free to choose Objective-C or Swift, any patterns and approaches. Implementation is
//not limited at any level, i.e. to build the UI you can choose anything from OpenGL to SwiftUI.
//Code should compile on Xcode 14/MacOS 13 without errors. We expect you will provide a
//link to GitHub repo, more than one commit length history is a plus.
//
//You can't use any 3rd party dependencies. You have three hours.
//
//
//✏️️ What is considered important
//Overall architecture of  the project, potential scalability, ease of changes and adding new features. Code style, errors and border conditions handling. If you didn't manage to finish what you planned – please specify what still needs to be done.
//
//We hope you like programming as much as we do and will enjoy the task.
//
//Have fun :)


import UIKit

final class ViewController: UIViewController {

    // MARK: Views
    
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var backButton: UIButton?
    @IBOutlet weak var forwardButton: UIButton?
    @IBOutlet weak var resultLabel: UILabel?
    
    // MARK: - Private
    
    private var elementsString = "" {
        didSet {
            resultLabel?.text = elementsString
            
            elementsArray = elementsString
                .components(separatedBy: .whitespaces)
                .compactMap { Int($0) }
        }
    }
    
    private var elementsArray: [Int] = [] {
        didSet {
            sortAlg = BubleSortAlgorithm(areInIncreasingOrder: true, initialData: elementsArray)
        }
    }

    private var sortAlg: (any AnySortAlgorithm)?
}

// MARK: - Actions
extension ViewController {
    @IBAction func back() {
        resultLabel?.text = sortAlg?.previousStep().map { "\($0)" }.joined(separator: " ") ?? ""
    }
    
    @IBAction func forward() {
        resultLabel?.text = sortAlg?.nextStep().map { "\($0)" }.joined(separator: " ") ?? ""
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        elementsString = textField.text ?? ""
        
        return true
    }
}

