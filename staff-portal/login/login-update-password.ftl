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
        <div class="right-panel right-panel--update-password">
        <div class="login-card login-card--update">

            <img
                src="${url.resourcesPath}/img/logo.svg"
                alt="OpenG2P Logo"
                class="logo"
            />

            <h2 class="title">Staff Portal</h2>

            <p class="subtitle">
              Update your password
            </p>

            <#if message?has_content>
              <div class="custom-message ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
              </div>
            </#if>

            <form id="kc-update-password-form" action="${url.loginAction}" method="post">

            <!-- NEW PASSWORD -->
            <div class="field">
                <label for="password-new">New Password</label>
                <input
                id="password-new"
                name="password-new"
                type="password"
                autocomplete="new-password"
                required
                />
            </div>

            <!-- CONFIRM PASSWORD -->
            <div class="field">
                <label for="password-confirm">Confirm Password</label>
                <input
                id="password-confirm"
                name="password-confirm"
                type="password"
                autocomplete="new-password"
                required
                />
            </div>

            <!-- ERROR -->
            <#if messagesPerField.existsError('password','password-confirm')>
                <div class="field-error">
                ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                </div>
            </#if>

            <!-- BUTTON -->
            <button type="submit" class="login-btn">
                Update Password
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
    </div>

  </#if>
</@layout.registrationLayout>