<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Compras - TV Series</title>
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
                <!-- Destacamos "Mis compras" como la página activa -->
                <a href="/mis-compras" style="color: var(--primary); font-weight: 600;"><i data-lucide="shopping-bag" class="nav-icon"></i> Mis compras</a>
                <a href="/series"><i data-lucide="film" class="nav-icon"></i> Series</a>
                <a href="/formulario/agregar"><i data-lucide="plus-circle" class="nav-icon"></i> Agregar serie</a>
                <a href="/logout" class="text-danger"><i data-lucide="log-out" class="nav-icon"></i> Logout</a>
            </div>
        </nav>

        <div class="main-content">
            <!-- Banner de Cabecera -->
            <div class="dashboard-header">
                <div class="header-greeting">
                    <h1>Tu Colección 🍿</h1>
                    <p class="text-muted">Aquí tienes todas las series que has adquirido hasta el momento.</p>
                </div>
                <!-- Botón secundario para invitar a seguir comprando -->
                <a href="/series" class="btn-primary" style="background-color: white; color: var(--text-main); border: 1px solid var(--border);">
                    <i data-lucide="search"></i> Explorar catálogo
                </a>
            </div>

            <div class="lista-series">
                <c:choose>
                    <c:when test="${not empty compras}">
                        <c:forEach var="serie" items="${compras}">
                            <div class="card-serie">
                                <a href="/detalle/${serie.id}" class="card-img-link">
                                    <img src="${serie.url}" alt="Imagen de ${serie.titulo}">
                                </a>

                                <div class="card-details" style="display: flex; flex-direction: column; height: 100%;">

                                    <!-- Header de la tarjeta (Badge de propiedad) -->
                                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; min-height: 28px;">
                                        <span class="badge" style="background-color: #ECFDF5; color: #059669; border: 1px solid #A7F3D0; display: flex; align-items: center; gap: 4px;">
                                            <i data-lucide="check-circle" style="width: 12px; height: 12px;"></i> En colección
                                        </span>
                                    </div>

                                    <!-- Título y Precio pagado -->
                                    <div class="card-info" style="margin-bottom: 16px;">
                                        <h3 style="margin: 0 0 10px 0; font-size: 1.15rem; line-height: 1.3;">
                                            <a href="/detalle/${serie.id}" style="color: inherit; text-decoration: none;">${serie.titulo}</a>
                                        </h3>
                                        <div class="precio-tag" style="display: inline-block; background-color: #F3F4F6; color: var(--text-muted); border-color: var(--border);">
                                            Pagado: $${serie.precio}
                                        </div>
                                    </div>

                                    <!-- Espaciador flexible -->
                                    <div style="flex-grow: 1;"></div>

                                    <!-- Botón de acción principal -->
                                    <a href="/detalle/${serie.id}" class="btn-primary" style="width: 100%; text-align: center; margin-top: 10px; color: white !important; box-sizing: border-box;">
                                        Ver detalles
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <!-- Empty State Profesional para cuando no hay compras -->
                        <div class="empty-state" style="grid-column: 1 / -1; padding: 64px 20px;">
                            <div class="empty-icon-wrapper" style="width: 80px; height: 80px; background: #EEF2FF; margin-bottom: 24px;">
                                <i data-lucide="shopping-cart" class="empty-icon" style="color: var(--primary); width: 40px; height: 40px;"></i>
                            </div>
                            <h3 style="font-size: 1.5rem; margin-bottom: 12px;">Aún no tienes series</h3>
                            <p style="font-size: 1.05rem; max-width: 400px; margin: 0 auto 32px auto;">Tu colección está vacía. Navega por el catálogo y encuentra tu próxima serie favorita.</p>
                            <a href="/series" class="btn-primary" style="padding: 12px 32px; font-size: 1.05rem;">
                                <i data-lucide="compass"></i> Ir al catálogo
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