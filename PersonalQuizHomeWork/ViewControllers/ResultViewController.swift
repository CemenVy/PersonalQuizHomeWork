//
//  ResultViewController.swift
//  PersonalQuizHomeWork
//
//  Created by Семен Выдрин on 11.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var resultAnswerLabel: UILabel?
    @IBOutlet var resultTitleLAbel: UILabel?
    
    // MARK: - Public Properties
    var allAnswers:[Answer] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateResult()
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    // MARK: - Private Methods
    private func findMostFrequentAnswer(in answers: [Answer]) -> Answer? {
        var finalAnswer: [Answer: Int] = [:]
        
        for answer in answers {
            if let count = finalAnswer[answer] {
                finalAnswer[answer] = count + 1
            } else {
                finalAnswer[answer] = 1
            }
        }
        
        var mostFrequentAnswer: Answer? = nil
        var highestCount = 0
        
        for (answer, count) in finalAnswer {
            if count > highestCount {
                mostFrequentAnswer = answer
                highestCount = count
            }
        }
        return mostFrequentAnswer
    }
    
    private func UpdateResult() {
        if let mostFrequentAnswer = findMostFrequentAnswer(in: allAnswers) {
            resultTitleLAbel?.text = mostFrequentAnswer.animal.definition
            resultAnswerLabel?.text = "Вы - \(String(mostFrequentAnswer.animal.rawValue))"
        } else {
            resultTitleLAbel?.text = ""
            resultAnswerLabel?.text = ""
        }
    }
}


