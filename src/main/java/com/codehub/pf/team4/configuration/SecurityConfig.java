package com.codehub.pf.team4.configuration;

import com.codehub.pf.team4.authedicationhandlers.LoginSuccessHandler;
import com.codehub.pf.team4.enums.Roles;
import com.codehub.pf.team4.service.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private LoginSuccessHandler loginSuccessHandler;

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailServiceImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService())
                .passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(HttpSecurity security) throws Exception {
        security
                .csrf().disable()

                //LOGIN Configuration
                .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                //.passwordParameter()
                .successHandler(loginSuccessHandler)
                .failureUrl("/login?error=true")


                //LOGOUT Configuration
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("JSESSIONID")
                .permitAll()
                .and()

                //AUTHORIZATION AND ROLES
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("login").anonymous()
                .antMatchers("/home/**").hasAuthority(Roles.USER.toString())
                .antMatchers("/admin/**").hasAuthority(Roles.ADMIN.toString())

                //ERROR HANDLING FOR ACCESS DENIED
                .and()
                .exceptionHandling().accessDeniedPage("/error/access-denied")

                .and()
                .headers()
                .frameOptions()
                .sameOrigin();
    }

}
