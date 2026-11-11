<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${serie.titulo} - TV Series</title>
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
                <a href="/formulario/agregar"><i data-lucide="plus-circle" class="nav-icon"></i> Agregar serie</a>
                <a href="/logout" class="text-danger"><i data-lucide="log-out" class="nav-icon"></i> Logout</a>
            </div>
        </nav>

        <div class="main-content">
            <!-- Navegación tipo Breadcrumb -->
            <div class="breadcrumb">
                <a href="/series">Series</a> <i data-lucide="chevron-right"></i> <span>${serie.titulo}</span>
            </div>

            <div class="detalle-layout">
                <div class="detalle-imagen">
                    <img src="${serie.url}" alt="Portada de ${serie.titulo}">
                </div>

                <div class="detalle-info-right">
                    <div class="badges-row">
                        <span class="badge badge-primary">Lanzamiento: ${serie.anio}</span>
                        <c:if test="${serie.cantidad <= 5 && serie.cantidad > 0}">
                            <span class="badge badge-warning">¡Últimas unidades!</span>
                        </c:if>
                    </div>

                    <h1>${serie.titulo}</h1>
                    <div class="precio-destacado">$${serie.precio}</div>

                    <div class="creador-profile">
                        <div class="creador-info">
                            <span class="text-muted">Publicado por</span>
                            <strong>${serie.creador.nombre} ${serie.creador.apellido}</strong>
                        </div>
                    </div>

                    <div class="seccion-descripcion">
                        <h3>Sinopsis</h3>
                        <p>${serie.descripcion}</p>
                    </div>

                    <div class="stock-info">
                        <i data-lucide="package"></i>
                        <span>Stock disponible: <strong>${serie.cantidad}</strong> unidades</span>
                    </div>

                    <div class="acciones-compra">
                        <c:choose>
                            <c:when test="${yaComprado}">
                                <div class="alert alert-success">
                                    <i data-lucide="check-circle"></i> Ya tienes esta serie en tu colección
                                </div>
                            </c:when>
                            <c:when test="${serie.cantidad > 0}">
                                <a href="/comprar/${serie.id}" class="btn-comprar btn-block">
                                    <i data-lucide="shopping-cart"></i> Comprar Ahora
                                </a>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-danger">
                                    <i data-lucide="x-circle"></i> Producto agotado
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="lista-compradores-box">
                <div class="compradores-header">
                    <h3><i data-lucide="users"></i> Comunidad</h3>
                    <p class="text-muted">Usuarios que han adquirido esta serie</p>
                </div>

                <c:choose>
                    <c:when test="${not empty serie.compradores}">
                        <div class="compradores-grid">
                            <c:forEach var="comprador" items="${serie.compradores}">
                                <div class="comprador-card">
                                    <i data-lucide="user" class="text-muted" style="width: 18px; height: 18px;"></i>
                                    <span>${comprador.nombre} ${comprador.apellido}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State Profesional -->
                        <div class="empty-state">
                            <div class="empty-icon-wrapper">
                                <i data-lucide="ghost" class="empty-icon"></i>
                            </div>
                            <h4>Aún no hay compradores</h4>
                            <p>Nadie ha comprado esta serie aún. ¡Sé el primero en disfrutarla!</p>
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