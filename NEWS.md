
# CHANGES IN genoPLINK VERSION 0.1  
## MINOR CHANGES  
Because different marks have same position in same chromosome, we add 1 bp to duplicated marks.

num  |snpId | mut oldChr |oldPos| new10.2Chr| new10.2Pos 
---- | -----------|------|-----|---|-----------
53856| MARC0030838| A/C|      0|         0|          1  248797015  
29685| ASGA0084227| T/C|     10|  60555618 |        10   56784033  
59349| MARC0084445| T/G|      0|         0|         11   11007618  
31082| ASGA0092611| T/C|     12|  18048121|         12   18158203  
50812| MARC0005477| T/C|      0|         0|         12   15263133  
53974| MARC0031722| A/G|     18|  48129383|        18   47086284  
32181| ASGA0097301| T/C|      2| 10439254 |         2   13448924  
36273| DIAS0004174| T/C|      2|   4386305|          2    6552956  
61885| SIRI0000365| T/C|      5| 103462468|         5  108214461  
45061| H3GA0052488| A/G|      6|  71507269|         6   77141276  
45328| H3GA0054031| A/G|      6|  80995216|         6   86232706  
55172| MARC0041927| A/G|      6| 170508971|         6  156282160  
55589| MARC0045684| A/G|      0|        0  |        6    4169571  
36197| DIAS0003467| T/C|      9| 43973561   |       9   85547743  
29308| ASGA0082290| A/G|      X| 115816037  |        X  123158747  

## update time
- 2014.1.19 first release
- 2014.3.5 second release modifying some details, such as reshaping the annotation using EMACS, adding demand for genoRaw which must contain the column name, adding "map" parameter representing if or not you want to convert for map file
- 2014.4.19 third release: making a package
- 2015.1.13 add a feature replacing "--" for "00"