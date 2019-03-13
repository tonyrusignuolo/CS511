byte = n;
int finished = 0;

active proctype P() {
    byte, temp, i;
    for (i:1 .. 10) {
        temp = n;
        n = temp + 1;
    }
    finished++;
}

active proctype Q() {
    byte, temp, i;
    for (i:1 .. 10) {
        temp = n;
        n = temp + 1;
    }
    finished++;
}

init {
    (finished == 2);
    printf("%d\n", n);
    assert(n > 2);
}