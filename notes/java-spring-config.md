# Java-Spring-Config.Md

-----------------------------------------
## Attributes:

### At instance level:

``` java
@Component
public class MyBean {
    @Value("${name}")
    private String name;
}
```

### At interface level:

``` java
@FeignClient(value = "oidcClient", url="${feign.client.config.oidc.root}")
public interface OidcClient {
}
```

###  Changing the prefix and using validators:

``` java
@ConfigurationProperties(prefix="acme")
@Validated
public class AcmeProperties {
	@NotNull
	private InetAddress remoteAddress;
}
```

### Using another file in classpath:

``` java
@Component
@PropertySource("classpath:global.properties")
public class GlobalProperties {

    @Value("${thread-pool}")
    private int threadPool;

    @Value("${email}")
    private String email;
}
```

### Getting config from another class: ??

``` java
@Configuration
@EnableConfigurationProperties(AcmeProperties.class)
public class MyConfiguration {
}
```

## Configuration location:

``` bash
file:./custom-config/
classpath:custom-config/
file:./config/
file:./
classpath:/config/
classpath:/
```
## Loaded properties:

Put a break-point in `PropertySourcesPropertyResolver` line 81. The sources and 
extracted values could be seen in `propertySource.source`. These are the default
provided sources:

0. "MapPropertySource {name='Inlined Test Properties'}"
1. "MapPropertySource {name='systemProperties'}"
2. "SystemEnvironmentPropertySource {name='systemEnvironment'}"
3. "RandomValuePropertySource {name='random'}"
4. "ConfigurationPropertySources {name='applicationConfigurationProperties'}"
   - applicationConfig: [classpath:/application.yml]
5. "MapPropertySource {name='springCloudClientHostInfo'}"
6. "MapPropertySource {name='defaultProperties'}"

[sdoc-config]: https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html
-----------------------------------------
2018-06-30 04:52:46
