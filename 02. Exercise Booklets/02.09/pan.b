	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Man */

	case 3: // STATE 3
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 8
		;
		now.sem = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 13
		;
		now.sem = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 16
		;
		now.m = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 17
		;
		now.mutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Woman */

	case 10: // STATE 1
		;
		now.w = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 2
		;
		now.sem = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;
	}

