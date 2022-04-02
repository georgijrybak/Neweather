//
//  CurrentWeatherView.swift
//  Neweather
//
//  Created by Георгий Рыбак on 29.03.22.
//

import UIKit
import SnapKit

class CurrentWeatherView: UIView {
    private var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "23°"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 200)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Minsk"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private lazy var currentWeatherImaveView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "sun.max")
        view.tintColor = Colors.secondary
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.register(
            WeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier
        )
        return view
    }()

    let array = [
        (UIImage(systemName: "thermometer"), "23°"),
        (UIImage(systemName: "drop"), "56%"),
        (UIImage(systemName: "wind"), "5 m/s"),
        (UIImage(systemName: "cloud"), "30%"),
        (UIImage(systemName: "cloud.rain"), "10%"),
        (UIImage(systemName: "humidity.fill"), "3mm"),
        (UIImage(systemName: "sunrise.fill"), "06:30"),
        (UIImage(systemName: "sunset.fill"), "19:00"),
        (UIImage(systemName: "aqi.medium"), "1032 hPa")
    ]

    let descriptions = [
         "23°",
        "56%",
        "5 m/s",
        "30%",
        "10%",
        "3mm",
        "06:30",
        "19:00",
        "1032 hPa"
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
        setupCollectionViewLayout()
    }

//MARK: - Setuping Views
    private func setupViews() {
        addSubviews(
            [
                currentTemperatureLabel,
                currentWeatherImaveView,
                currentLocationLabel,
                weatherDescriptionLabel,
                collectionView
            ]
        )

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }

//MARK: - Setuping Layout
    private func setupLayout() {
        currentTemperatureLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(8)
            make.right.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).inset(16)
            make.height.equalTo((frame.width - 32) / 2)
        }
        currentWeatherImaveView.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel)
            make.left.equalTo(currentTemperatureLabel.snp.right)
            make.right.equalTo(self.snp.right).inset(8)
            make.bottom.equalTo(currentTemperatureLabel)
        }
        currentLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel.snp.bottom)
            make.left.right.equalTo(currentTemperatureLabel).inset(16)
        }
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherImaveView.snp.bottom)
            make.left.right.equalTo(currentWeatherImaveView).inset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(16)
            make.left.right.equalTo(self).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }

    }

    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        if self.frame.height > 570 {
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(
                width: ((frame.width/3) - 16 ),
                height: (collectionView.frame.height / 3 - 8)
            )
        } else {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(
                width: ((frame.width/3) - 16 ),
                height: (collectionView.frame.height - 32)
            )
        }
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = layout
    }

//MARK: - Update view func
    func updateView(model: CurrentWeatherModel) {
        currentLocationLabel.text = model.location
        currentTemperatureLabel.text = model.temperature
        weatherDescriptionLabel.text = model.description
        currentWeatherImaveView.image = model.image

        
        collectionView.reloadData()
    }
}

//MARK: - Delegation methods
extension CurrentWeatherView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherCollectionViewCell.identifier,
            for: indexPath
        ) as! WeatherCollectionViewCell // убрать форс анрап

//        cell.updateCellWith(settings: array[indexPath.row])

        cell.updateCell(indexPathRow: indexPath.row, descriptions: descriptions)

        return cell
    }
}
