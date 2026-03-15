<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <label for="otp" class="${properties.kcLabelClass!}">${msg("loginTotpOneTime")}</label>
                <input id="otp" name="otp" autocomplete="one-time-code" type="text"
                       class="${properties.kcInputClass!}" autofocus
                       aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"/>
                <#if messagesPerField.existsError('totp')>
                    <span class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                    </span>
                </#if>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                       name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
