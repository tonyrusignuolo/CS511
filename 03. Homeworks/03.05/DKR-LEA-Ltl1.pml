# define N	5	/* number of processes in the ring */
# define L	10	/* size of buffer (>= 2*N) */
byte I; 		/* will be used in init for assigning ids to nodes */

mtype = {one, two, winner};	/* symb. Msg. Names */
chan q[N] = [L] of {mtype, byte}; /* asynchronous channels */
byte nr_leaders = 0;

ltl p1 {<> (nr_leaders == 1)};

proctype nnode (chan inp, out; byte mynumber) {
	bit Active = 1, know_winner = 0;
	byte nr, maximum = mynumber, neighbourR;

	xr inp;	/* channelassertion: exclusive recv access to channel in */
	xs out;	/* channel assertion: exclusive send access to channel out */

	out! one, mynumber;
	printf (" MSC : %d\n", mynumber );

	// printf("\n17 MSC %d sent one, %d to MSC %d", inp, mynumber, out);
	end:	do
	:: inp? one, nr ->
		if
			:: Active ->
				if
				:: nr != maximum ->
					out! two, nr;
					// printf("\n25 MSC %d sent two, %d to MSC %d", inp, nr, out);
					neighbourR = nr
				:: else->
					know_winner = 1;
					out! winner, nr;
					// printf("\n30 MSC %d sent winner, %d to MSC %d", inp, nr, out)
				fi
			:: else->
				out! one, nr;
				// printf("\n34 MSC %d sent one, %d to MSC %d", inp, nr, out)
		fi

	:: inp? two, nr ->
		if
		:: Active ->
			if
			:: neighbourR > nr && neighbourR > maximum ->
				maximum = neighbourR;
				out! one, neighbourR;
				// printf("\n44 MSC %d sent one, %d to MSC %d", inp, neighbourR, out)
			:: else->
				Active = 0;
				// printf("\n47 MSC %d inactive", inp)			
			fi
		:: else->
			out! two, nr;
			// printf("\n51 MSC %d sent two, %d to MSC %d", inp, nr, out);				
		fi

	:: inp? winner, nr ->
		if
		:: nr != mynumber ->
			printf("\nMSC : LOST", inp);
			// printf("\n57 MSC %d LOST", inp);
		:: else->
			printf("\nMSC : LEADER", inp);
			// printf("\n59 MSC %d LEADER", inp);
			atomic {
				nr_leaders++;
			}
		fi;
		if
		:: know_winner
		:: else-> 
			out! winner, nr;
			// printf("\n65 MSC %d sent winner, %d to MSC %d", inp, nr, out)
		fi;
		break
	od
}


init{
	byte x = 3%6
	bool y = 2!=5;
	// printm(x);
	// printf("\n");

	byte proc;
	byte Ini[6]; /* N <= 6 randomize the process numbers */
	atomic{
		I = 1;/* pick a number to be assigned 1..N */
		do
		:: I <= N ->
			if /* non-deterministic choice*/
			:: Ini[0] == 0 && N >= 1 -> Ini[0] = I
			:: Ini[1] == 0 && N >= 2 -> Ini[1] = I
			:: Ini[2] == 0 && N >= 3 -> Ini[2] = I
			:: Ini[3] == 0 && N >= 4 -> Ini[3] = I
			:: Ini[4] == 0 && N >= 5 -> Ini[4] = I
			:: Ini[5] == 0 && N >= 6 -> Ini[5] = I /* works for up to N = 6 */
			fi;
			I++
		:: I > N -> /* assigned all numbers 1..N */
			break
		od;

		// printf("\n%d, %d, %d, %d, %d, %d", Ini[0], Ini[1], Ini[2], Ini[3], Ini[4], Ini[5]);


		/* start all nodes in the ring */
		proc = 1;
		do
		:: proc <= N ->
			atomic{
				// printf("%d, %d, %d, %d", proc, q[proc-1], q[proc%N], Ini[proc-1])
				run nnode(q[proc-1], q[proc%N], Ini[proc-1]);
			}
			proc++
		:: proc > N ->
			break
		od
	}

}