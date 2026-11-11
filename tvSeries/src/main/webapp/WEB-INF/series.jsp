<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Catálogo de Series - TV Series</title>
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
                <!-- Añadimos color primario al enlace activo para indicar en qué página estamos -->
                <a href="/series" style="color: var(--primary); font-weight: 600;"><i data-lucide="film" class="nav-icon"></i> Series</a>
                <a href="/formulario/agregar"><i data-lucide="plus-circle" class="nav-icon"></i> Agregar serie</a>
                <a href="/logout" class="text-danger"><i data-lucide="log-out" class="nav-icon"></i> Logout</a>
            </div>
        </nav>

        <div class="main-content">
            <!-- Banner de Bienvenida (Hero Header) -->
            <div class="dashboard-header">
                <div class="header-greeting">
                    <h1>Hola, ${usuarioLogueado.nombre} 👋</h1>
                    <p class="text-muted">Explora el catálogo, descubre nuevas series o administra tus publicaciones.</p>
                </div>
                <a href="/formulario/agregar" class="btn-primary">
                    <i data-lucide="plus"></i> Nueva Serie
                </a>
            </div>

            <div class="lista-series">
                <c:choose>
                    <c:when test="${not empty series}">
                        <c:forEach var="serie" items="${series}">

                            <!-- Lógica JSTL para verificar si el usuario logueado ya compró esta serie -->
                            <c:set var="estaComprada" value="false" />
                            <c:forEach var="comprador" items="${serie.compradores}">
                                <c:if test="${comprador.id == usuarioLogueado.id}">
                                    <c:set var="estaComprada" value="true" />
                                </c:if>
                            </c:forEach>

                            <div class="card-serie">
                                <a href="/detalle/${serie.id}" class="card-img-link">
                                    <img src="${serie.url}" alt="Imagen de ${serie.titulo}">
                                </a>

                                <div class="card-details" style="display: flex; flex-direction: column; height: 100%;">

                                    <!-- Header de la tarjeta: Restaurado al badge del creador -->
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; min-height: 28px;">
                                        <c:choose>
                                            <c:when test="${usuarioLogueado.id == serie.creador.id}">
                                                <span class="badge badge-primary">Tu publicación</span>
                                                <a href="/formulario/editar/${serie.id}" class="btn-edit" title="Editar serie" style="margin: 0; width: 28px; height: 28px;">
                                                    <i data-lucide="edit-3" style="width: 14px; height: 14px;"></i>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge" style="background-color: #F3F4F6; color: var(--text-muted); border: 1px solid var(--border); display: flex; align-items: center; gap: 4px;">
                                                    <i data-lucide="user" style="width: 12px; height: 12px;"></i> ${serie.creador.nombre}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Título y Precio (Mantiene el precio gris si está comprada) -->
                                    <div class="card-info" style="margin-bottom: 16px;">
                                        <h3 style="margin: 0 0 10px 0; font-size: 1.15rem; line-height: 1.3;">
                                            <a href="/detalle/${serie.id}" style="color: inherit; text-decoration: none;">${serie.titulo}</a>
                                        </h3>

                                        <c:choose>
                                            <c:when test="${estaComprada}">
                                                <div class="precio-tag" style="display: inline-block; background-color: #F3F4F6; color: var(--text-muted); border-color: var(--border);">
                                                    Adquirida
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="precio-tag" style="display: inline-block;">$${serie.precio}</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Espaciador flexible -->
                                    <div style="flex-grow: 1;"></div>

                                    <!-- Botón de acción principal restaurado a su estilo original -->
                                    <a href="/detalle/${serie.id}" class="btn-primary" style="width: 100%; text-align: center; margin-top: 10px; color: white !important; box-sizing: border-box;">
                                        Ver detalles
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State para cuando no hay series en la base de datos -->
                        <div class="empty-state" style="grid-column: 1 / -1;">
                            <div class="empty-icon-wrapper">
                                <i data-lucide="film" class="empty-icon"></i>
                            </div>
                            <h4>El catálogo está vacío</h4>
                            <p>No hay series publicadas en este momento. ¡Anímate a ser el primero!</p>
                            <a href="/formulario/agregar" class="btn-primary" style="margin-top: 16px;">
                                <i data-lucide="plus"></i> Publicar Serie
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Inicializar los iconos -->
        <script>
            lucide.createIcons();
        </script>
    </body>
</html>