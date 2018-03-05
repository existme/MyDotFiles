# Java-Pure.Md

----------------------------------------- 

```bash
mkdir -p src/com/test

cat >> src/com/test/Main.java <<EOF
package com.test;

public class Main {

    public static void main(String[] args) {
        Arrays.stream(args).forEach(System.out::println);
        System.out.println("salam 2nya\n");
    }
}
EOF

javac src/com/test/Main.java
java -cp src com.test.Main
```

-----------------------------------------
2018-03-03 13:48:50
