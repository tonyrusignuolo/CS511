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
	case 3: // STATE 1 - Q8.pml:25 - [turn = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 0;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - Q8.pml:27 - [i = 0] (0:9:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)this)->i);
		((P1 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)this)->i));
#endif
		;
		/* merge: i = 0(9, 3, 9) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)this)->i);
		((P1 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 10, 9) */
		reached[1][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: // STATE 4 - Q8.pml:27 - [((i<=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((int)((P1 *)this)->i)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 5 - Q8.pml:28 - [flags[i] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.flags[ Index(((int)((P1 *)this)->i), 3) ]);
		now.flags[ Index(((P1 *)this)->i, 3) ] = 0;
#ifdef VAR_RANGES
		logval("flags[:init::i]", ((int)now.flags[ Index(((int)((P1 *)this)->i), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - Q8.pml:27 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->i);
		((P1 *)this)->i = (((int)((P1 *)this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 12 - Q8.pml:31 - [i = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->i);
		((P1 *)this)->i = 0;
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 13 - Q8.pml:31 - [((i<=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!((((int)((P1 *)this)->i)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 14 - Q8.pml:32 - [(run P())] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 15 - Q8.pml:31 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->i);
		((P1 *)this)->i = (((int)((P1 *)this)->i)+1);
#ifdef VAR_RANGES
		logval(":init::i", ((int)((P1 *)this)->i));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 22 - Q8.pml:35 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC P */
	case 13: // STATE 1 - Q8.pml:8 - [flags[myId] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]);
		now.flags[ Index(((P0 *)this)->myId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("flags[P:myId]", ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - Q8.pml:10 - [(!((flags[left]||flags[right])))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!( !((((int)now.flags[ Index(((int)((P0 *)this)->left), 3) ])||((int)now.flags[ Index(((int)((P0 *)this)->right), 3) ])))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: left */  (trpt+1)->bup.oval = ((P0 *)this)->left;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->left = 0;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - Q8.pml:13 - [((turn==left))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)now.turn)==((int)((P0 *)this)->left))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - Q8.pml:14 - [flags[myId] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]);
		now.flags[ Index(((P0 *)this)->myId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("flags[P:myId]", ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 7 - Q8.pml:15 - [((turn==myId))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!((((int)now.turn)==((int)((P0 *)this)->myId))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 8 - Q8.pml:16 - [flags[myId] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]);
		now.flags[ Index(((P0 *)this)->myId, 3) ] = 1;
#ifdef VAR_RANGES
		logval("flags[P:myId]", ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 16 - Q8.pml:20 - [turn = right] (0:0:1 - 5)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = ((int)((P0 *)this)->right);
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 17 - Q8.pml:21 - [flags[myId] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]);
		now.flags[ Index(((P0 *)this)->myId, 3) ] = 0;
#ifdef VAR_RANGES
		logval("flags[P:myId]", ((int)now.flags[ Index(((int)((P0 *)this)->myId), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 18 - Q8.pml:22 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
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

