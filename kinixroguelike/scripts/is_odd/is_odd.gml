/// @function	is_odd(n);
/// @param		{real}	n
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Returns true if a given number is odd, and false if even.
Invalid inputs will be returned as even.

argument0 = number to check parity (real)

Example usage:
   if (is_odd(var_num)) {
      show_message("I'm odd!");
   } else {
      show_message("I'm even!");
   }
*/

//If input is valid...
if (is_real(argument0)) {
   //Check and return value parity
   if ((argument0 mod 2) == 0) {
      return false;
   } else {
      return true;
   }
} else {
   //Otherwise return even
   return false;
}