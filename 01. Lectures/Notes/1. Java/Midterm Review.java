Semaphore toilets = new Semaphore(n)
Semaphore mutex = new Semaphore(1)
Semaphore men = new Semaphore(1)
Semaphore women = new Semaphore(1)
Semaphore restroom = new Semaphore(1)
int men = 0;
int women = 0;


Thread men {
    restroom.acquire;
    mutex.acquire;
    if (men == 0) {
        restroom.acquire;
    }
    men++;
    mutex.release
    toilets.acquire;
    toilets.release;
    mutext.acquire;
    men--;
    if (men == 0) {
        men.release;
        women.release;
    }
    mutex.release;
}

Thread women {
    toilets.acquire;
}





Semaphore canExit = new Semaphore(0)
Semaphore enterE = new Semaphore(0)
Semaphore enterW = new Semaphore(0)
int shore = 0;


Thread coastE {

}

Thread coastW {

}

Thread ferry {

}

Semaphore blast = new Semaphore(0)
Semaphore rinse = new Semaphore(0)
Semaphore wash = new Semaphore(0)
Semaphore  = new Semaphore(0)

Thread car {
    blast.acquire;
    rinse.acquire;
    dry.acquire;
}

Thread carWash {
    blast.release;
    rinse.release;
    wash.release;
}