package com.cristina_tiznado.tv_series.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.tv_series.modelos.Usuario;
import java.util.Optional;


@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Long>{

    Optional<Usuario> findByCorreo(String correo);
}
