//
//  ViewController.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/02/28.
//

import UIKit
//import AVFoundation
import RxCocoa
import RxSwift
import PKHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var sourceLanguageLabel: UILabel!
    @IBOutlet weak var targetLanguageLabel: UILabel!
    @IBOutlet weak var translationButton: UIButton!
    
    let inputTextView: LeftView = LeftView(title: "原文", borderWidth: 3, borderColor: 0.4, isEditable: true)
    let translatedView: RightView = RightView()
    let retranslatedView: LeftView = LeftView(title: "再翻訳後", borderWidth: 1, borderColor: 0.9, isEditable: false)
    let keyboardBar: KeyboardBar = KeyboardBar()

    
    private let disposeBag = DisposeBag()
    private let viewModel = TranslateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
        
        setupBindings()
    }
    
    private func setupBindings(){
        inputTextView.textView.rx.text.asDriver().drive { [weak self] text in
            self?.viewModel.inputTextViewInput.onNext(text ?? "")
        } .disposed(by: disposeBag)

        
        
        translationButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                guard let text = self.inputTextView.textView.text else { return }
                let source = "ja"
                let target = "en"
             
                self.connectTranslateApi(text: text, source: source, target: target)
            })
            .disposed(by: disposeBag)
        
        viewModel.validTranslateDriver.drive { (valid) in
            self.translationButton.isEnabled = valid
            self.translationButton.buttonBehavior(valid: valid)
        } .disposed(by: disposeBag)
    }
    
    private func connectTranslateApi(text: String, source: String, target: String){
        let url = "https://script.google.com/macros/s/AKfycbzzO5D4e2UsWUeMNf-muj4OBUhRH9q1nfApxIiI6ipsJYYQRiOdaKQ3fV3oADNdz7JxBw/exec?text=\(text)&source=\(source)&target=\(target)"
        guard let encodeUrlString: String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let urlComponents = URLComponents(string: encodeUrlString) else { return }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!){ data,response, error  in
            guard let jsonData = data else { return }
            
            do {
                let translatedSentence: TranslatedSentence = try JSONDecoder().decode(TranslatedSentence.self, from: jsonData)
                // メインスレッドで画面の更新をさせるためにDispatchQueneを噛ませる
                DispatchQueue.main.sync {
                    self.translatedView.textView.text = translatedSentence.translatedText
                    self.retranslatedView.textView.text = translatedSentence.retranslatedText
                }
            } catch { return }
        }
        task.resume()
    }
    
    
    
    private func setupLayouts(){
        let stackView = UIStackView(arrangedSubviews: [inputTextView, translatedView, retranslatedView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: translationButton.bottomAnchor, constant: 30),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach{ $0.isActive = true}
        
        inputTextView.textView.inputAccessoryView = keyboardBar
        
        translationButton.layer.cornerRadius = 22
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
  
}

