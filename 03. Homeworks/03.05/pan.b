	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		now.I = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 5: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 6: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 7: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 8: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 9: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[4] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 10: // STATE 17
		;
		now.I = trpt->bup.ovals[1];
		((P1 *)this)->Ini[5] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 11: // STATE 17
		;
		now.I = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 23
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 23
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;
;
		
	case 14: // STATE 24
		goto R999;

	case 15: // STATE 26
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 16: // STATE 27
		;
		((P1 *)this)->proc = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 28
		;
	/* 0 */	((P1 *)this)->proc = trpt->bup.oval;
		;
		;
		goto R999;

	case 18: // STATE 34
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC nnode */
;
		;
		
	case 20: // STATE 2
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 21: // STATE 3
		;
		XX = 1;
		unrecv(((P0 *)this)->inp, XX-1, 0, 2, 1);
		unrecv(((P0 *)this)->inp, XX-1, 1, ((int)((P0 *)this)->nr), 0);
		((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;

	case 22: // STATE 4
		;
	/* 1 */	((P0 *)this)->mynumber = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->nr = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 23: // STATE 5
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;
;
		;
		
	case 25: // STATE 9
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;

	case 26: // STATE 10
		;
	/* 0 */	((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;

	case 27: // STATE 14
		;
		XX = 1;
		unrecv(((P0 *)this)->inp, XX-1, 0, 1, 1);
		unrecv(((P0 *)this)->inp, XX-1, 1, ((int)((P0 *)this)->nr), 0);
		((P0 *)this)->nr = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 28: // STATE 15
		goto R999;

	case 29: // STATE 17
		;
		_m = unsend(((P0 *)this)->out);
		;
		goto R999;
;
		;
		
	case 31: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;
	}

