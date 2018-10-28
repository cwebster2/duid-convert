# Duid converter

If you have ever setup static ipv6 addresses via dhcpv6, you've probably run into the issue that
dhclient6 stores its duid as a string with octal escape sequences for non-printable ascii characters
and most (all?) dhcpdv6 daemons want hexidecimal duids with bytes separated by colons.  

This is alsmost a simple problem, only made non-trivial because the duid doesn't encode printable bytes, so essentially there is a mix of 4-byte wide and 1-byte wide characters each.

## Example

Dhclient 6 duids look like this: `"\000\004\323\2421\031 WK5\305\363\221\310\355\017\227J"` (you can find the one generated for your system in your dhclient6 lease file).  

Dhcpdv6 static mapping wants duids that look like this: `00:04:D3:A2:31:19:20:57:4B:35:C5:F3:91:C8:ED:0F:97:4A`.

duid-convert.sh will take the first as an argument and output the second.

```
% ./duid-convert.sh "\000\004\323\2421\031 WK5\305\363\221\310\355\017\227J"
00:04:D3:A2:31:19:20:57:4B:35:C5:F3:91:C8:ED:0F:97:4A
```
