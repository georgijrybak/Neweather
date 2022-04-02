//
//  WeatherCollectionViewCell.swift
//  Neweather
//
//  Created by Георгий Рыбак on 28.03.22.
//

import UIKit
import SnapKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "thermometer")
        imageView.tintColor = Colors.secondary
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var label: UILabel = {
        let label = UILabel()
        label.text = "23C"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondaryMain
        view.layer.cornerRadius = 15
        return view
    }()

    let images = [
        UIImage(systemName: "thermometer"),
        UIImage(systemName: "drop"),
        UIImage(systemName: "wind"),
        UIImage(systemName: "cloud"),
        UIImage(systemName: "cloud.rain"),
        UIImage(systemName: "humidity.fill"),
        UIImage(systemName: "sunrise.fill"),
        UIImage(systemName: "sunset.fill"),
        UIImage(systemName: "aqi.medium")
    ]


    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .clear
        contentView.addSubview(backView)
        backView.addSubviews([imageView, label])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(contentView.frame.width / 1.8)
            make.top.equalToSuperview().inset(8)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview().inset(5)
        }
    }

    func updateCellWith(settings: (UIImage?, String)) {
        imageView.image = settings.0
        label.text = settings.1
    }

    func updateCell(indexPathRow: Int , descriptions: [String]) {
        imageView.image = images[indexPathRow]
        label.text = descriptions[indexPathRow]
    }
}
