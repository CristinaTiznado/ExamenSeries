package com.cristina_tiznado.tv_series.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.tv_series.modelos.Serie;

@Repository
public interface RepositorioSerie extends CrudRepository<Serie, Long>{

    List<Serie> findAllByOrderByAnioDesc();

    Optional<Serie> findByTitulo(String titulo);
}
