//
//  ViewController.swift
//  QuizzlerNoStoryboard
//
//  Created by Eugene Kotovich on 11.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    var buttons: [UIButton] = [UIButton(type: .system), UIButton(type: .system), UIButton(type: .system)]
    
    var questionLabel: UILabel = {
        $0.text = "Question text"
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .white
        return $0
    }(UILabel())
    
    var scoreLabel: UILabel = {
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    let bubbleView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Background-Bubbles"))
        return image
    }()
    
    //MARK: - Create & Setup Buttons
    
    func createButtons() {
        buttons.forEach {
            $0.setTitle("True", for: .normal)
            $0.layer.cornerRadius = 16
            $0.layer.borderWidth = 4
            $0.layer.borderColor = UIColor.white.cgColor
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            $0.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
            $0.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
        }
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        sender.backgroundColor = quizBrain.checkAnswer(userAnswer) ? .green : .red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          sender.backgroundColor = .clear
          self.quizBrain.nextQuestion()
          self.updateUI()
        }
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.currentQuestion
        progress.progress = quizBrain.progress
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        buttons[0].setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[0], for: .normal)
        buttons[1].setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[1], for: .normal)
        buttons[2].setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[2], for: .normal)
    }
    
    //MARK: - Create & Setup Progress Bar
    
    let progress: UIProgressView = {
        $0.progressViewStyle = .bar
        $0.progress = 0.5
        $0.trackTintColor = .white
        $0.tintColor = UIColor(named: "TintColor")
        $0.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
        return $0
    }(UIProgressView())
    
    //MARK: - Initialize UI
    
    func initialize() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        createButtons()
        view.addSubview(bubbleView)
        bubbleView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        view.addSubview(questionLabel)
        view.addSubview(progress)
        
        let buttonsStack = UIStackView(arrangedSubviews: buttons)
        buttonsStack.axis = .vertical
        buttonsStack.alignment = .fill
        buttonsStack.spacing = 10
        buttonsStack.distribution = .fillEqually
        
        scoreLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        let stack = UIStackView(arrangedSubviews: [scoreLabel, questionLabel, buttonsStack, progress])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(-20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        updateUI()
    }
    
}

