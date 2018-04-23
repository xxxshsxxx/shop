package ru.savshop.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import ru.savshop.shop.model.Country;
import ru.savshop.shop.model.Gender;
import ru.savshop.shop.model.User;
import ru.savshop.shop.model.UserType;
import ru.savshop.shop.repository.CategoryRepository;
import ru.savshop.shop.repository.CountryRepository;
import ru.savshop.shop.repository.UserRepository;

import java.util.List;
import java.util.Properties;

@SpringBootApplication
@EnableAsync
public class ShopApplication extends WebMvcConfigurerAdapter implements CommandLineRunner {

    @Value("${gmail.email}")
    private String email;
    @Value("${gmail.password}")
    private String password;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CountryRepository countryRepository;

    public static void main(String[] args) {
        SpringApplication.run(ShopApplication.class, args);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public ViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/");
        bean.setSuffix(".jsp");
        return bean;
    }
    @Bean(name = "mailSender")
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(email);
        mailSender.setPassword(password);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        return mailSender;
    }
    @Bean
    EmbeddedServletContainerCustomizer containerCustomizer(
    ) throws Exception {


        return (ConfigurableEmbeddedServletContainer container) -> {

            if (container instanceof TomcatEmbeddedServletContainerFactory) {

                TomcatEmbeddedServletContainerFactory tomcat = (TomcatEmbeddedServletContainerFactory) container;
                tomcat.addConnectorCustomizers(
                        (connector) -> {
                            connector.setMaxPostSize(10000000);//10MB
                        }
                );
            }
        };
    }


    @Override
    public void run(String... strings) throws Exception {
        String email = "admin@mail.com";
        User oneByEmail = userRepository.findOneByEmail(email);
        if (oneByEmail == null) {
            userRepository.save(User.builder()
                    .email(email)
                    .password(new BCryptPasswordEncoder().encode("123456"))
                    .name("admin")
                    .surname("admin")
                    .country(countryRepository.findOne(39))
                    .verify(true)
                    .token("")
                    .type(UserType.ADMIN)
                    .gender(Gender.MALE)
                    .build());
        }
    }

}
