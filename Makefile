all:
	flex -b -Cfe -p -p lex.l && gcc -o main -Wall lex.ru.c -O2 -s
	if [ `wc -l <lex.backup` -eq 1 ]; then rm lex.backup; else echo "Lexer shouldn't need a backup!"; fi
	mv main ~/bin/ru