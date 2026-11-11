<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Serie - TV Series</title>
        <link rel="stylesheet" href="/css/style.css">
        <!-- Incorporando Lucide Icons -->
        <script src="https://unpkg.com/lucide@latest"></script>
    </head>
    <body>
        <nav class="navbar">
            <a href="/series" style="display: flex; align-items: center; gap: 12px; text-decoration: none;">
                <div style="display: flex; align-items: center; justify-content: center; width: 36px; height: 36px; background: var(--primary); color: white; border-radius: 10px; box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.2);">
                    <i data-lucide="tv" style="width: 20px; height: 20px;"></i>
                </div>
                <h2 style="margin: 0;">TV Series</h2>
            </a>
            <div class="nav-links">
                <a href="/mis-compras"><i data-lucide="shopping-bag" class="nav-icon"></i> Mis compras</a>
                <a href="/series"><i data-lucide="film" class="nav-icon"></i> Series</a>
                <a href="/formulario/agregar" style="color: var(--primary); font-weight: 600;"><i data-lucide="plus-circle" class="nav-icon"></i> Agregar serie</a>
                <a href="/logout" class="text-danger"><i data-lucide="log-out" class="nav-icon"></i> Logout</a>
            </div>
        </nav>

        <div class="form-container" style="max-width: 700px;">
            <div class="form-header" style="margin-bottom: 32px; border-bottom: 1px solid var(--border); padding-bottom: 16px;">
                <h1 style="margin: 0; display: flex; align-items: center; gap: 10px;">
                    <i data-lucide="monitor-play" style="color: var(--primary);"></i>
                    Publicar nueva serie
                </h1>
                <p class="text-muted" style="margin-top: 8px;">Completa los detalles para agregar una serie al catálogo.</p>
            </div>

            <form:form action="/agregar" method="POST" modelAttribute="serie">

                <!-- Fila 1: Título completo -->
                <div class="form-row">
                    <div class="form-group" style="width: 100%;">
                        <form:label path="titulo">Título de la serie</form:label>
                            <div class="input-error-wrapper">
                                <form:input type="text" path="titulo" placeholder="Ej: Doctor House"/>
                                <form:errors path="titulo"/>
                            </div>
                        </div>
                    </div>

                    <!-- Fila 2: Grid de 3 columnas para datos numéricos -->
                    <div class="form-row form-grid-3">
                        <div class="form-group">
                            <form:label path="anio">Año de lanzamiento</form:label>
                                <div class="input-error-wrapper">
                                    <!-- Bloqueamos el año entre 1900 y el año actual/próximo -->
                                    <form:input type="number" path="anio" min="1900" max="2027" placeholder="Ej: 2004"/>
                                    <form:errors path="anio"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <form:label path="precio">Precio ($)</form:label>
                                    <div class="input-error-wrapper">
                                        <!-- Bloqueamos valores menores a 0 -->
                                        <form:input type="number" step="0.01" min="0" path="precio" placeholder="0.00"/>
                                        <form:errors path="precio"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="cantidad">Stock inicial</form:label>
                                        <div class="input-error-wrapper">
                                            <!-- Bloqueamos inventario negativo -->
                                            <form:input type="number" path="cantidad" min="0" placeholder="Unidades"/>
                                            <form:errors path="cantidad"/>
                                        </div>
                                    </div>
                                </div>

                                <!-- Fila 3: Descripción completa -->
                                <div class="form-row">
                                    <div class="form-group" style="width: 100%;">
                                        <form:label path="descripcion">Sinopsis o descripción</form:label>
                                            <div class="input-error-wrapper">
                                                <form:textarea path="descripcion" rows="4" placeholder="Escribe un breve resumen de la trama..."/>
                                                <form:errors path="descripcion"/>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Fila 4: URL de la imagen -->
                                    <div class="form-row">
                                        <div class="form-group" style="width: 100%;">
                                            <form:label path="url">URL del póster (Imagen)</form:label>
                                                <div class="input-error-wrapper">
                                                    <div style="display: flex; align-items: center; border: 1px solid var(--border); border-radius: 6px; background: #F9FAFB; overflow: hidden; padding-left: 14px;">
                                                        <i data-lucide="link" class="text-muted" style="width: 18px;"></i>
                                                        <form:input type="text" path="url" placeholder="https://ejemplo.com/imagen.jpg" style="border: none; background: transparent; box-shadow: none; width: 100%; outline: none;"/>
                                                    </div>
                                                    <form:errors path="url"/>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Acciones -->
                                        <div style="display: flex; gap: 16px; margin-top: 32px; justify-content: flex-end;">
                                            <a href="/series" class="btn-danger" style="text-decoration: none; padding: 12px 24px;">Cancelar</a>
                                            <button type="submit" class="btn-primary" style="padding: 12px 32px; gap: 8px;">
                                                <i data-lucide="save" style="width: 18px; height: 18px;"></i> Guardar serie
                                            </button>
                                        </div>
                                    </form:form>
                                </div>

                                <!-- Inicializar los iconos -->
                                <script>
                                    lucide.createIcons();
                                </script>
                            </body>
                        </html>