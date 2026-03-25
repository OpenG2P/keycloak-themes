<#import "template.ftl" as layout>

<@layout.registrationLayout bodyClass="openg2p-login" displayInfo=false displayMessage=false; section>
  <#if section == "form">

    <div class="page-wrapper">
      <div class="content-wrapper">

        <!-- LEFT PANEL -->
        <div class="left-panel">

          <h1>Welcome to OpenG2P</h1>

          <p class="description">
            A one-stop platform to access OpenG2P's modules and functionalities.
          </p>

          <button class="contact-btn" onclick="window.open('https://www.openg2p.org/', '_blank')">
            <span>Get in touch</span>
            <span class="arrow">
              <img src="${url.resourcesPath}/img/arrow.svg" alt="arrow" />
            </span>
          </button>

          <img
            src="${url.resourcesPath}/img/login-illustration.png"
            class="left-image"
            alt="Illustration"
          />
        </div>

        <!-- RIGHT PANEL -->
        <div class="right-panel right-panel--forgot">
        <div class="login-card login-card--forgot">

            <img
              src="${url.resourcesPath}/img/logo.svg"
              alt="OpenG2P Logo"
              class="logo"
            />

            <h2 class="title">Staff Portal</h2>

            <p class="subtitle">Forgot your password</p>

            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">

            <div class="field">
                <label for="username">Email</label>
                <input
                id="username"
                type="text"
                name="username"
                value="${(auth.attemptedUsername!'')}"
                autocomplete="email"
                required
                />
            </div>

            <#if messagesPerField.existsError('username')>
                <div class="field-error">
                ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                </div>
            </#if>

            <div class="back-to-login">
                <a href="${url.loginUrl}" class="back-link">
                    <img src="${url.resourcesPath}/img/left_arrow.svg" alt="back" class="arrow-icon" />
                    <span>Back to Login</span>
                </a>
            </div>

            <button type="submit" class="login-btn">
                Submit
            </button>

            <div class="powered-by">
                <span>Powered by</span>
                <img
                  src="${url.resourcesPath}/img/keycloak.svg"
                  alt="Keycloak"
                  class="powered-logo"
                />
            </div>

            </form>

        </div>
        </div>
    </div>

  </#if>
</@layout.registrationLayout>