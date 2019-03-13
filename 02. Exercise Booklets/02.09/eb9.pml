byte mutex = 1;
byte sem = 0;
byte m = 0;
byte w = 0;

inline acquire(sem) {
    skip;
    end1:
    atomic {
        sem > 0;
        sem--;
    }
}

inline release(sem) {
    sem++;
}

active [20] proctype Woman() {
    w++;
    release(sem);
}

active [20] proctype Man() {
    acquire(mutex);
    acquire(sem);
    acquire(sem);
    m++;
    release(mutex);
    assert (m*2 <= w)
}