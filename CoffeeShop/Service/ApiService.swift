import Foundation

class ApiService{
 
    class func fetchData(urlString: String, completion: @escaping ([CoffeeModel]?, String?) -> Void){
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if data != nil{
                let dataModel = try? JSONDecoder().decode([CoffeeModel].self, from: data!)
                completion(dataModel, nil)
            }
            else{
                completion(nil, "Error!")
            }
        }
        task.resume()
    }
    
}
