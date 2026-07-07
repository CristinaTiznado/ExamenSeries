<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Compras</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <nav class="navbar">
        <h1>TV Series</h1>
        <div class="nav-links">
            <a href="/mis-compras">Mis compras</a>
            <a href="/series">Series</a>
            <a href="/formulario/agregar">Agregar serie</a>
            <a href="/logout">Logout</a>
        </div>
    </nav>

    <div class="main-content">
        <h1>Tus series compradas</h1>
        
        <div class="lista-series">
            <c:forEach var="serie" items="${compras}">
                <div class="card-serie">
                    <img src="${serie.url}" alt="Imagen de ${serie.titulo}">
                    <div class="card-details">
                        <h3>${serie.titulo}</h3>
                        <p><strong>Año:</strong> ${serie.anio}</p>
                        <p><strong>Precio:</strong> $${serie.precio}</p>
                        <c:if test="${usuarioLogueado.id == serie.creador.id}">
                            <a href="/formulario/editar/${serie.id}" class="edit-icon">✎</a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty compras}">
                <p>Aún no has comprado ninguna serie.</p>
            </c:if>
        </div>
    </div>
</body>
</html>