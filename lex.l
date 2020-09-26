%option reentrant
%option 8bit
%option never-interactive
%option noinput
%option nounput
%option noyywrap 
%option warn
%option prefix="ru"
%option nodefault
%x latin

%%
"shh" {printf("щ"); yyless(3);}
"zh"  {printf("ж"); yyless(2);}
"ch"  {printf("ч"); yyless(2);} 
"sh"  {printf("ш"); yyless(2);} 
"je"  {printf("э"); yyless(2);} 
"ju"  {printf("ю"); yyless(2);}
"ja"  {printf("я"); yyless(2);} 
"jo"  {printf("ё"); yyless(2);}
"\\". {printf(yytext+1); yyless(2);}
"a"   {printf("а"); yyless(1);}
"b"   {printf("б"); yyless(1);}
"v"   {printf("в"); yyless(1);} 
"g"   {printf("г"); yyless(1);}
"d"   {printf("д"); yyless(1);} 
"e"   {printf("е"); yyless(1);}
"z"   {printf("з"); yyless(1);}
"i"   {printf("и"); yyless(1);} 
"j"   {printf("й"); yyless(1);} 
"k"   {printf("к"); yyless(1);}
"l"   {printf("л"); yyless(1);} 
"m"   {printf("м"); yyless(1);} 
"n"   {printf("н"); yyless(1);} 
"o"   {printf("о"); yyless(1);} 
"p"   {printf("п"); yyless(1);}
"r"   {printf("р"); yyless(1);} 
"s"   {printf("с"); yyless(1);}
"t"   {printf("т"); yyless(1);}
"u"   {printf("у"); yyless(1);}
"f"   {printf("ф"); yyless(1);}
"h"   {printf("х"); yyless(1);}  
"c"   {printf("ц"); yyless(1);} 
"y"   {printf("ы"); yyless(1);}
"q"   {printf("ь"); yyless(1);}
"x"   {printf("х"); yyless(1);}
"@"   {BEGIN(latin);yyless(1);}
<latin>"@"          {BEGIN(INITIAL);}
<latin>[^@\n\r]     ECHO;
<*>(.|\n|\r)        ECHO;
%%

int main(int argc, char const *argv[]){
    yyscan_t scanner;
    YY_BUFFER_STATE buf;
    rulex_init(&scanner);
    if (argc>1) {
        buf = yy_scan_string(argv[1], scanner);
        ru_switch_to_buffer(buf, scanner);
        rulex(scanner);
        yy_delete_buffer(buf, scanner);
        printf("\n");
    } else {
        rulex(scanner);
    }
}