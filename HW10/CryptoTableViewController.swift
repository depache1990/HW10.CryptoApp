//
//  CryptoTableViewController.swift
//  HW10
//
//  Created by Anton Duplin on 25/9/21.
//

import UIKit

class CryptoTableViewController: UITableViewController {
    //MARK: Private properties
    private var datas: [Data] = []
    private var spinnerView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: URLS.CryptoJson.rawValue)
        spinnerView = showSpinner(in: tableView)
        
        title = "Курс КриптоВалюты"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RatesTableViewCell
        let cryptoRates = datas[indexPath.row]
        
        cell.symbolLabel.text = cryptoRates.symbol ?? ""
        cell.priceLabel.text = "$ \(cryptoRates.price_usd ?? "" )"
        cell.changeLable.text = "\(cryptoRates.percent_change_24h ?? "") % "
       
        let percentChange24h = cryptoRates.percent_change_24h ?? ""
        let percentDouble = (Double(percentChange24h) ?? 0.0)
        if percentDouble > 0.0 {
            cell.changeLable.textColor = .green
            cell.differenceImage.image = #imageLiteral(resourceName: "sort-app")
            
        } else if percentDouble < 0.0 {
            
            cell.changeLable.textColor = .red
            cell.differenceImage.image = #imageLiteral(resourceName: "sort-down")
        }
            
        
        
        return cell
    }
    
   // = "+" + String(describing: Double(round(100*(valutes[indexPath.row].Value! - valutes[indexPath.row].Previous!))/100))
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        fetchData(from: URLS.CryptoJson.rawValue)
        spinnerView?.startAnimating()
        
    }
    
    // MARK: - Private methods
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) {  crypto  in
            DispatchQueue.main.async {
                self.spinnerView?.stopAnimating()
                self.datas = crypto.data
                self.tableView.reloadData()
                
            }
            
        }
    }
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
    
}

