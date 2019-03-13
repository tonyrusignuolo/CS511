public class WR {
    void startReading() {
        while (writers != 0)
        }
    }
}

public class TWS {
    int state = 0;
    condition first;

    void one() {
        while (state != 0) {
            one.wait();
        }
        state = 1;
        two.signal();
    }

    void two() {
        while(state != 1) {
            two.wait();
        }
        state = 2;
        three.signal();
    }

    void three() {
        while (state != 2) {
            three.wait();
        }
        state = 0;
        one.signal();
    }
}

public class barrier {
    static int final N;
    int in = 0;
    int out = N;

    void permissionToPass() {
        while (out < N) {
            enter.wait();
        }        
        in++;
        while (in < N) {
            barrier.wait();
        }
        if (out = N) {
            out = 1;
            barrier.signalAll();
        }
        else {
            out++;
        }
        if (out = N) {
            in = 0;
            enter.signalAll();
        }
        barrier.signalAll();
        in = N;
    }
}