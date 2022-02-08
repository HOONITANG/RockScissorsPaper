//
//  ViewController.swift
//  RockScissorsPaper
//
//  Created by Taehoon Kim on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    /// 가위바위보가 표현될 이미지
    /// 기본 값은 Empty로 설정
    private var handImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Empty"))
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        return iv
    }()
    
    /// 가위바위보 중 하나의 텍스트
    /// 기본 값은 "빈 값"으로 설정
    private var handLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.text = "빈 값"
        return label
    }()

    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView(arrangedSubviews: [handImageView, handLabel])
        stackView.axis = .vertical       // 세로 방향으로 뷰를 쌓음
        stackView.alignment = .center   // 가운데 정렬
        stackView.spacing = 16           // 뷰 간의 간격 설정
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // background tap
        let bgtap = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundViewTapped))
        self.view.addGestureRecognizer(bgtap)
    }
    
    // MARK: Selector
    
    /// 가위,바위,보를 가지고 있는  enum 이다
    /// Array가 가지고 있는 randomElement()를 사용하기 위해 CaseIterable 프로토콜을 상속받았다.
    /// Rock, Scissors, Paper은 이미지 이름에 사용된다.
    enum Hand: String, CaseIterable{
        case Rock
        case Scissors
        case Paper
        
        var description: String {
            switch self {
            case .Rock:
                return "바위"
            case .Scissors:
                return "가위"
            case .Paper:
                return "보"
            }
        }
    }

    /// Background 터치 시 동작하는 함수
    @objc func handleBackgroundViewTapped() {
        let randomHand = Hand.allCases.randomElement()!
        handImageView.image = UIImage(named: randomHand.rawValue)
        handLabel.text = randomHand.description
    }

}

