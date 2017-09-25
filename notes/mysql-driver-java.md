#Mysql driver java

-----------------------------------------
Create this folder:

mkdir -p /opt/wildfly-8.2.1.Final/modules/system/layers/base/com/mysql/main

copy these two files to the folder that was just created:

mysql-connector-java-5.1.26.jar
module.xml

~~~xml
==================[ module.xml ]==================
<?xml version="1.0" encoding="UTF-8"?>
<module xmlns="urn:jboss:module:1.3" name="com.mysql">
    <resources>
        <resource-root path="mysql-connector-java-5.1.26.jar"/>
    </resources>
    <dependencies>
        <module name="javax.api"/>
        <module name="javax.transaction.api"/>
    </dependencies>
</module>
==================================================
~~~

In standalone.xml add the driver:

~~~xml
=================[ standalone.xml ]===============
 <drivers>
     <driver name="mysql" module="com.mysql">
         <driver-class>com.mysql.jdbc.Driver</driver-class>
     </driver>
      .
      .
 </drivers>
==================================================
~~~

also for jpa use:

/opt/wildfly-8.2.1.Final/modules/system/layers/base/org/eclipse/persistence/main

and copy these three files there:

eclipselink.jar, jipijapa-eclipselink-1.0.1.Final.jar, module.xml

-----------------------------------------
The date is: Wednesday 06 September 2017, 11:58:30
