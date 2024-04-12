//
//  NetworkLayer.swift
//  CoffeeHouse
//
//  Created by Erma on 8/4/24.
//

import Foundation

struct NetworkLayer {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    
    func fetchProducts(completion: @escaping (Result<[Product],Error>) -> Void) {
        let request = URLRequest(url: Constants.productURL!)
        URLSession.shared.dataTask(with: request) { data, response , error in
            
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                do{
                    let model = try decoder.decode(Products.self, from: data)
                    completion(.success(model.meals))
                }catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
        
        
        
    func fetchCategorys(completion: @escaping (Result<[Categorys],Error>) -> Void) {
            let request = URLRequest(url: Constants.categoryURL!)
            URLSession.shared.dataTask(with: request) { data, response , error in
                
                if let error {
                    completion(.failure(error))
                }
                
                if let data {
                    do{
                        let model = try decoder.decode(CategoryProducts.self, from: data)
                        completion(.success(model.categories))
                    }catch{
                        completion(.failure(error))
                    }
                }
            }.resume()
            
        }
    }

