<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=(social?? && social.displayInfo) displayWide=(realm.password && social?? && social.providers??); section>
<#if section = "header">
    ${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "form">
<div id="kc-form">
  <div id="kc-form-wrapper">
    <#if realm.password>
      <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

        <#-- Username field (hidden when using identity broker or kerberos) -->
        <#if !usernameHidden??>
          <div class="${properties.kcFormGroupClass!}">
            <label for="username" class="${properties.kcLabelClass!}">
              <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
            </label>
            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username"
                   value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
            />
            <#if messagesPerField.existsError('username','password')>
              <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
              </span>
            </#if>
          </div>
        </#if>

        <#-- Password field -->
        <div class="${properties.kcFormGroupClass!}">
          <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
          <div class="${properties.kcInputGroup!}">
            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password"
                   type="password" autocomplete="current-password"
                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
            />
            <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button"
                    aria-label="${msg('showPassword')}"
                    aria-controls="password" data-password-toggle
                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}"
                    data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                    data-label-show="${msg('showPassword')}"
                    data-label-hide="${msg('hidePassword')}">
              <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
            </button>
          </div>
          <#if usernameHidden?? && messagesPerField.existsError('username','password')>
            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
              ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
            </span>
          </#if>
        </div>

        <#-- Remember me + Forgot password row -->
        <div class="${properties.kcFormGroupClass!} kc-form-options">
          <div id="kc-form-options">
            <#if realm.rememberMe && !usernameHidden??>
              <div class="checkbox">
                <label>
                  <#if login.rememberMe??>
                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                  <#else>
                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                  </#if>
                </label>
              </div>
            </#if>
          </div>
          <div class="forgot-password">
            <#if realm.resetPasswordAllowed>
              <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
            </#if>
          </div>
        </div>

        <#-- Submit button -->
        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
          <input type="hidden" id="id-hidden-input" name="credentialId"
                 <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
          <input tabindex="4"
                 class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                 name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
        </div>
      </form>
    </#if>

    <#-- Social / identity providers -->
    <#if social?? && social.providers?? && social.providers?has_content>
      <div id="kc-social-providers">
        <ul>
          <#list social.providers as p>
            <li>
              <a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}">
                <span>${p.displayName!}</span>
              </a>
            </li>
          </#list>
        </ul>
      </div>
    </#if>
  </div>
</div>
</#if>
</@layout.registrationLayout>
