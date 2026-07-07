package com.cristina_tiznado.tv_series.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.cristina_tiznado.tv_series.modelos.Serie;
import com.cristina_tiznado.tv_series.modelos.Usuario;
import com.cristina_tiznado.tv_series.servicios.ServicioSerie;
import com.cristina_tiznado.tv_series.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorSerie {

    @Autowired
    private ServicioSerie servicioSerie;

    @Autowired
    private ServicioUsuario servicioUsuario;

    // ----------------------------------

    // INICIO
    @GetMapping("/series")
    public String series(HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("usuarioLogueado", u);
        modelo.addAttribute("series", this.servicioSerie.obtenerTodasLasSeries());
        modelo.addAttribute("seriesCompradas", this.servicioUsuario.obtenerUsuarioPorId(u.getId()).getSeriesCompradas());

        return "series.jsp";
    }

    // AGREGAR NUEVA SERIE
    @GetMapping("/formulario/agregar")
    public String formularioAgregar(HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("serie", new Serie());

        return "agregar.jsp";
    }

    @PostMapping("/agregar")
    public String agregar(@Valid @ModelAttribute("serie") Serie serie, BindingResult validaciones, HttpSession sesion){

        if(validaciones.hasErrors()){
            return "agregar.jsp";
        }

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        serie.setCreador(u);

        this.servicioSerie.crearSerie(serie, validaciones);

        return "redirect:/series";
    }

    // EDITAR SERIE
    @GetMapping("/formulario/editar/{id}")
    public String formularioEditar(@PathVariable("id") Long id, HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        modelo.addAttribute("serie", this.servicioSerie.obtenerSeriePorId(id));

        return "editar.jsp";
    }

    @PutMapping("/editar")
    public String editar(@Valid @ModelAttribute("serie") Serie serie, BindingResult validaciones){

        if(validaciones.hasErrors()){
            return "editar.jsp";
        }

        Serie serieDB = this.servicioSerie.obtenerSeriePorId(serie.getId());

        serie.setCompradores(serieDB.getCompradores());

        this.servicioSerie.modificarSerie(serie);

        return "redirect:/series";
    }

    // ELIMINAR SERIE
    @DeleteMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id") Long id){

        this.servicioSerie.eliminarSerie(id);

        return "redirect:/series";
    }

    // DETALLE SERIE
    @GetMapping("/detalle/{id}")
    public String detalle(HttpSession sesion, @PathVariable("id") Long id, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());
        Serie serie = this.servicioSerie.obtenerSeriePorId(id);

        Boolean yaComprado = this.servicioSerie.encontrarSerie(serie, usuarioDB);

        modelo.addAttribute("yaComprado", yaComprado);
        modelo.addAttribute("serie", serie);

        return "detalle.jsp";
    }

    // COMPRAR SERIE
    @GetMapping("/comprar/{id}")
    public String comprar(@PathVariable("id") Long id, HttpSession sesion){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        Serie serie = this.servicioSerie.obtenerSeriePorId(id);

        if(serie == null){
            return "redirect:/series";
        } else if(serie.getCantidad() > 0){
            serie.setCantidad(serie.getCantidad() - 1);

            Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());
            usuarioDB.getSeriesCompradas().add(serie);

            this.servicioSerie.modificarSerie(serie);
            this.servicioUsuario.modificarUsuario(usuarioDB);
        }

        return "redirect:/mis-compras";
    }

    // VISTA MIS COMPRAS
    @GetMapping("/mis-compras")
    public String misCompras(HttpSession sesion, Model modelo){

        Usuario u = (Usuario) sesion.getAttribute("usuario");
        if(u == null){
            return "redirect:/";
        }

        Usuario usuarioDB = this.servicioUsuario.obtenerUsuarioPorId(u.getId());

        modelo.addAttribute("usuarioLogueado", u);
        modelo.addAttribute("compras", usuarioDB.getSeriesCompradas());

        return "misCompras.jsp";
    }
}
