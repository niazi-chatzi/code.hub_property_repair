package com.codehub.pf.team4.authedicationhandlers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

import static com.codehub.pf.team4.utils.GlobalAttributes.TIMESTAMP_COOKIE_NAME;

@Component
public class LoginSuccessHandler extends  SavedRequestAwareAuthenticationSuccessHandler{

    private static final String USER_HOME_PAGE_URL = "home";
    private static final String ADMIN_HOME_PAGE_URL = "admin/home";


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        response.addCookie(generateTimestampCookie());

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        String redirectUrl = USER_HOME_PAGE_URL;
        for (GrantedAuthority grantedAuthority: authorities) {
            if (grantedAuthority.getAuthority().equals("ADMIN")) {
                redirectUrl = ADMIN_HOME_PAGE_URL;
            }
        }
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }


    private Cookie generateTimestampCookie() {
        return new Cookie(TIMESTAMP_COOKIE_NAME, String.valueOf(System.currentTimeMillis()));
    }
}
