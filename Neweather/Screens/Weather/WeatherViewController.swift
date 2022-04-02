// 
//  WeatherViewController.swift
//  Neweather
//
//  Created by Георгий Рыбак on 23.03.22.
//

import UIKit
import SnapKit

protocol WeatherViewControllerProtocol: AnyObject{
    func displayView(viewToDisplay: WeatherViewControllerViews)
}

enum WeatherViewControllerViews {
    case currentWeatherView, forecastWeatherView, searchView
}

final class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    var presenter: WeatherPresenterProtocol!

    //MARK: - Constants

    //MARK: - UI Property
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather"
        label.textAlignment = .center
        label.textColor = Colors.secondary
        label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        return label
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Colors.secondary
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return button
    }()

    private lazy var locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Colors.secondary
        button.setImage(UIImage(systemName: "location"), for: .normal)
        button.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        [searchButton, locationButton].forEach {view.addArrangedSubview($0)}
        view.spacing = 8
        view.axis = .horizontal
        return view
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let items = ["Current", "Forecast"]
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = 0
        view.selectedSegmentTintColor = Colors.secondary
        return view
    }()

    private let currentWeatherView = CurrentWeatherView(frame: .zero)

    private let forecastWeatherView = ForecastWeatherView(frame: .zero)

    private let forecastWeatherModalView = ForecastWeatherModalView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
    }

//MARK: - Setuping Views
    private func setupViews() {
        view.backgroundColor = Colors.main

        view.addSubviews(
            [
                mainLabel,
                buttonsStackView,
                segmentedControl,
                currentWeatherView,
                forecastWeatherView,
                forecastWeatherModalView
            ]
        )
        forecastWeatherView.isHidden = true
        forecastWeatherView.delegate = self
        forecastWeatherModalView.isHidden = true

        segmentedControl.addTarget(
            self,
            action: #selector(changeViewWithSegmentControl),
            for: .valueChanged
        )
    }

//MARK: - Layout
    private func setupLayout() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(130)
        }
        buttonsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(mainLabel)
            make.left.equalTo(mainLabel.snp.right)
            make.height.equalTo(32)
        }
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        currentWeatherView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        forecastWeatherView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        forecastWeatherModalView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

//MARK: - Protocol methods
    func displayView(viewToDisplay: WeatherViewControllerViews) {
        switch viewToDisplay {
        case .currentWeatherView:
            currentWeatherView.isHidden = false
            forecastWeatherView.isHidden = true
        case .forecastWeatherView:
            forecastWeatherView.isHidden = false
            currentWeatherView.isHidden = true
        case .searchView:
            print("searchView")
        }
    }

//MARK: - Private methods

    @objc private func changeViewWithSegmentControl() {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            presenter.fetchCurrentView(selectedPage: 1)
        default:
            presenter.fetchCurrentView(selectedPage: 0)
        }
    }
}

extension WeatherViewController: ForecastWeatherViewDelegate {
    func showForecastWeatherModalView(model: ForecastForHourModel) {
        forecastWeatherModalView.showView(model: model)
    }
}
