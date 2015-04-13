package ar.algo.adriba.tp1;

import ar.algo.adriba.tp1.Condimento;
import ar.algo.adriba.tp1.Ingrediente;
import ar.algo.adriba.tp1.Navidad;
import ar.algo.adriba.tp1.Temporada;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Receta {
  private String nombreDelPlato;
  
  private List<Ingrediente> ingredientes;
  
  private List<Condimento> condimentos;
  
  private String explicacionDeLaPreparacion;
  
  private int caloriasReceta;
  
  private Temporada temporada = new Navidad();
  
  @Pure
  public String getNombreDelPlato() {
    return this.nombreDelPlato;
  }
  
  public void setNombreDelPlato(final String nombreDelPlato) {
    this.nombreDelPlato = nombreDelPlato;
  }
  
  @Pure
  public List<Ingrediente> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<Ingrediente> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  @Pure
  public List<Condimento> getCondimentos() {
    return this.condimentos;
  }
  
  public void setCondimentos(final List<Condimento> condimentos) {
    this.condimentos = condimentos;
  }
  
  @Pure
  public String getExplicacionDeLaPreparacion() {
    return this.explicacionDeLaPreparacion;
  }
  
  public void setExplicacionDeLaPreparacion(final String explicacionDeLaPreparacion) {
    this.explicacionDeLaPreparacion = explicacionDeLaPreparacion;
  }
  
  @Pure
  public int getCaloriasReceta() {
    return this.caloriasReceta;
  }
  
  public void setCaloriasReceta(final int caloriasReceta) {
    this.caloriasReceta = caloriasReceta;
  }
  
  @Pure
  public Temporada getTemporada() {
    return this.temporada;
  }
  
  public void setTemporada(final Temporada temporada) {
    this.temporada = temporada;
  }
}
