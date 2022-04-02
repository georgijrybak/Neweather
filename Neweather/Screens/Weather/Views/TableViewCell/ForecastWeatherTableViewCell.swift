//
//  ForecastWeatherTableViewCell.swift
//  Neweather
//
//  Created by Георгий Рыбак on 30.03.22.
//

import UIKit
import SnapKit

class ForecastWeatherTableViewCell: UITableViewCell {
    static let identifier = "ForecastWeatherTableViewCell"

    private var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        imageView.tintColor = Colors.secondary
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "23°"
        label.textAlignment = .right
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "06:00"
        label.textAlignment = .left
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textAlignment = .left
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear

        [
            backView,
            timeLabel,
            temperatureLabel,
            weatherImage,
            weatherDescriptionLabel
        ].forEach( { contentView.addSubview($0) } )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateWeather(temperature: String, time: String, image: UIImage, description: String) {
        temperatureLabel.text = temperature
        timeLabel.text = time
        weatherImage.image = image
        weatherDescriptionLabel.text = description
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        temperatureLabel.text = nil
        timeLabel.text = nil
        imageView?.image = nil
        weatherDescriptionLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layoutItemsInCell()
    }

    private func layoutItemsInCell() {
        let elementSize = contentView.frame.size.height - 10

        backView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(8)
        }
        weatherImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(elementSize)
            make.top.left.bottom.equalToSuperview().inset(8)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(elementSize)
            make.right.top.bottom.equalToSuperview().inset(8)
        }
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(weatherImage.snp.right).offset(16)
            make.top.equalTo(weatherImage)
            make.right.equalTo(temperatureLabel.snp.left)
            make.bottom.equalTo(self.snp.centerY)
        }
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.left.right.equalTo(timeLabel)
            make.top.equalTo(self.snp.centerY)
            make.bottom.equalTo(weatherImage)
        }

    }
}
