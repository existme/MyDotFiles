# Fix-Cargo.Md

----------------------------------------- 
Sometimes Cargo fails to update and install new packages. The work around
could be cleaning the cache and reinstalling packages. To do so:

1- Remove all cache
``` bash
rm -rf ~/.cargo
```
2. Install cargo-update
``` bash
cargo install cargo-update
# now you can run the following command to update everything
cargo install-update -a
```
3. Reinstall packages
```bash
cargo install bat
```
-----------------------------------------
2018-07-02 09:49:43
