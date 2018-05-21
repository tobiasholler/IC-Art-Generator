class TraceControlGrid
{
  Grid grid;
  int trace_control_grid[][];
  
  TraceControlGrid(Grid grid)
  {
    this.grid = new Grid(grid);
    //Nummeriert von -1 für Frei bis +Unendlich
    trace_control_grid = new int[width/grid.getSize()][width/grid.getSize()];
  }
  
  void show()
  {
    for(int i = 0; i < width/grid.getDense(); i++)
    {
      for(int j = 0; j < width/grid.getDense(); j++)
      {
        fill(0);
        text(char(-1), i*grid.getDense()+2, j*grid.getDense()-5);
        fill(255);
      }
    }
  }
}
