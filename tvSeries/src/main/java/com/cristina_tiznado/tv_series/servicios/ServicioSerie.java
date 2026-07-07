package com.cristina_tiznado.tv_series.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.cristina_tiznado.tv_series.modelos.Serie;
import com.cristina_tiznado.tv_series.modelos.Usuario;
import com.cristina_tiznado.tv_series.repositorios.RepositorioSerie;

@Service
public class ServicioSerie {

    @Autowired
    private RepositorioSerie repositorioSerie;

    // SELECT
    public List<Serie> obtenerTodasLasSeries(){
        return this.repositorioSerie.findAllByOrderByAnioDesc();
    }

    public Serie obtenerSeriePorId(Long id){
        return this.repositorioSerie.findById(id).orElse(null);
    }

    public Serie obtenerSeriePorTitulo(String titulo){
        return this.repositorioSerie.findByTitulo(titulo).orElse(null);
    }

    public Boolean encontrarSerie(Serie serie, Usuario usuario){

        for (Serie serieDB : usuario.getSeriesCompradas()) {
            if(serie.getId() == serieDB.getId()){
                return true;
            }
        }

        return false;
    }

    // INSERT
    public Serie crearSerie(Serie serie, BindingResult validaciones){
        
        if(this.obtenerSeriePorTitulo(serie.getTitulo()) != null){
            validaciones.rejectValue("titulo", "tituloExiste", "Esta serie ya existe.");
        }

        if(validaciones.hasErrors()){
            return null;
        }

        return this.repositorioSerie.save(serie);
    }

    // UPDATE
    public Serie modificarSerie(Serie serie){
        return this.repositorioSerie.save(serie);
    }

    // DELETE
    public void eliminarSerie(Long id){
        this.repositorioSerie.deleteById(id);
    }
}
