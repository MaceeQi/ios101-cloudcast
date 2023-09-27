//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Macee Qi on 9/26/23.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // Fired when the view has finished loading for the first time
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
