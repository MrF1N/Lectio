package by.mrf1n.lectio.security;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class LectioWebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final DataSource dataSource;
    private final LectioBasicAuthenticationEntryPoint authenticationEntryPoint;
    private final UserDetailsService userDetailsService;
    private final BCryptPasswordEncoder passwordEncoder;

    public LectioWebSecurityConfig(DataSource dataSource,
                                   LectioBasicAuthenticationEntryPoint authenticationEntryPoint,
                                   @Qualifier("lectioUserDetailsService") UserDetailsService userDetailsService,
                                   BCryptPasswordEncoder passwordEncoder) {
        this.dataSource = dataSource;
        this.authenticationEntryPoint = authenticationEntryPoint;
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.jdbcAuthentication()
//                .dataSource(dataSource)
//                .passwordEncoder(NoOpPasswordEncoder.getInstance())
//                .usersByUsernameQuery("select login, password, active from users where login=?")
//                .authoritiesByUsernameQuery("select u.login, ur.roles from users u inner join user_role ur on u.id = ur.user_id where u.login=?");
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/", "/auth/reg").permitAll()
                .anyRequest().authenticated();
        http.formLogin().permitAll()
                .and()
                .logout().permitAll();
        http.httpBasic().authenticationEntryPoint(authenticationEntryPoint);
    }
}