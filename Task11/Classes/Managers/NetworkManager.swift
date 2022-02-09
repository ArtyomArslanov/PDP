//
//  NetworkManager.swift
//  Task11
//
//  Created by Tom on 28.10.2021.
//

import Foundation

enum NetworkError: Error{
    case badURLError
    case badResponceError
    case badDataError
    
    case imageError
    
}

protocol NetworkManagerProtocol {
    init()
    func getTableJSONModel(path: String, limit: Int, offset: Int, completion: @escaping  (Result<Data, Error>) -> Void)
    func getCertainJSONModelWithID(withPath path: String, id: String, completion: @escaping (Result<Data, Error>)-> Void)
    func donwloadImage(withUrl url: URL, completion: @escaping (Result<Data, Error>) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    
    var session: URLSession!
    var images: NSCache<NSURL, NSData> = NSCache()
    
    
    required init(){
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    func getTableJSONModel(path: String, limit: Int, offset: Int, completion: @escaping  (Result<Data, Error>) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            var comp = self.getComponents()
            comp.path = path
            guard let url = comp.url else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.badURLError))
                }
                return
                
            }
            let request = self.tableRequest(url: url, limit: limit, offset: offset)
            self.session.dataTask(with: request) { (data, responce, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                guard let responce = responce as? HTTPURLResponse, (200...299).contains(responce.statusCode) else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.badResponceError))
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.badDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }.resume()
        }
    }
    
    
    
    func getCertainJSONModelWithID(withPath path: String, id: String, completion: @escaping (Result<Data, Error>)-> Void){
        DispatchQueue.global(qos: .userInitiated).async {
            var comp = self.getComponents()
            comp.path = path + "/" + id
            guard let url = comp.url else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.badURLError))
                }
                return
                
            }
            let request = URLRequest(url: url)
            self.session.dataTask(with: request) { (data, responce, error) in
                if let error = error{
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                guard let responce = responce as? HTTPURLResponse, (200...299).contains(responce.statusCode) else{
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.badResponceError))
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.badDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
                
            }.resume()
        }
        
    }
    
    
    func donwloadImage(withUrl url: URL, completion: @escaping (Result<Data, Error>) -> ()){
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let imageData = self.images.object(forKey: url as NSURL) as? Data{
                DispatchQueue.main.async {
                    completion(.success(imageData))
                }
                return
            }
            
            let request = URLRequest(url: url)
            self.session.downloadTask(with: request) { (localURL, responce, error) in
               
                if let error = error{
                    print(error.localizedDescription)
                    
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.imageError))
                    }
                    return
                }
                guard let responce = responce as? HTTPURLResponse, (200...299).contains(responce.statusCode) else {
                    print(error?.localizedDescription)
                    
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.imageError))
                    }
                    return
                }
                
                guard let localURL = localURL else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.imageError))
                    }
                    return
                }
                
                do{
                    let data = try Data(contentsOf: localURL)
                    self.images.setObject(data as NSData, forKey: url as NSURL )
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }
                }catch{
                    
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.imageError))
                    }
                    return
                }
            }.resume()
        }
    }
    
    
    private func getComponents() -> URLComponents{
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.spacexdata.com"
        return comp
    }
    
    private func tableRequest(url: URL, limit: Int, offset: Int) -> URLRequest{
        var request = URLRequest(url: url)
        let requestBodyData = tableRequsetParametrs(limit: limit, offset: offset).data(using: .utf8)
        request.httpMethod = "POST"
        request.httpBody = requestBodyData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func tableRequsetParametrs(limit: Int, offset: Int) -> String{
        let parametrs = "{\n  \"query\": {},\n  \"options\": {\"limit\":\(limit), \"offset\":\(offset) }\n}"
        return parametrs
    }
    
    
}
