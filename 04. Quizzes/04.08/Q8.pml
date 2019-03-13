byte turn;
bool flags[3];

proctype P() {
	byte myId = _pid-1;
	byte left = (myId + 2) % 3;
	byte right = (myId + 1) % 3;
	flags[myId] = true;
	do
		:: !(flags[left] || flags[right]) -> break
		:: else -> 
			if 
				:: (turn == left) -> 
					flags[myId] = false;
					turn == myId;
					flags[myId] = true;
				:: else -> break;
			fi
	od
	turn = right;
	flags[myId] = false;
}

init {
	turn = 0;
	byte i;
	for(i:0..2) {
		flags[i] = false;
	}
	atomic {
		for(i:0..2) {
			run P();
		}
	}
}