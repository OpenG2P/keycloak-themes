<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <div class="kc-info-page">
            <div class="kc-info-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
            </div>
            <p class="kc-info-message">${msg("emailVerifyInstruction1")}</p>
            <p class="kc-info-message kc-info-message--sub">${msg("emailVerifyInstruction2")}
                <a href="${url.loginAction}">${msg("doClickHere")}</a>
                ${msg("emailVerifyInstruction3")}
            </p>
        </div>
    </#if>
</@layout.registrationLayout>
