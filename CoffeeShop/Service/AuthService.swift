import Foundation
import FirebaseAuth

protocol AuthServiceProtocol{
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signOut(completion: @escaping (Result<Void, Error>) -> Void)
}

class AuthService : AuthServiceProtocol{
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let user = result?.user{
                completion(.success(user))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let user = result?.user{
                completion(.success(user))
            }
        }
    }
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do{
            try Auth.auth().signOut()
            completion(.success(()))
        }
        catch{
            completion(.failure(error))
        }
    }
    
}
