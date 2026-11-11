<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - TV Series</title>
    <link rel="stylesheet" href="/css/style.css">
    <!-- Incorporando Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 100vh; padding: 20px; box-sizing: border-box;">
    
    <div style="width: 100%; max-width: 440px;">
        <!-- Cabecera de marca y logo -->
        <div style="text-align: center; margin-bottom: 32px; animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;">
            <div style="display: inline-flex; align-items: center; justify-content: center; width: 56px; height: 56px; background: var(--primary); color: white; border-radius: 16px; margin-bottom: 16px; box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);">
                <i data-lucide="tv" style="width: 28px; height: 28px;"></i>
            </div>
            <h1 style="font-size: 1.75rem; margin: 0 0 8px 0; color: var(--text-main); letter-spacing: -0.025em;">TV Series</h1>
            <p style="color: var(--text-muted); margin: 0; font-size: 1.05rem;">Bienvenido de vuelta, inicia sesión en tu cuenta.</p>
        </div>

        <!-- Tarjeta de Login -->
        <div class="form-container" style="margin: 0; padding: 40px; width: 100%; box-sizing: border-box;">
            <form:form action="/login" method="POST" modelAttribute="usuarioLogin">
                
                <div class="form-group" style="margin-bottom: 20px;">
                    <form:label path="correo">Correo electrónico</form:label>
                    <div class="input-error-wrapper">
                        <!-- Contenedor relativo para posicionar el icono sobre el input -->
                        <div style="position: relative; display: flex; align-items: center;">
                            <i data-lucide="mail" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                            <form:input type="email" path="correo" placeholder="tu@correo.com" style="padding-left: 40px;"/>
                        </div>
                        <form:errors path="correo"/>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 24px;">
                    <form:label path="password">Contraseña</form:label>
                    <div class="input-error-wrapper">
                        <div style="position: relative; display: flex; align-items: center;">
                            <i data-lucide="lock" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                            <form:input type="password" path="password" placeholder="••••••••" style="padding-left: 40px;"/>
                        </div>
                        <form:errors path="password"/>
                    </div>
                </div>

                <button type="submit" class="btn-primary btn-block" style="margin-top: 8px; padding: 12px; font-size: 1.05rem;">
                    Iniciar sesión
                </button>
            </form:form>
        </div>

        <!-- Enlace al registro inferior -->
        <div style="text-align: center; margin-top: 24px; animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards; animation-delay: 0.1s; opacity: 0;">
            <p style="color: var(--text-muted); font-size: 0.95rem;">
                ¿No tienes una cuenta? <a href="/register" style="color: var(--primary); text-decoration: none; font-weight: 600;">Regístrate aquí</a>
            </p>
        </div>
    </div>

    <!-- Inicializar los iconos -->
    <script>
        lucide.createIcons();
    </script>
</body>
</html>