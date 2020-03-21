package internal

import (
	"sync"
)

type Work func()

type WorkQueue struct {
	lock *sync.Mutex
	Concurrency int

	work []Work
	wg *sync.WaitGroup

	running bool
	currentIndex int
}

func CreateWorkQueue(concurrency int) *WorkQueue {
	queue := &WorkQueue{
		lock:        new(sync.Mutex),
		Concurrency: concurrency,
		work:        make([]Work, 0),
		wg:          new(sync.WaitGroup),
	}

	return queue
}

func (queue *WorkQueue) AddWork(work Work) {
	queue.lock.Lock()
	defer queue.lock.Unlock()

	queue.work = append(queue.work, work)
}

func (queue *WorkQueue) getNext() Work {
	queue.lock.Lock()
	defer queue.lock.Unlock()

	if queue.currentIndex < len(queue.work) {
		defer func() {
			queue.currentIndex++
		}()

		return queue.work[queue.currentIndex]
	}

	return nil
}

func (queue *WorkQueue) hasNext() bool {
	queue.lock.Lock()
	defer queue.lock.Unlock()

	return queue.currentIndex < len(queue.work)
}

func (queue *WorkQueue) Start() {
	queue.lock.Lock()
	defer queue.lock.Unlock()

	if !queue.running && len(queue.work) > 0 {
		queue.running = true
		queue.currentIndex = 0
		for i := 0; i < queue.Concurrency; i++ {
			queue.wg.Add(1)
			go queue.runner()
		}
	}
}

func (queue *WorkQueue) Wait() {
	queue.wg.Wait()
	queue.running = false
}

func (queue *WorkQueue) Run() {
	queue.Start()
	queue.Wait()
}

func (queue *WorkQueue) runner() {
	defer queue.wg.Done()

	for queue.hasNext() {
		work := queue.getNext()
		if work != nil {
			work()
		}
	}
}