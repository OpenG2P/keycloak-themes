<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div class="kc-error-page">
            <div class="kc-error-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M12 9v2m0 4h.01M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/>
                </svg>
            </div>
            <p class="kc-error-message">${kcSanitize(message.summary)?no_esc}</p>
            <#if skipLink??>
            <#else>
                <#if pageRedirectUri??>
                    <p><a href="${pageRedirectUri}" class="kc-back-link">${msg("backToApplication")}</a></p>
                <#elseif actionUri??>
                    <p><a href="${actionUri}" class="kc-back-link">${msg(actionRequiredMessage!"proceedWithAction")}</a></p>
                <#elseif client.baseUrl??>
                    <p><a href="${client.baseUrl}" class="kc-back-link">${msg("backToApplication")}</a></p>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
