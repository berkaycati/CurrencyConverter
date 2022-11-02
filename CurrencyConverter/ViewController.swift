//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Berkay on 21.09.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var zarLabel: UILabel!
    @IBOutlet weak var vefLabel: UILabel!
    
    var semaphore = DispatchSemaphore (value: 1)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateClicked(_ sender: Any) {
        func turkishTryResponse() {
            let url = "https://api.apilayer.com/fixer/convert?to=try&from=eur&amount=1"
            var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            request.addValue("bxtZ1BkFFeJlaOBoI5G3yLwWNcGSkzCu", forHTTPHeaderField: "apikey")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    DispatchQueue.main.async {
                        if let tryResult = jsonResponse["result"] as? Double {
                            self.tryLabel.text = "TRY: \(tryResult)"
                        }
                    }
                } catch {
                    print("error")
                }
            self.semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
        
        func usdResponse() {
            let url = "https://api.apilayer.com/fixer/convert?to=usd&from=eur&amount=1"
            var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            request.addValue("bxtZ1BkFFeJlaOBoI5G3yLwWNcGSkzCu", forHTTPHeaderField: "apikey")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    DispatchQueue.main.async {
                        if let usdResult = jsonResponse["result"] as? Double {
                            self.usdLabel.text = "USD: \(usdResult)"
                        }
                    }
                } catch {
                    print("error")
                }
            self.semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
        
        func zarResponse() {
            let url = "https://api.apilayer.com/fixer/convert?to=zar&from=eur&amount=1"
            var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            request.addValue("bxtZ1BkFFeJlaOBoI5G3yLwWNcGSkzCu", forHTTPHeaderField: "apikey")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    DispatchQueue.main.async {
                        if let zarResult = jsonResponse["result"] as? Double {
                            self.zarLabel.text = "ZAR: \(zarResult)"
                        }
                    }
                } catch {
                    print("error")
                }
            self.semaphore.signal()
            }
            task.resume()
            semaphore.wait()
        }
        
        func cadResponse() {
            let url = "https://api.apilayer.com/fixer/convert?to=cad&from=eur&amount=1"
            var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            request.addValue("bxtZ1BkFFeJlaOBoI5G3yLwWNcGSkzCu", forHTTPHeaderField: "apikey")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
              print(String(data: data, encoding: .utf8)!)
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    DispatchQueue.main.async {
                        if let cadResult = jsonResponse["result"] as? Double {
                            self.vefLabel.text = "CAD: \(cadResult)"
                        }
                    }
                } catch {
                    print("error")
                }
            self.semaphore.signal()
            }
            task.resume()
            semaphore.wait()
            
            
        }
        turkishTryResponse()
        usdResponse()
        zarResponse()
        cadResponse()
    }
}
    


