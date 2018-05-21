class TraceControlGrid
{
  Grid grid;
  int trace_control_grid[][];
  
  TraceControlGrid(Grid grid)
  {
    this.grid = new Grid(grid);
    //Nummeriert von -1 für Frei bis +Unendlich
    trace_control_grid = new int[width/grid.getDense()][width/grid.getDense()];
    for(int i = 0; i < trace_control_grid.length; i++)
    {
      for(int j = 0; j < trace_control_grid[i].length; j++)
      {
        trace_control_grid[i][j] = -1;
      }
    }
  }
  
  void show()
  {
    textSize(9);
    for(int i = 0; i < trace_control_grid.length; i++)
    {
      for(int j = 0; j < trace_control_grid[i].length; j++)
      {
        fill(0);
        text(trace_control_grid[i][j], i*grid.getDense(), j*grid.getDense()+10);
        fill(255);
      }
    }
  }
}
