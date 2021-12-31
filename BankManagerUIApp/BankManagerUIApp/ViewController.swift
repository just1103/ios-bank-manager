import UIKit

class ViewController: UIViewController {
    let timerLabel = UILabel()
    let bankStartButton = BankingProgramHandler()
    var initialTime: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVerticalStackView = UIStackView()
        mainVerticalStackView.spacing = 10
        mainVerticalStackView.axis = .vertical
        mainVerticalStackView.alignment = .center
        mainVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainVerticalStackView)
        
        let horizontalStackView: UIStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStackView.addArrangedSubview(horizontalStackView)
        
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

        let timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerLabel)
        
        mainVerticalStackView.addArrangedSubview(timerLabel)
        
        let waitingLabel = UILabel()
        waitingLabel.backgroundColor = .green
        waitingLabel.text = "대기중"
        waitingLabel.textColor = .white
        waitingLabel.textAlignment = .center
        waitingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        waitingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let handlingTaskLabel = UILabel()
        handlingTaskLabel.backgroundColor = .blue
        handlingTaskLabel.text = "업무중"
        handlingTaskLabel.textColor = .white
        handlingTaskLabel.textAlignment = .center
        handlingTaskLabel.font = .preferredFont(forTextStyle: .largeTitle)
        handlingTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalStackView2 = UIStackView()
        horizontalStackView2.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView2.axis = .horizontal
        horizontalStackView2.distribution = .fillEqually
        horizontalStackView2.addArrangedSubview(waitingLabel)
        horizontalStackView2.addArrangedSubview(handlingTaskLabel)
        mainVerticalStackView.addArrangedSubview(horizontalStackView2)
        horizontalStackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        horizontalStackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        let stackViewWithWatingCustomer = UIStackView()
        stackViewWithWatingCustomer.axis = .vertical
        stackViewWithWatingCustomer.alignment = .center
        stackViewWithWatingCustomer.backgroundColor = .white
        
        let stackViewWithExitCustomer = UIStackView()
        stackViewWithExitCustomer.axis = .vertical
        stackViewWithExitCustomer.alignment = .center
        stackViewWithExitCustomer.backgroundColor = .white
        
        let stackViewForAllCustomers = UIStackView()
        stackViewForAllCustomers.axis = .horizontal
        stackViewForAllCustomers.addArrangedSubview(stackViewWithWatingCustomer)
        stackViewForAllCustomers.addArrangedSubview(stackViewWithExitCustomer)
        stackViewForAllCustomers.distribution = .fillEqually
        mainVerticalStackView.addArrangedSubview(stackViewForAllCustomers)
        
        
    }
    
    @objc func updateTime() {
        initialTime += 0.001
        timerLabel.text = "업무시간 - \(initialTime.minuteSecondMS)"
    }
    
    func addAllCustomer() {
        
    }
}

extension Double {
    var hourMinuteSecondMS: String {
        String(format:"%d:%02d:%02d:%03d", hour, minute, second, millisecond)
    }
    var minuteSecondMS: String {
        String(format:"%d:%02d:%03d", minute, second, millisecond)
    }
    var hour: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    var minute: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

