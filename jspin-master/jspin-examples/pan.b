	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC Finish */
;
		;
		;
		;
		;
		;
		
	case 6: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC P */

	case 7: // STATE 1
		;
	/* 0 */	((P0 *)this)->i = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: // STATE 4
		;
		((P0 *)this)->temp = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 5
		;
		now.n = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 6
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 10
		;
		now.finished = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;
	}

