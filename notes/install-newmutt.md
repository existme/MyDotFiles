# Install-Newmutt.Md

-----------------------------------------
# Installing from source

To support caching `lmdb` can be used for TSL `ssl` should be included when
configuring it.

```bash
git clone https://github.com/neomutt/neomutt.git
s apt install liblmdb-dev liblmdb0
cd neomutt
./configure --ssl --lmdb
s make install
```

-----------------------------------------
2018-01-12 23:31:12
