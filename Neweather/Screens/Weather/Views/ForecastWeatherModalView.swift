//
//  ForecastWeatherModalView.swift
//  Neweather
//
//  Created by Георгий Рыбак on 30.03.22.
//

import UIKit
import SnapKit

class ForecastWeatherModalView: UIView {
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.main
        view.layer.cornerRadius = 20
        return view
    }()

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

    private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Понедельник, 09:00"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    private var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 50)
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
        view.backgroundColor = .clear
        return view
    }()

    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

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


    private func setupViews() {
        addSubviews([blurView, backView])

        blurView.frame = bounds

        backView.addSubviews(
            [
                currentWeatherImaveView,
                currentTemperatureLabel,
                weatherDescriptionLabel,
                timeLabel,
                collectionView
            ]
        )

        let tap = UITapGestureRecognizer(target: self, action: #selector(hideView))
        self.addGestureRecognizer(tap)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupLayout() {
        backView.snp.makeConstraints { make in
            make.height.equalTo(self.frame.width )
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
        backView.layoutIfNeeded()
        currentWeatherImaveView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(8)
            make.right.equalTo(backView.snp.centerX)
            make.height.equalTo((backView.frame.width - 16) / 2)
        }
        currentTemperatureLabel.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.centerX)
            make.top.right.equalToSuperview().inset(8)
            make.height.equalTo((backView.frame.width - 16) / 3)
        }
        weatherDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel.snp.bottom)
            make.left.equalTo(currentWeatherImaveView.snp.right)
            make.bottom.equalTo(currentWeatherImaveView)
            make.right.equalToSuperview().inset(8)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherImaveView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(self.frame.width / 10)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.left.bottom.right.equalToSuperview().inset(8)
        }
    }

//MARK: - Logic of presenting
    func showView(model: ForecastForHourModel) {
        isHidden = false

        let transform = CGAffineTransform(scaleX: 0, y: 0)
        backView.transform = transform
        blurView.layer.opacity = 0

        UIView.animate(withDuration: 0.2, delay: 0) {
            self.blurView.layer.opacity = 1
            self.backView.transform = CGAffineTransform.identity
        }
        weatherDescriptionLabel.text = model.description
    }

    @objc private func hideView() {
        self.backView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.blurView.layer.opacity = 0
            let transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.backView.transform = transform
        } completion: { _ in
            self.isHidden = true
        }
    }

    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: ((frame.width/3) - 16 ),
            height: (collectionView.frame.height - 16)
        )

        layout.minimumInteritemSpacing = 8
        collectionView.collectionViewLayout = layout
    }
}

//MARK: - Delegation methods
extension ForecastWeatherModalView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //тут создать массив картинок и испольщовать его в качестве количества секций
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherCollectionViewCell.identifier,
            for: indexPath
        ) as! WeatherCollectionViewCell // убрать форс анрап

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

        cell.updateCell(indexPathRow: indexPath.row, descriptions: descriptions)

        return cell
    }
}
