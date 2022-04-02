//
//  ForecastWeatherView.swift
//  Neweather
//
//  Created by Георгий Рыбак on 30.03.22.
//

import UIKit
import SnapKit

protocol ForecastWeatherViewDelegate {
    func showForecastWeatherModalView(model: ForecastForHourModel)
}

class ForecastWeatherView: UIView {
    var delegate: ForecastWeatherViewDelegate?

    let tableView: UITableView = {
        let view = UITableView()
        view.register(
            ForecastWeatherTableViewCell.self,
            forCellReuseIdentifier: ForecastWeatherTableViewCell.identifier
        )
        return view
    }()

    var forecast = [
        [
            ForecastForHourModel(
                day: "Понедельник",
                time: "00:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Понедельник",
                time: "03:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Понедельник",
                time: "06:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Понедельник",
                time: "09:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            )
        ],
        [
            ForecastForHourModel(
                day: "Вторник",
                time: "00:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Вторник",
                time: "03:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Вторник",
                time: "06:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            ),
            ForecastForHourModel(
                day: "Вторник",
                time: "09:00",
                temperature: "19°",
                description: "Sunny",
                image: UIImage(systemName: "sun.max")!,
                feelsLike: "21°",
                pressure: "1023hPa",
                humidity: "34%",
                clouds: "10%",
                windSpeed: "3m/s",
                pop: "10%"
            )
        ]
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
    }


    private func setupViews() {
        addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Colors.main
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
    }

}

extension ForecastWeatherView: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Nubmer of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return forecast.count
    }

    // MARK: - Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast[section].count
    }

    // MARK: - Height for rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.size.width / 4
    }

    // MARK: - Header's
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let timeLabel: UILabel = {
            let label = UILabel()
            label.text = forecast[section][0].day
            label.textAlignment = .left
            label.textColor = Colors.secondary
            label.font = UIFont(name: "MarkerFelt-Wide", size: 30)
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.2
            label.backgroundColor = Colors.main
            return label
        }()

        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        view.addSubview(timeLabel)
        timeLabel.frame = view.bounds

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    // MARK: - Creating Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ForecastWeatherTableViewCell.identifier,
            for: indexPath
        ) as! ForecastWeatherTableViewCell

        cell.updateWeather(
            temperature: forecast[indexPath.section][indexPath.row].temperature,
            time: forecast[indexPath.section][indexPath.row].time,
            image: forecast[indexPath.section][indexPath.row].image,
            description: forecast[indexPath.section][indexPath.row].description
        )
        cell.selectionStyle = .none
        return cell
    }

    // MARK: - Deselecting row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("строка \(indexPath.row)")
        delegate?.showForecastWeatherModalView(model: forecast[indexPath.section][indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
