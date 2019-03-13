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

		 /* PROC Finish */
	case 3: // STATE 1 - count.pml:23 - [((finished==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.finished)==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - count.pml:24 - [printf('n = %d\\n',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("n = %d\n", ((int)now.n));
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - count.pml:25 - [assert((n>2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		spin_assert((((int)now.n)>2), "(n>2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - count.pml:27 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 7: // STATE 1 - count.pml:13 - [((i>10))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)((P0 *)this)->i)>10)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: i */  (trpt+1)->bup.oval = ((P0 *)this)->i;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->i = 0;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - count.pml:15 - [temp = n] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->temp);
		((P0 *)this)->temp = ((int)now.n);
#ifdef VAR_RANGES
		logval("P:temp", ((int)((P0 *)this)->temp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - count.pml:16 - [n = (temp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)now.n);
		now.n = (((int)((P0 *)this)->temp)+1);
#ifdef VAR_RANGES
		logval("n", ((int)now.n));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - count.pml:17 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->i);
		((P0 *)this)->i = (((int)((P0 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("P:i", ((int)((P0 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 10 - count.pml:19 - [finished = (finished+1)] (0:0:1 - 3)
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)now.finished);
		now.finished = (((int)now.finished)+1);
#ifdef VAR_RANGES
		logval("finished", ((int)now.finished));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 11 - count.pml:20 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
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

