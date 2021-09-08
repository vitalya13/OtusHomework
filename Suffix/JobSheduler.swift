////  JobScheduler.swift
//  OtusLockHomeWork
//
//  Created by Vitaliy Dudin RIT Perm on 08.09.2021.
//
//

import Foundation

struct JobQueue {
    typealias Job = (job: () -> TimeInterval, completion: (TimeInterval) -> Void)
    
    private var jobs: [Job] = .init()
    
    mutating func add(job: @escaping () -> TimeInterval, completion: @escaping (TimeInterval) -> Void) {
        self.jobs.insert((job, completion), at: 0)
    }
    
    var count: Int {
        get {
            return self.jobs.count
        }
    }
}

extension JobQueue: IteratorProtocol, Sequence {
    mutating func next() -> Job? {
        return self.jobs.popLast()
    }
}

class JobScheduler {
    private let queue: JobQueue
    private let dispatchQueue: DispatchQueue
    private let completion: () -> Void
    private let semaphore: DispatchSemaphore
    
    init(queue: JobQueue, count: Int, qos: DispatchQoS, completion: @escaping () -> Void) {
        self.queue = queue
        self.dispatchQueue = DispatchQueue(label: "home.jobScheduler", qos: qos, attributes: .concurrent)
        self.completion = completion
        self.semaphore = DispatchSemaphore(value: count)
    }
    
    func run() {
        let dispatchGroup = DispatchGroup()
        
        for item in self.queue {
            self.semaphore.wait()
            self.dispatchQueue.async(group: dispatchGroup) {
                let time = item.job()
                self.semaphore.signal()
                
                DispatchQueue.main.async {
                    item.completion(time)
                }
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.completion()
        }
    }
}

