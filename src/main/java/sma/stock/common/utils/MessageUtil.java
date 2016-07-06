package sma.stock.common.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

@Component
public class MessageUtil {
    @Autowired
    private MessageSource messageSource;

    public String getMessage(String code) {
        return this.messageSource.getMessage(code, null, LocaleContextHolder.getLocale());
    }

    public String getMessage(String code, String[] args) {
        return this.messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
    }
}
