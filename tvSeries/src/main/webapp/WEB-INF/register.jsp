<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro - TV Series</title>
        <link rel="stylesheet" href="/css/style.css">
        <!-- Incorporando Lucide Icons -->
        <script src="https://unpkg.com/lucide@latest"></script>
    </head>
    <body style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 100vh; padding: 20px; box-sizing: border-box;">

        <div style="width: 100%; max-width: 500px;">
            <!-- Cabecera de marca y logo -->
            <div style="text-align: center; margin-bottom: 32px; animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;">
                <div style="display: inline-flex; align-items: center; justify-content: center; width: 56px; height: 56px; background: var(--primary); color: white; border-radius: 16px; margin-bottom: 16px; box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);">
                    <i data-lucide="tv" style="width: 28px; height: 28px;"></i>
                </div>
                <h1 style="font-size: 1.75rem; margin: 0 0 8px 0; color: var(--text-main); letter-spacing: -0.025em;">Crear cuenta</h1>
                <p style="color: var(--text-muted); margin: 0; font-size: 1.05rem;">Únete a TV Series y arma tu propia colección.</p>
            </div>

            <!-- Tarjeta de Registro -->
            <div class="form-container" style="margin: 0; padding: 40px; width: 100%; box-sizing: border-box;">
                <form:form action="/register" method="POST" modelAttribute="usuario">

                    <c:if test="${not empty errorGlobal}">
                        <div style="background-color: #FEF2F2; border: 1px solid #FECACA; color: var(--danger); padding: 16px; border-radius: var(--radius); margin-bottom: 24px; display: flex; align-items: center; gap: 12px; font-weight: 500;">
                            <i data-lucide="alert-triangle" style="width: 20px; flex-shrink: 0;"></i>
                            <span>${errorGlobal}</span>
                        </div>
                    </c:if>

                    <!-- Grid para que Nombre y Apellido queden en la misma fila -->
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 16px;">
                        <div class="form-group">
                            <form:label path="nombre">Nombre</form:label>
                                <div class="input-error-wrapper">
                                    <div style="position: relative; display: flex; align-items: center;">
                                        <i data-lucide="user" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                                        <form:input type="text" path="nombre" placeholder="Tu nombre" style="padding-left: 40px;"/>
                                    </div>
                                    <form:errors path="nombre"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <form:label path="apellido">Apellido</form:label>
                                    <div class="input-error-wrapper">
                                        <form:input type="text" path="apellido" placeholder="Tu apellido"/>
                                        <form:errors path="apellido"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group" style="margin-bottom: 16px;">
                                <form:label path="correo">Correo electrónico</form:label>
                                    <div class="input-error-wrapper">
                                        <div style="position: relative; display: flex; align-items: center;">
                                            <i data-lucide="mail" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                                            <form:input type="email" path="correo" placeholder="tu@correo.com" style="padding-left: 40px;"/>
                                        </div>
                                        <form:errors path="correo"/>
                                    </div>
                                </div>

                                <div class="form-group" style="margin-bottom: 16px;">
                                    <form:label path="password">Contraseña</form:label>
                                        <div class="input-error-wrapper">
                                            <div style="position: relative; display: flex; align-items: center;">
                                                <i data-lucide="lock" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                                                <form:input type="password" path="password" placeholder="••••••••" style="padding-left: 40px;"/>
                                            </div>
                                            <form:errors path="password"/>
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 24px;">
                                        <form:label path="confirmarPassword">Confirmar contraseña</form:label>
                                            <div class="input-error-wrapper">
                                                <div style="position: relative; display: flex; align-items: center;">
                                                    <i data-lucide="check-circle-2" style="position: absolute; left: 14px; width: 18px; color: var(--text-muted);"></i>
                                                    <form:input type="password" path="confirmarPassword" placeholder="••••••••" style="padding-left: 40px;"/>
                                                </div>
                                                <form:errors path="confirmarPassword"/>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn-primary btn-block" style="margin-top: 8px; padding: 12px; font-size: 1.05rem;">
                                            Registrarse
                                        </button>
                                    </form:form>
                                </div>

                                <!-- Enlace al login inferior -->
                                <div style="text-align: center; margin-top: 24px; animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards; animation-delay: 0.1s; opacity: 0;">
                                    <p style="color: var(--text-muted); font-size: 0.95rem;">
                                        ¿Ya tienes una cuenta? <a href="/" style="color: var(--primary); text-decoration: none; font-weight: 600;">Inicia sesión</a>
                                    </p>
                                </div>
                            </div>

                            <!-- Inicializar los iconos -->
                            <script>
                                lucide.createIcons();
                            </script>
                        </body>
                    </html>