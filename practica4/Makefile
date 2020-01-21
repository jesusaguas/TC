comp: 		comp.l comp.y
				bison -vyd comp.y
				flex comp.l
				gcc -o comp y.tab.c lex.yy.c -ll
