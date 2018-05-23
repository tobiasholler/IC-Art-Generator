class Grid
{
  private int grid_dense;
  private int grid_size;
  
  public Grid(int Grid_Dense, int Grid_Size)
  {
    this.grid_dense = Grid_Dense;
    this.grid_size = Grid_Size;
  }
  
  public Grid(Grid grid)
  {
    this.grid_dense = grid.getDense();
    this.grid_size = grid.getSize();
  }
  
  public void setGridParameter(int Grid_Dense, int Grid_Size)
  {
    this.grid_dense = Grid_Dense;
    this.grid_size = Grid_Size;
  }
  
  public int getDense(){ return grid_dense; }
  public int getSize(){ return grid_size; }
  
  public void show()
  {
    for(int i = 0; i < grid_size; i++)
  {
    for(int j = 0; j < grid_size; j++)
    {
      point(i*grid_dense, j*grid_dense);
    }
  }
  }
}
