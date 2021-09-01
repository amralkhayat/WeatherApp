//
//  RealmManager.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//


import RealmSwift

//MARK:- Realm Methods Protocol responsible for implement  CRUD in production code and test case
protocol RealmMethodsProtocol {
  
    typealias CallResponse<T> = ((Result<T?, RealmError>) -> Void)
    
    func create<T:Object> (_ objects: T,responseHandler: @escaping CallResponse<String>)
    
    func readObjects<R:Object>  (_ object: R.Type  ) -> [R]?
    
    func delete <D:Object>( _ object:D,responseHandler: @escaping CallResponse<String>)

}
//MARK:- Realm Manager has all Methods Responable for CRUD

class RealmManager: RealmMethodsProtocol {
  

    private var realm:Realm!
    
  
    init(realm: Realm) {
        self.realm = realm
    }
    
    init() {
        realmConfigurations()
    }
    
    
  
    // Create Relam file, and saved it in  document directory
     func realmConfigurations(){
         do {
          
           let realm =  try Realm()
          
             self.realm =  realm
          
         } catch{
          
             print(error.localizedDescription)
          
             print("Unable to create an instance ")
         }
     }
    


     /*
      create Mehtod  write data to the relam
      @object: object that data we want Save
      @responseHandler: return message if data is saved or through error
      */
  
    func create<T:Object> (_ objects: T, responseHandler: @escaping CallResponse<String>){
        do {
          
            try realm?.write{
              
                realm?.add(objects, update: .modified)
              
                responseHandler(.success("Data successfully saved"))
            }
          
        }catch let error as NSError {
          
            responseHandler(.failure(RealmError(error: error)))
        }
    }
    
  
  
  /*
      readObjects Mehtod read  data objects  from relam
       @object: object that data has been saved
       @R: Return array of  saved objects
       */
  
    func readObjects<R>(_ object: R.Type) -> [R]? where R : Object {
      
        let result = realm.objects(object)
      
        return Array(result)
    }
    


    
  /*
         delete Mehtod delete  object data   from relam
          @object: object that data you want to delete
         @responseHandler: return message if data is saved or through error
          */
    
    func delete<D>(_ object: D, responseHandler: @escaping CallResponse<String>) where D : Object {
        
        do{
            try realm.write{
              
                realm.delete(object)
              
                responseHandler(.success("Data successfully Deleted"))
              
            }
          
        }catch let error as NSError{
          
            responseHandler(.failure(RealmError(error: error)))
        }
    }
    

    
}
