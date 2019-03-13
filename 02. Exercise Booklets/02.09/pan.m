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

		 /* PROC Man */
	case 3: // STATE 2 - eb9.pml:10 - [((mutex>0))] (10:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)now.mutex)>0)))
			continue;
		/* merge: mutex = (mutex-1)(0, 3, 10) */
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)-1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 7 - eb9.pml:10 - [((sem>0))] (15:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!((((int)now.sem)>0)))
			continue;
		/* merge: sem = (sem-1)(0, 8, 15) */
		reached[1][8] = 1;
		(trpt+1)->bup.oval = ((int)now.sem);
		now.sem = (((int)now.sem)-1);
#ifdef VAR_RANGES
		logval("sem", ((int)now.sem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 5: // STATE 12 - eb9.pml:10 - [((sem>0))] (16:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!((((int)now.sem)>0)))
			continue;
		/* merge: sem = (sem-1)(0, 13, 16) */
		reached[1][13] = 1;
		(trpt+1)->bup.oval = ((int)now.sem);
		now.sem = (((int)now.sem)-1);
#ifdef VAR_RANGES
		logval("sem", ((int)now.sem));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: // STATE 16 - eb9.pml:28 - [m = (m+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		(trpt+1)->bup.oval = ((int)now.m);
		now.m = (((int)now.m)+1);
#ifdef VAR_RANGES
		logval("m", ((int)now.m));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 17 - eb9.pml:16 - [mutex = (mutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][17] = 1;
		(trpt+1)->bup.oval = ((int)now.mutex);
		now.mutex = (((int)now.mutex)+1);
#ifdef VAR_RANGES
		logval("mutex", ((int)now.mutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 19 - eb9.pml:30 - [assert(((m*2)<=w))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		spin_assert(((((int)now.m)*2)<=((int)now.w)), "((m*2)<=w)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 20 - eb9.pml:31 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Woman */
	case 10: // STATE 1 - eb9.pml:20 - [w = (w+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.w);
		now.w = (((int)now.w)+1);
#ifdef VAR_RANGES
		logval("w", ((int)now.w));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 2 - eb9.pml:16 - [sem = (sem+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.sem);
		now.sem = (((int)now.sem)+1);
#ifdef VAR_RANGES
		logval("sem", ((int)now.sem));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 4 - eb9.pml:22 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
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

