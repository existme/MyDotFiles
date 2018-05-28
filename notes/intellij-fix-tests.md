# Intellij-Fix.Md

----------------------------------------- 
Sometimes the test files are note generated correctly, as a result of that you will
receive "class not found" and you can only run them when you run `mvn package`.
The problem relies in the project structure settings.

Make sure that `Project compiler output` is correctly set to `classes` folder:

``` bash
/home/<user>/git/<project folder>/classes
```

-----------------------------------------
2018-05-28 15:37:46
