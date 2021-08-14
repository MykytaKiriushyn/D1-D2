import Foundation

class FirstGenericContainer<T: Identifiable> {
    var dictionary = Dictionary<Int, T>()
    let accessQueue = DispatchQueue(label: "concurrent queue", attributes: .concurrent)
    
    func readObject(id: Int) -> T? {
        var result: T?
        accessQueue.sync() {
            result = dictionary[id]
        }
        return result
    }
    
    func addObject(id: Int, element: T) {
        accessQueue.async(flags: .barrier) {
            self.dictionary[id] = element
        }
    }
}

// Second approach

class ReadWrite {
    var lock: UnsafeMutablePointer<pthread_rwlock_t>
    
    public init() {
            self.lock = UnsafeMutablePointer.allocate(capacity: 1)
            let status = pthread_rwlock_init(lock, nil)
            assert(status == 0)
        }
    deinit {
            let status = pthread_rwlock_destroy(lock)
            assert(status == 0)
            lock.deinitialize(count: 1)
            lock.deallocate()
        }
        
        public func withReadLock<T>(body: () throws -> T) rethrows -> T {
            pthread_rwlock_rdlock(lock)
            defer {
                pthread_rwlock_unlock(lock)
            }
            return try body()
        }
        
        public func withWriteLock<T>(body: () throws -> T) rethrows -> T {
            pthread_rwlock_wrlock(lock)
            defer {
                pthread_rwlock_unlock(lock)
            }
            return try body()
        }
    
}

class SecondGenericContainer<T: Identifiable> {
    var dictionary = Dictionary<Int, T>()
    var lock = ReadWrite()
    
    
    func readObject(id: Int) -> T? {
        var result: T?
        lock.withReadLock {
            result = dictionary[id]
        }
        return result
    }
    
    func addObject(id: Int, element: T) {
        lock.withWriteLock {
            self.dictionary[id] = element
        }
            
    }
}
