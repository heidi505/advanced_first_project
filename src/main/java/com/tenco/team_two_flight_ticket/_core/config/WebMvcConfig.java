package com.tenco.team_two_flight_ticket._core.config;

import com.tenco.team_two_flight_ticket._core.handler.AuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Autowired
    private AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/user/**")
                .addPathPatterns("/admin/**")
                .addPathPatterns("/coupon/**")
                .addPathPatterns("/airport/**")
                .addPathPatterns("/reservation/**")
                .addPathPatterns("/search/**")
                .addPathPatterns("/ticket/**");
    }

}
