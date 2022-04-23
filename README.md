# Anti Hidden Modlist

ever ran into somebody who appears to be running mods, but their modlist is empty?

well luckily, we can sorta tell if they are hiding their list if they use [BeardLib](https://modworkshop.net/mod/14924)!

basically, if a cheater is running beardlib and hiding their modlist, this mod will let you know.

if you are a cheater who hides their modlist, just remove beardlib to prevent this mod from catching you

### WORKS AS HOST ONLY

* you can make this work as a client by changing line 11 from `if channel_id == 4 and Net:IsHost() then` to `	if channel_id == 4 then`
* no support will be provided for using this as a client
	* no support will be guaranteed to be provided for anything
* if youre gonna cheat at least be smart about it

<details>
  <summary><b>important thing</b></summary>

* there are other better ways of doing this
* this code is awful since this is a proof of concept
* dont use any form of autokick, always manually review before kicking

</details>

<details>
  <summary><b>known issues</b></summary>

* this mod is bad
* sometimes false errors
* this mod is poorly coded
* there is for sure a far better way to do this
* this will not trigger for all players, only those who send beardlib outfit strings which makes basically half the code redundant
* i hate lua

</details>

## license

MIT, see [LICENSE](LICENSE)
