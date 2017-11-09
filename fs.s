# Convert integer to double
	    mtc1    $t0, $f0        # $f0 ← $t0 (no format change!)
				    # $f0 now contains an integer!
	    cvt.d.w $f0, $f0        # $f0,$f1 ← (double)$f0
	    
	    # Another way to convert integer to double
	    lwc1    $f5, intvar     # Load integer into $f5 (no format change!)
	    cvt.d.w $f0, $f5        # $f0,$f1 ← (double)$f5
	    
	    # Another way to convert integer to double
	    # Note that load and store instructions are oblivious to
	    # the binary data format (they only need to know how many bits
	    # to transfer).  Hence, l.s (load single) does the same
	    # thing as lwc1 (load word to coprocessor 1).  The following
	    # will work, but is misleading.  Using lwc1 is better
	    # self-documentation.
	    l.s     $f5, intvar     # Load integer into $f5 (no format change!)
	    cvt.d.w $f0, $f5        # $f0,$f1 ← (double)$f5
	    
	    # Convert double to integer
	    cvt.w.d $f3, $f4        # $f3 ← (int)$f4,$f5
				    # $f3 now contains an integer!
	    mfc1    $t0, $f3        # $t0 ← $f3 (no format change!)

	    # Another way to convert double to integer
	    cvt.w.d $f3, $f4        # $f3 ← (int)$f4,$f5
				    # $f3 now contains an integer!
	    swc1    $f3, intvar     # Store integer from $f3 to mem
	    
	    # Convert single precision to double precision
	    cvt.d.s $f0, $f3        # $f0,$f1 ← (double)$f3