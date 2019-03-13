#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - DKR-LEA-ASSERTS.pml:69 - [I = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = 1;
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - DKR-LEA-ASSERTS.pml:71 - [((I<=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)now.I)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - DKR-LEA-ASSERTS.pml:73 - [(((Ini[0]==0)&&(5>=1)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(((((int)((P1 *)this)->Ini[0])==0)&&(5>=1))))
			continue;
		/* merge: Ini[0] = I(20, 4, 20) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[0]);
		((P1 *)this)->Ini[0] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[0]", ((int)((P1 *)this)->Ini[0]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 6: // STATE 5 - DKR-LEA-ASSERTS.pml:74 - [(((Ini[1]==0)&&(5>=2)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(((((int)((P1 *)this)->Ini[1])==0)&&(5>=2))))
			continue;
		/* merge: Ini[1] = I(20, 6, 20) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[1]);
		((P1 *)this)->Ini[1] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[1]", ((int)((P1 *)this)->Ini[1]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 7: // STATE 7 - DKR-LEA-ASSERTS.pml:75 - [(((Ini[2]==0)&&(5>=3)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(((((int)((P1 *)this)->Ini[2])==0)&&(5>=3))))
			continue;
		/* merge: Ini[2] = I(20, 8, 20) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[2]);
		((P1 *)this)->Ini[2] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[2]", ((int)((P1 *)this)->Ini[2]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 8: // STATE 9 - DKR-LEA-ASSERTS.pml:76 - [(((Ini[3]==0)&&(5>=4)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!(((((int)((P1 *)this)->Ini[3])==0)&&(5>=4))))
			continue;
		/* merge: Ini[3] = I(20, 10, 20) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[3]);
		((P1 *)this)->Ini[3] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[3]", ((int)((P1 *)this)->Ini[3]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 9: // STATE 11 - DKR-LEA-ASSERTS.pml:77 - [(((Ini[4]==0)&&(5>=5)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!(((((int)((P1 *)this)->Ini[4])==0)&&(5>=5))))
			continue;
		/* merge: Ini[4] = I(20, 12, 20) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[4]);
		((P1 *)this)->Ini[4] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[4]", ((int)((P1 *)this)->Ini[4]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 10: // STATE 13 - DKR-LEA-ASSERTS.pml:78 - [(((Ini[5]==0)&&(5>=6)))] (20:0:2 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!(((((int)((P1 *)this)->Ini[5])==0)&&(5>=6))))
			continue;
		/* merge: Ini[5] = I(20, 14, 20) */
		reached[1][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->Ini[5]);
		((P1 *)this)->Ini[5] = ((int)now.I);
#ifdef VAR_RANGES
		logval(":init::Ini[5]", ((int)((P1 *)this)->Ini[5]));
#endif
		;
		/* merge: .(goto)(20, 16, 20) */
		reached[1][16] = 1;
		;
		/* merge: I = (I+1)(20, 17, 20) */
		reached[1][17] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 11: // STATE 17 - DKR-LEA-ASSERTS.pml:80 - [I = (I+1)] (0:20:1 - 7)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.I);
		now.I = (((int)now.I)+1);
#ifdef VAR_RANGES
		logval("I", ((int)now.I));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 18 - DKR-LEA-ASSERTS.pml:81 - [((I>5))] (29:0:1 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!((((int)now.I)>5)))
			continue;
		/* merge: goto :b1(29, 19, 29) */
		reached[1][19] = 1;
		;
		/* merge: proc = 1(29, 23, 29) */
		reached[1][23] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->proc);
		((P1 *)this)->proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)this)->proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 23 - DKR-LEA-ASSERTS.pml:86 - [proc = 1] (0:29:1 - 3)
		IfNotBlocked
		reached[1][23] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->proc);
		((P1 *)this)->proc = 1;
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)this)->proc));
#endif
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: // STATE 24 - DKR-LEA-ASSERTS.pml:88 - [((proc<=5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][24] = 1;
		if (!((((int)((P1 *)this)->proc)<=5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 25 - DKR-LEA-ASSERTS.pml:89 - [(run nnode(q[(proc-1)],q[(proc%5)],Ini[(proc-1)]))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!(addproc(II, 1, 0, now.q[ Index((((int)((P1 *)this)->proc)-1), 5) ], now.q[ Index((((int)((P1 *)this)->proc)%5), 5) ], ((int)((P1 *)this)->Ini[ Index((((int)((P1 *)this)->proc)-1), 6) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 26 - DKR-LEA-ASSERTS.pml:90 - [proc = (proc+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->proc);
		((P1 *)this)->proc = (((int)((P1 *)this)->proc)+1);
#ifdef VAR_RANGES
		logval(":init::proc", ((int)((P1 *)this)->proc));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 27 - DKR-LEA-ASSERTS.pml:91 - [((proc>5))] (31:0:1 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!((((int)((P1 *)this)->proc)>5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: proc */  (trpt+1)->bup.oval = ((P1 *)this)->proc;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->proc = 0;
		/* merge: goto :b2(0, 28, 31) */
		reached[1][28] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: // STATE 33 - DKR-LEA-ASSERTS.pml:95 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][33] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC nnode */
	case 19: // STATE 1 - DKR-LEA-ASSERTS.pml:15 - [printf(' MSC : %d\\n',mynumber)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf(" MSC : %d\n", ((int)((P0 *)this)->mynumber));
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 2 - DKR-LEA-ASSERTS.pml:16 - [out!one,mynumber] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->mynumber)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 3, ((int)((P0 *)this)->mynumber), 2);
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 3 - DKR-LEA-ASSERTS.pml:18 - [inp?one,nr] (0:0:1 - 1)
		reached[0][3] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->inp]&1)
		{	q_R_check(((P0 *)this)->inp, II);
		}
#endif
		if (q_len(((P0 *)this)->inp) == 0) continue;

		XX=1;
		if (3 != qrecv(((P0 *)this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->nr);
		;
		((P0 *)this)->nr = qrecv(((P0 *)this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->inp);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 4 - DKR-LEA-ASSERTS.pml:20 - [(Active)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(((int)((P0 *)this)->Active)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 5 - DKR-LEA-ASSERTS.pml:22 - [((nr!=maximum))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->nr)!=((int)((P0 *)this)->maximum))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 6 - DKR-LEA-ASSERTS.pml:23 - [out!two,nr] (47:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 2, ((int)((P0 *)this)->nr), 2);
		/* merge: neighbourR = nr(0, 7, 47) */
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->neighbourR);
		((P0 *)this)->neighbourR = ((int)((P0 *)this)->nr);
#ifdef VAR_RANGES
		logval("nnode:neighbourR", ((int)((P0 *)this)->neighbourR));
#endif
		;
		/* merge: .(goto)(0, 13, 47) */
		reached[0][13] = 1;
		;
		/* merge: .(goto)(0, 17, 47) */
		reached[0][17] = 1;
		;
		/* merge: .(goto)(0, 48, 47) */
		reached[0][48] = 1;
		;
		_m = 2; goto P999; /* 4 */
	case 25: // STATE 9 - DKR-LEA-ASSERTS.pml:26 - [know_winner = 1] (0:11:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->know_winner);
		((P0 *)this)->know_winner = 1;
#ifdef VAR_RANGES
		logval("nnode:know_winner", ((int)((P0 *)this)->know_winner));
#endif
		;
		/* merge: assert((nr==5))(11, 10, 11) */
		reached[0][10] = 1;
		spin_assert((((int)((P0 *)this)->nr)==5), "(nr==5)", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 11 - DKR-LEA-ASSERTS.pml:28 - [out!winner,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 1, ((int)((P0 *)this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 27: // STATE 15 - DKR-LEA-ASSERTS.pml:31 - [out!one,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 3, ((int)((P0 *)this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 18 - DKR-LEA-ASSERTS.pml:33 - [inp?two,nr] (0:0:1 - 1)
		reached[0][18] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->inp]&1)
		{	q_R_check(((P0 *)this)->inp, II);
		}
#endif
		if (q_len(((P0 *)this)->inp) == 0) continue;

		XX=1;
		if (2 != qrecv(((P0 *)this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->nr);
		;
		((P0 *)this)->nr = qrecv(((P0 *)this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->inp);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 29: // STATE 19 - DKR-LEA-ASSERTS.pml:35 - [(Active)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!(((int)((P0 *)this)->Active)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 20 - DKR-LEA-ASSERTS.pml:37 - [(((neighbourR>nr)&&(neighbourR>maximum)))] (22:0:3 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!(((((int)((P0 *)this)->neighbourR)>((int)((P0 *)this)->nr))&&(((int)((P0 *)this)->neighbourR)>((int)((P0 *)this)->maximum)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nr */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->nr;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->nr = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: maximum */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->maximum;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->maximum = 0;
		/* merge: maximum = neighbourR(0, 21, 22) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->maximum);
		((P0 *)this)->maximum = ((int)((P0 *)this)->neighbourR);
#ifdef VAR_RANGES
		logval("nnode:maximum", ((int)((P0 *)this)->maximum));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 31: // STATE 22 - DKR-LEA-ASSERTS.pml:39 - [out!one,neighbourR] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->neighbourR)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 3, ((int)((P0 *)this)->neighbourR), 2);
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 24 - DKR-LEA-ASSERTS.pml:41 - [Active = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->Active);
		((P0 *)this)->Active = 0;
#ifdef VAR_RANGES
		logval("nnode:Active", ((int)((P0 *)this)->Active));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 28 - DKR-LEA-ASSERTS.pml:44 - [out!two,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 2, ((int)((P0 *)this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 34: // STATE 31 - DKR-LEA-ASSERTS.pml:46 - [inp?winner,nr] (0:0:1 - 1)
		reached[0][31] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->inp]&1)
		{	q_R_check(((P0 *)this)->inp, II);
		}
#endif
		if (q_len(((P0 *)this)->inp) == 0) continue;

		XX=1;
		if (1 != qrecv(((P0 *)this)->inp, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->nr);
		;
		((P0 *)this)->nr = qrecv(((P0 *)this)->inp, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("nnode:nr", ((int)((P0 *)this)->nr));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->inp);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 35: // STATE 32 - DKR-LEA-ASSERTS.pml:48 - [((nr!=mynumber))] (44:0:0 - 1)
		IfNotBlocked
		reached[0][32] = 1;
		if (!((((int)((P0 *)this)->nr)!=((int)((P0 *)this)->mynumber))))
			continue;
		/* merge: printf(' MSC : LOST \\n')(44, 33, 44) */
		reached[0][33] = 1;
		Printf(" MSC : LOST \n");
		/* merge: assert((nr>mynumber))(44, 34, 44) */
		reached[0][34] = 1;
		spin_assert((((int)((P0 *)this)->nr)>((int)((P0 *)this)->mynumber)), "(nr>mynumber)", II, tt, t);
		/* merge: .(goto)(0, 40, 44) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 36: // STATE 36 - DKR-LEA-ASSERTS.pml:52 - [printf(' MSC : LEADER \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		Printf(" MSC : LEADER \n");
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 37 - DKR-LEA-ASSERTS.pml:53 - [nr_leaders = (nr_leaders+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.nr_leaders);
		now.nr_leaders = (((int)now.nr_leaders)+1);
#ifdef VAR_RANGES
		logval("nr_leaders", ((int)now.nr_leaders));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 38 - DKR-LEA-ASSERTS.pml:54 - [assert((nr_leaders<=1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		spin_assert((((int)now.nr_leaders)<=1), "(nr_leaders<=1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 41 - DKR-LEA-ASSERTS.pml:57 - [(know_winner)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!(((int)((P0 *)this)->know_winner)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: know_winner */  (trpt+1)->bup.oval = ((P0 *)this)->know_winner;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->know_winner = 0;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 43 - DKR-LEA-ASSERTS.pml:58 - [out!winner,nr] (0:0:0 - 1)
		IfNotBlocked
		reached[0][43] = 1;
		
#if !defined(XUSAFE) && !defined(NOREDUCE)
		if (q_claim[((P0 *)this)->out]&2)
		{	q_S_check(((P0 *)this)->out, II);
		}
#endif
		if (q_full(((P0 *)this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)this)->nr)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->out, 0, 1, ((int)((P0 *)this)->nr), 2);
		_m = 2; goto P999; /* 0 */
	case 41: // STATE 50 - DKR-LEA-ASSERTS.pml:62 - [-end-] (0:0:0 - 5)
		IfNotBlocked
		reached[0][50] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

