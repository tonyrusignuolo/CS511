class MovieTheatre {
    int final seatsTot;
    int available;
    condition c;

    MovieTheatre(int noOfSeats){
        seatsTot = noOfSeats;
        available = noOfSeats;
    }

    boolean reserve(int seats) {
        while (!showing && available < seats) {
            c.wait();
        }
        if (showing) {
            return false;
        }
        available = available - seats;
        if (available ==0) {
            full.signal();
        }
        return true
    }

    boolean cancel(int seats) {
        availabale = available + seats;
        c.signalAll();
    }

    void startProjection() {
        while (available != 0) {
            full.wait();
        }
        showing = true;
        c.signalAll();
    }

    void stopProjection() {
        available = seatsTot;
        showing = false;
        c.signalAll();
    }
}
