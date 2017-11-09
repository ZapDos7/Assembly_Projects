	    .data
    x:      .double 1.0
    y:      .float  2.5
    
	    .text
	    l.d     $f0, x          # $f0,$f1 ← x
	    l.d     $f1, x          # Error!  Must use even registers with double
	    l.s     $f1, y          # $f1 ← y
	    
	    add.s   $f0, $f1, $f7   # $f0 ← $f1 + $f7
	    add.d   $f0, $f2, $f6   # $f0,$f1 ← $f2,$f3 + $f6,$f7
	    
	    c.lt.d  $f0, $f4        # if $f0,$f1 < $f4,$f5 then
				    #   condition flag ← true
				    # else
				    #   condition flag ← false
	    bc1t    label           # Branch if condition flag is true
	    bc1f    label           # Branch if condition flag is false