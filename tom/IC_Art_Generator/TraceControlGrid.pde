class TraceControlGrid
{
  Grid grid;
  int boolean_control_grid[][];
  
  TraceControlGrid(Grid grid)
  {
    this.grid = new Grid(grid);
    boolean_control_grid = new int[width/grid.getSize()][width/grid.getSize()];
  }
}
