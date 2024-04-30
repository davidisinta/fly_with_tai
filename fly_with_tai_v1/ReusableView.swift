//
//  ReusableView.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/29/24.
//


import UIKit

class ReusableView: UIView {
    
    
    
    
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Yes, guys"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    
    
    
    
    
    private func setupViews() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    
    
    
    
    
}

