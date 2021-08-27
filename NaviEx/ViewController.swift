//
//  ViewController.swift
//  NaviEx
//
//  Created by 김종권 on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigation()
    }

    private func setNavigation() {
        setNavigationBarTitle()
        setNavigationBar()
        setNavigationItem()
        setNavigationBarShadow()
        setNavigationTitleView()
    }

    private func setNavigationBarTitle() {
        title = "Jake iOS 앱 개발 알아가기"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
    }

    private func setNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemGray4
    }

    private func setNavigationItem() {
        navigationItem.backButtonTitle = "뒤로가기"
        /// navigationItem의 버튼 색상을 navigationBar.tintColor으로 접근하는 것을 주의
        navigationController?.navigationBar.tintColor = .brown
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(didTapNavigationItemRightButton(_:)))
    }

    private func setNavigationBarShadow() {
        navigationController?.navigationBar.shadowImage = UIColor.brown.asImage()

        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.darkGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        navigationController?.navigationBar.layer.shadowRadius = 2.0
    }

    private func setNavigationTitleView() {
        let titleStackView = UIStackView()
        titleStackView.spacing = 8.0
        titleStackView.distribution = .fillEqually
        titleStackView.backgroundColor = .systemBackground

        let button1 = UIButton()
        button1.setTitle("버튼1", for: .normal)
        button1.backgroundColor = .systemBlue
        button1.layer.cornerRadius = 14.0
        button1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)

        let button2 = UIButton()
        button2.setTitle("버튼2", for: .normal)
        button2.backgroundColor = .systemBlue
        button2.layer.cornerRadius = 14.0
        button1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)

        [button1, button2].forEach { titleStackView.addArrangedSubview($0) }
        navigationItem.titleView = titleStackView
    }

    @objc private func didTapNavigationItemRightButton(_ sender: Any) {
        if case .never = navigationItem.largeTitleDisplayMode {
            navigationItem.largeTitleDisplayMode = .always
        } else {
            navigationItem.largeTitleDisplayMode = .never
        }
    }
}

extension UIColor {
    func asImage(_ width: CGFloat = UIScreen.main.bounds.width, _ height: CGFloat = 1.0) -> UIImage {
        let size: CGSize = CGSize(width: width, height: height)
        let image: UIImage = UIGraphicsImageRenderer(size: size).image { context in
            setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }

        return image
    }
}
