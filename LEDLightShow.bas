let dirsc = %11111111	'assigns b pins as outputs
let dirsb = %11111111	'assigns c pins as outputs

'column names'
symbol tl = b.7 'top left'
symbol tm = b.6 'top middle'
symbol tr = b.5 'top right'
symbol ml = b.4 'middle left'
symbol mm = b.3 'middle middle'
symbol mr = b.2 'middle right'
symbol bl = b.1 'bottom left'
symbol bm = b.0 'bottom middle'
symbol br = c.7 'bottom right'

'layer names'
symbol top = c.6 'top layer'
symbol mid = c.5 'middle layer'
symbol bot = c.4 'bottom layer'

symbol loops = b0
symbol loops1 = b1

main:
	'startup pattern
	high bot 'bottom layer on
    let outpinsb = %00000010 'only bottom left column on
    pause 120
    let outpinsb = %00010000 'only middle left column on
    pause 120
    let outpinsb = %10000000 'only top left column on
    pause 120
    let outpinsb = %01000000 'only top middle column on
    pause 120
    let outpinsb = %00001000 'only middle middle column on
    pause 120
    let outpinsb = %00000001 'only bottom middle column on
    pause 120
    high br 'bottom right columm on
    pause 120
    low br 'bottom right column off
    let outpinsb = %00000100 'only middle middle column on
    pause 120
    let outpinsb = %00100000 'only top middle column on
    pause 120
	
    'go to middle layer
    low bot
    low top
    high mid
	
    'reverse startup pattern
    let outpinsb = %00100000
    pause 120
    let outpinsb = %00000100
    pause 120
    high br
    pause 120
    low br
    let outpinsb = %00000001
    pause 120
    let outpinsb = %00001000
    pause 120
    let outpinsb = %01000000
    pause 120
    let outpinsb = %00010000
    pause 120
    let outpinsb = %00000010
    pause 120
	
    'go to top layer
    low bot 
    low mid
    high top
	
    'startup pattern
    let outpinsb = %00000010
    pause 120
    let outpinsb = %00010000
    pause 120
    let outpinsb = %10000000
    pause 120
    let outpinsb = %01000000
    pause 120
    let outpinsb = %00001000
    pause 120
    let outpinsb = %00000001
    pause 120
    high br
    pause 120
    low br
    let outpinsb = %00000100
    pause 120
    let outpinsb = %00100000
    pause 120
    low top
    
    'multiplex pattern 1
    let loops1 = 0 'set loops1 equal to 0
    for loops1 = 0 to 3 'loop 4 times
        high mm 'middle middle column on
        high top 'top layer on
        pause 150

        let outpinsb = %10101010 'leds 7, 5, 3, 1 on
        high br 'bottom right leds on
        pause 150


        let loops = 0 'set loops equal to 0
        for loops = 0 to 9 'loop 10 times
            low top 'top layer off
            high mid 'mid layer on
            low br 'bottom right leds off
            let outpinsb = %01010101 'leds 6, 4, 2, 0 on
            pause 10
            low mid 'mid layer off
            high top 'top layer on
            let outpinsb = %10101010 'leds 7, 5, 3, 1 on
            high br 'bottom right leds on
            pause 10
            next loops 'loop again


        let outpinsb = %10100010 'leds 7, 5, 1 on
        high bot 'bot layer on
        high br 'bottom right leds on
        pause 200
        low bot 'bot layer off
        next loops1 'loop again
    
    
    'circle pattern
    high top 'top layer on
    high tr 'top right column on
    pause 100
    high mm 'middle middle column on
    pause 100
    let loops = 0 'set loops equal to 0
    for loops = 1 to 9 'loop 10 times
        high tr 'top right column on
        high br 'bottom right column on
        high tl 'top left column on
        high bl 'bottom left column on
        high mm 'middle middle column on
        pause 250
        low br ' bottom right column off
        let outpinsb = %01011101 'only the middle and four corners on
        pause 250
        let outpinsb = %00000000 'everything off
        next loops 'next loop
    
    'edge pattern
    let loops = 0 'set loops equal to 0
    for loops = 0 to 2 'loop 3 times
    high top 'top layer on
    symbol flashes = b1 'make variable "flashes"
    let flashes = 1 'set flashes equal to 1
    for flashes = 0 to 4 'loop 5 times
        high mm 'middle middle column on
        pause 150
        low mm 'middle middle column off
        pause 100
        next flashes 'next loop
        
    let outpinsb = %11110111 'only middle column off
    high br 'bottom right column on
    pause 100
    high mid 'middle layer on
    pause 100
    high bot 'bottom layer on
    pause 100
    low bot 'bottom layer off
    pause 100
    low mid 'middle layer off
    pause 100
    let outpinsb = %00001000 'only middle column on
    low br 'bottom right column off
    pause 100
    next loops
    low top 'top layer off
    
    let loops = 0 'set loops equal to 0
    for loops = 0 to 2 'loop 3 times
        if loops = 0 then 'if on first loop
          low bot 'bot layer off
          low mid 'mid layer off
          high top 'top layer on
      elseif loops = 1 then 'if on second loop
          low bot 'bot layer off
          low top 'top layer off
          high mid 'mid layer on
      elseif loops = 2 then 'if on third loop
          low top 'top layer off
          low mid 'mid layer off
          high bot 'bot layer on
      endif
      high br 'bottom right leds on
      pause 100
      low br 'bottom right leds off
      let outpinsb = %00000001 'only led 0 on
      pause 100
      let outpinsb = %00000010 'only led 1 on
      pause 100
      let outpinsb = %00010000 'only led 4 on
      pause 100
      let outpinsb = %10000000 'only led 7 on
      pause 100
      let outpinsb = %01000000 'only led 6 on
      pause 100
      let outpinsb = %00100000 'only led 5 on
      pause 100
      let outpinsb = %00000100 'only led 2 on
      pause 100
      let outpinsb = %00000000 'all leds off
      next loops 'loop again
      
      'multiplex pattern
      symbol change = b1 'make variable change
      let change = 0 'set change equal to 0
      for change = 0 to 4'loop 5 times
        let loops = 0 'set loops equal to 0
        for loops = 0 to 4 'loop 5 times
          high top 'top layer on
          high bot 'bot layer on
          low mid 'mid layer off
          let outpinsb = %11111111 'turn on all  b leds
          high br 'turn on bottom right leds
          pause 15

          high mid 'mid layer on
          let outpinsb = %01011101 'outer edge pins and center pin on
          pause 10
          low top'top layer off
          low bot 'bot layer off
          low br 'bottom right leds off
          next loops
        pause 250

        let loops = 0 'set loops equal to 0
        for loops = 0 to 4 'loop 5 times
          high top 'top layer on
          high bot 'bot layer on
          low mid 'mid layer off
          let outpinsb = %11111111 'turn on all b leds
          high br 'bottom right leds on
          pause 15

          high mid 'midlayer on
          let outpinsb = %10101010 'corner and center led on
          low top 'top layer off
          low bot 'bot layer off
          high br 'bottom right leds on
          pause 10
          next loops 'go to next loop
        pause 250
        next change 'go to next change
        low mid
        low br
        
        'diamond x pattern
        let loops1 = 0 'set loops1 equal to 0
        for loops1 = 0 to 9 'loop 10 times
          for loops = 0 to 9 'loop 10 times to multiplex
            high top 'top layer on
            high mm 'middle middle leds on
            pause 5
            low top 'top layer off
            low mm 'middle middle leds off

            high mid 'mid layer on
            high mr 'middle right leds on
            high ml 'middle left leds on
            pause 5
            low mid 'mid layer off
            low mr 'middle right leds off
            low ml 'middle left leds off

            high bot 'bot layer on
            high mm 'middle middle leds on
            pause 5
            low bot 'bot layer off
            low mm 'middle middle leds off
            next loops 'loop again to multiplex

          low top 'top layer off
          low mid 'mid layer off
          low bot 'bot layer off
          let outpinsb = %00000000 'turn off all leds
          low br 'bottom right leds off
          pause 100
          
          for loops = 0 to 9 'loop 10 times to multiplex
            high top 'top layer on
            high ml 'middle left leds on
            high mr 'middle right leds on
            pause 5
            low top 'top layer off
            low ml 'middle left leds off
            low mr 'middle right leds off

            high mid'mid layer on
            high mm 'middle middle leds on
            pause 5
            low mid 'mid layer off
            low mm 'middle middle leds off

            high bot 'bot layer off
            high ml 'middle left leds on
            high mr 'middle right leds on
            pause 5
            low bot 'bot layer off
            low ml 'middle left leds off
            low mr 'middle right leds off
            next loops 'loop again to multiplex

          next loops1 'loop again
    
    'flashing layer pattern'
    high bot 'bot layer on
    let outpinsb = %00000010 'only led 1 on
    pause 120
    let outpinsb = %00010010 'only leds 1, 4 on
    pause 120
    let outpinsb = %10010010 'only leds 1, 4, 7 on
    pause 120
    let outpinsb = %11010010 'only leds 1, 4, 6, 7 on
    pause 120
    let outpinsb = %11011010 'only leds 1, 3, 4, 6, 7 on
    pause 120
    let outpinsb = %11011011 'only leds 1, 4, 7, 6, 3, 0 on
    pause 120
    high br 'bottom right leds on
    pause 120
    let outpinsb = %11011111 'only leds 0, 1, 2, 3, 4, 6, 7 on
    pause 120
    let outpinsb = %11111111 'all leds on
    pause 120
    low br 'bottom right leds off
	
    'flash all leds
    let loops = 0
    for loops = 0 to 3 'loop 4 times
    let outpinsb = %11111111 'all leds on
    high br 'bottom right leds on
    high top 'top layer on
    high mid 'mid layer on
    high bot 'bot layer on
    pause 100
    let outpinsb = %00000000 'all leds off
    low br 'bottom right leds off
    low top 'top layer off
    low mid 'mid layer off
    low bot 'bot layer off
    pause 100
    next loops 'loop again

    low bot 'bot layer off
    low top 'top layer off
    high mid 'mid layer on

    let outpinsb = %00100000 'only led 5 on
    pause 120
    let outpinsb = %00100100 'only leds 2, 5 on
    pause 120
    high br 'bottom right leds on
    pause 120
    let outpinsb = %00100101 'only leds 0, 2, 5 on
    pause 120
    let outpinsb = %00101101 'only leds 0, 2, 3, 5 on
    pause 120
    let outpinsb = %01101101 'only leds 0, 2, 3, 5, 6 on
    pause 120
    let outpinsb = %01111101 'only leds 0, 2, 3, 4, 5, 6 on
    pause 120
    let outpinsb = %01111111 'only leds 0, 1, 2, 3, 4, 5, 6 on
    pause 120
    let outpinsb = %11111111 'all leds on
    pause 120
    low br 'bottom right leds off

	'flash all leds
    for loops = 0 to 3
    let outpinsb = %11111111
    high br
    high top
    high mid
    high bot
    pause 100
    let outpinsb = %00000000
    low br
    low top
    low mid
    low bot
    pause 100
    next loops

    low bot 
    low mid
    high top

    let outpinsb = %00000010 'only led 1 on
    pause 120
    let outpinsb = %00010010 'only leds 1, 4 on
    pause 120
    let outpinsb = %10010010 'only leds 1, 4, 7 on
    pause 120
    let outpinsb = %11010010 'only leds 1, 4, 6, 7 on
    pause 120
    let outpinsb = %11011010 'only leds 1, 3, 4, 6, 7 on
    pause 120
    let outpinsb = %11011011 'only leds 1, 4, 7, 6, 3, 0 on
    pause 120
    high br 'bottom right leds on
    pause 120
    let outpinsb = %11011111 'only leds 0, 1, 2, 3, 4, 6, 7 on
    pause 120
    let outpinsb = %11111111 'all leds on
    pause 120
    low br 'bottom right leds off

	'flash all leds
    for loops = 0 to 3
    let outpinsb = %11111111
    high br
    high top
    high mid
    high bot
    pause 100
    let outpinsb = %00000000
    low br
    low top
    low mid
    low bot
    pause 100
    next loops
    
    '2 edge pattern
    let loops = 0 'set loops equal to 0
    for loops = 0 to 4 'loop 5 times
        high bot 'bot layer on
        high br 'bottom right leds on
        pause 120
        low br 'bottom right leds off
        high mid 'mid layer off
        high bm 'mottom middle leds off
        pause 120
        low mid 'mid layer off
        low bm 'bottom middle leds off
        high top 'top layer on
        high bl 'bottom left leds on
        pause 120
        low top 'top layer off
        low bl 'bottom left leds on
        high ml 'middle left leds on
        high mid 'mid layer on
        pause 120
        low ml 'middle left leds off
        low mid 'mid layer off
        high tl 'top left leds on
        pause 120
        low tl 'top left leds off
        high tm 'top middle leds on
        high mid 'mid layer on
        pause 120
        low mid 'mid layer off
        low tm 'top middle leds off
        high top 'top layer on
        high tr 'top right leds on
        pause 120
        low tr 'top right leds off
        low top 'top layer off
        high mid 'mid layer on
        high mr 'middle right leds on
        pause 120
        low mr 'middle mgiht leds off
        low br 'bottom right leds off
        low mid 'mid layer off
        next loops 'loop again
    
    'edge circle pattern
    let loops = 0
    for loops = 0 to 7 'loop 7 times
        high bot 'bot layer on
        high mid 'mid layer on
        high top 'top layer on

        high br 'bottom right leds on
        high bm 'bottom middle leds on
        high bl 'bottom left leds on
        pause 120

        low bm 'bottom middle leds off
        low br 'bottom right leds off
        high ml 'middle left leds on
        high tl 'top left leds on
        pause 120

        low bl 'bottom left leds off
        low ml 'middle left leds off
        high tm 'top middle leds on
        high tr 'top right leds on
        pause 120

        low tl 'top  left leds off
        low tm 'top middle leds off
        high mr 'middle right leds on
        high br 'bottom right leds on
        pause 120

        low tr 'top right leds off
        low mr 'middle right leds off
        low br 'bottom right leds off
		next loops 'loop again
    low mid 'mid layer off
    low top 'top layer off
    low bot 'bot layer off
    
	'around side pattern
    let loops = 0 'set loops equal to 0
    for loops = 0 to 9 'loop 10 times
    	'left face 
        high top'top layer on
        high bot 'bot layer on
        high mid 'mid layer on
        high tl 'top left leds on
        high ml 'middle left leds on
        high bl 'bottom left leds on
        pause 150
		
        'top face
        low bot'bot layer off
        low mid 'nid layer off
        high top 'top layer on
        let outpinsb = %11111111 'all leds on
        high br 'bottom right leds on
        pause 150
        let outpinsb = %00000000 'all leds off
        low br 'bottom right leds off
		
        'right face
        high top 'top layer on
        high bot 'bot layer on
        high mid 'mid layer on
        high tr 'top right leds on
        high mr 'middle right leds on
        high br 'bottom right leds on
        pause 150
		
        'bottom face
        low top 'top layer off
        low mid 'mid layer off
        high bot 'bot layer off
        let outpinsb = %11111111 'all leds on
        high br 'bottom right leds on
        pause 150
        let outpinsb = %00000000 'all elds off
        low br 'bottom right leds off
    next loops 'loop again
    
    'ending pattern
    let outpinsb = %00000000 'turn all leds off
	high bot 'bot layer on
    high ml 'middle left leds on
    pause 120
    high mid 'mid layer on
    pause 120
    high top 'top layer on
    pause 120
    for loops = 0 to 10 'loop 11 times to multiplex
        high mm 'middle middle leds on
        low mid 'mid layer off
        low bot 'bot layer off
        pause 10

        high mid 'mid layer on
        high bot 'bot layer on
        low mm 'middle middle leds off
        pause 10
        next loops 'loop again to multiplex
    
    for loops = 0 to 8 'loop 7 times
        high top 'top layer on
        high mid 'mid layer on
        high bot 'bot layer on
        let outpinsb = %00011000 'only leds 3, 4 on
        pause 120
        let outpinsb = %01001000 'only leds 3, 6 on
        pause 120
        let outpinsb = %00001100 'only leds 3, 2 on
        pause 120
        let outpinsb = %00001001 'only leds 3, 1 on
        pause 120
        next loops 'loop again
        
    let outpinsb = %00001001 'only leds 0, 3 on
    pause 120
    let outpinsb = %00001011 'only leds 0, 1, 3 on
    pause 120
    let outpinsb = %00011011' only leds 0, 1, 3, 4 on
    pause 120
    let outpinsb = %10011011 'only leds 0, 1, 3, 4, 7 on
    pause 120
    let outpinsb = %11011011 'only leds 0, 1, 3, 4, 6, 7, on
    pause 120
    let outpinsb = %11111011 'only leds 0, 1, 3 4, 5, 6, 7 on
    pause 120
    let outpinsb = %11111111 'all leds on
    pause 120
    high br 'bottom right leds on
    pause 120
    
    for loops = 0 to 4 'loop 5 times
    	high top 'top layer on
        high mid 'mid layer on
        high bot 'bot layer on
        outpinsb = %11111111 'all leds on
        high br 'bottom right leds on
        pause 100
        let outpinsb = %00000000 'all leds off
        low br 'bottom right leds off
        pause 100
        next loops 'loop again