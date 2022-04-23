# Anti Hidden Modlist
Ever ran into somebody who appears to be running mods, but their modlist is empty? Well luckily, we can sorta tell if they are hiding their list if they use BeardLib! Basically, if a cheater is running beardlib and hiding their modlist, this mod will let you know.

If you are a cheater who hides their modlist, just remove beardlib to prevent this mod from catching you
But there are other far more effective ways to catch you anyways, so maybe just dont cheat in a PvE game?

## WORKS AS HOST ONLY
* you can make this work as a client by changing line 13 from `if channel_id == 4 and Net:IsHost() then` to `	if channel_id == 4 then`
* no support will be provided for using this as a client
	* no support will be guaranteed to be provided for anything
* if youre gonna cheat at least be smart about it

<details>
  <summary><b>IMPORTANT NOTICE(S)</b></summary>
* there are other better ways of doing this
* this code is awful since this is a proof of concept
* dont use any form of autokick, always manually review before kicking
</details>

<details>
  <summary><b>KNOWN ISSUES</b></summary>
* this mod is bad
* sometimes false errors
* this mod is poorly coded
* there is for sure a far better way to do this
* this will not trigger for all players, only those who send beardlib outfit strings which makes basically half the code redundant
* i hate lua
</details>

## License
```
                     PAYDAY 2 Anti-Hidden Modlist
                    Copyright (C) 2021 theokrueger

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```
