module half_adder 
  (
   a,
   b,
   osum,
   carry
   );
 
  input  a;
  input  b;
  output sum;
  output carry;
 
  assign sum   = a ^ b; // bitwise xor
  assign carry = a & b;  // bitwise and
 
endmodule
