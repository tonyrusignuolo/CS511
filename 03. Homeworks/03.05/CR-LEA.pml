# define N	5	/* number of processes in the ring */
# define L	10	/* size of buffer (>= 2*N) */
byte I; 		/* will be used in init for assigning ids to nodes */

mtype = {one, winner};	/* symb. Msg. Names */
chan q[N] = [L] of {mtype, byte}; /* asynchronous channels */

proctype nnode (chan inp, out; byte mynumber) {
	byte nr;

	xr inp;	/* channelassertion: exclusive recv access to channel in */
	xs out;	/* channel assertion: exclusive send access to channel out */

	printf ("\nMSC : %d", mynumber );
	out! one, mynumber;
	// printf("\n16 MSC %d sent one, %d to MSC %d", inp, mynumber, out);
	end:	do
	:: inp? one, nr ->
		if
		:: nr == mynumber ->
			// byte x = inp;
			// printm(x);
			out! winner, inp;
			// printf("\n24 MSC %d sent winner, %d to MSC %d", inp, x, out);
			printf("\nMSC %d: LEADER", inp);
			break;
		:: nr > mynumber->
			out! one, nr;
			// printf("\n29 MSC %d sent one, %d to MSC %d", inp, nr, out);
		:: nr < mynumber ->
			skip;
		fi
	:: inp? winner, nr ->
		if
		:: nr != inp ->
			printf("\nI am node %d and I know the leader is node %d", inp, nr)
			out! winner, nr;
			// printf("\n16 MSC %d sent one, %d to MSC %d", inp, mynumber, out);

		:: else ->
			printf("\nI am node %d and I am the leader", mynumber);
			skip;
		fi;
		break;
	od
}


init{
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

		/* start all nodes in the ring */
		proc = 1;
		do
		:: proc <= N ->
			printf("%d, %d, %d, %d", proc, q[proc-1], q[proc%N], Ini[proc-1])
			run nnode(q[proc-1], q[proc%N], Ini[proc-1]);
			proc++
		:: proc > N ->
			break
		od
	}
}