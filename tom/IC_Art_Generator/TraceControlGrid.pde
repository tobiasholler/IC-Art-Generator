class TraceControlGrid
{
  private Grid grid;
  private  int trace_control_grid[][];
  
  public TraceControlGrid(Grid grid)
  {
    this.grid = new Grid(grid);
    //Nummeriert von -1 für Frei bis +Unendlich
    trace_control_grid = new int[width/grid.getDense()][height/grid.getDense()];
    for(int i = 0; i < trace_control_grid.length; i++)
    {
      for(int j = 0; j < trace_control_grid[i].length; j++)
      {
        trace_control_grid[i][j] = -1;
      }
    }
  }
  
  public void setPointInTCG(int x, int y, int new_point_value)
  {
    //Passen die x und y Koordinaten zum TCG, wenn ja, mach weiter
    if(x >= 0 && x < trace_control_grid.length && y >= 0 && y < trace_control_grid[0].length)
    {
      trace_control_grid[x][y] = new_point_value;
    }
    else
    {
      println("TCG: setPointInTCG: OUT OF RANGE");
      println(x, y);
    }
  }
  
  public int getDense(){ return this.grid.getDense(); }
  public int getSize(){ return this.grid.getSize(); }
  public Grid getGrid(){ return this.grid; }
  
  public void show()
  {
    textSize(9);
    for(int i = 0; i < trace_control_grid.length; i++)
    {
      for(int j = 0; j < trace_control_grid[i].length; j++)
      {
        if(trace_control_grid[i][j] == -1)
        {
          fill(0);
          text(trace_control_grid[i][j], i*grid.getDense()+5, j*grid.getDense()+10);
          fill(255);
        }
        else
        {
          fill(0, 0, 255);
          text(trace_control_grid[i][j], i*grid.getDense()+5, j*grid.getDense()+10);
          fill(255);
        }        
      }
    }
  }
}
