import UIKit

class ViewController: UIViewController {
    let timerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let horizontalStackView: UIStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalStackView)
        
        let addCustomerButton = UIButton()
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        addCustomerButton.setTitleColor(.blue, for: .normal)
        
        let resetButton = UIButton()
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        
        horizontalStackView.addArrangedSubview(addCustomerButton)
        horizontalStackView.addArrangedSubview(resetButton)
        
        horizontalStackView.distribution = .fillEqually
        
        horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//        horizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        horizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        
        let timeInterval: Double = 0.001
        var standardTime = CFAbsoluteTimeGetCurrent()
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime(to time: CFAbsoluteTime) {
        let timeNow = CFAbsoluteTimeGetCurrent()
        timerLabel.text = String(time - timeNow)
        
    }
}

