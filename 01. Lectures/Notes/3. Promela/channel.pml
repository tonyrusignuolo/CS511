mtype { ack, nak };
chan ch = [0] of {byte};

active proctype Server() {
    byte v;
    do
    :: ch ?? new, v ->
        printf("Server got %d\n", v);
    od
}

active proctype Client() {
    ch ! ack(1);
    ch ! new(2);
    printf("Client sent message. \n")
}