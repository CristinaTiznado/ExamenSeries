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
    <title>Detalle Serie</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h2>TV Series</h2>
        <div class="nav-links">
            <a href="/mis-compras">Mis compras</a>
            <a href="/series">Series</a>
            <a href="/formulario/agregar">Agregar serie</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="main-content">
        <h1>${serie.titulo}</h1>
        
        <div class="detalle-container">
            <div class="detalle-imagen">
                <img src="${serie.url}" alt="Imagen de ${serie.titulo}">
            </div>
            
            <div class="detalle-info">
                <p><strong>Usuario que publicó esta serie:</strong> <br>${serie.creador.nombre} ${serie.creador.apellido}</p>
                <p><strong>Descripción:</strong> <br>${serie.descripcion}</p>
                <p><strong>Precio:</strong> <br>$${serie.precio}</p>
                <p><strong>Cantidad en inventario:</strong> <br>${serie.cantidad}</p>
                <div>
                    <c:choose>
                        <c:when test="${yaComprado}">
                            <span class="btn-disabled">Ya compraste esta serie</span>
                        </c:when>
                        <c:when test="${serie.cantidad > 0}">
                            <a href="/comprar/${serie.id}" class="btn-comprar">Comprar</a>
                        </c:when>
                        <c:otherwise>
                            <span class="text-agotado">¡Agotado!</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="lista-compradores-box">
            <h3 class="text-muted">Usuarios que han comprado esta serie</h3>
            <ul>
                <c:forEach var="comprador" items="${serie.compradores}">
                    <li>${comprador.nombre} ${comprador.apellido}</li>
                </c:forEach>
                <c:if test="${empty serie.compradores}">
                    <li>Nadie ha comprado esta serie aún.</li>
                </c:if>
            </ul>
        </div>
    </div>
</body>
</html>