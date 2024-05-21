int yylex ()
{
  char ch;

  do {
   ch = cin.peek ();
   if (isalpha (ch)) {
     cin.get ();

     yylval.ident = ch;
     return IDENT;
   }
   else if (isdigit (ch)) {
     int value = 0;
     while (!cin.eof () && isdigit (ch)) {
       cin.get ();

       value = value * 10 + ch - '0';
       ch = cin.peek ();
     }

     yylval.value = value;
     return NUMBER;
  }
  else if (ch == '+' || ch == '\n' || ch == '*' || ch == '=') {
     cin.get ();

     return ch;
  }
  else
    cin.get ();

 } while (!cin.eof ());

 return -1;
}
