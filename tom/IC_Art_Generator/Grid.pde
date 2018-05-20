class Grid
{
  int grid_dense;
  int grid_size;
  
  Grid(int Grid_Dense, int Grid_Size)
  {
    this.grid_dense = Grid_Dense;
    this.grid_size = Grid_Size;
  }
  
  Grid(Grid grid)
  {
    this.grid_dense = grid.getDense();
    this.grid_size = grid.getSize();
  }
  
  void setGridParameter(int Grid_Dense, int Grid_Size)
  {
    this.grid_dense = Grid_Dense;
    this.grid_size = Grid_Size;
  }
  
  int getDense(){ return grid_dense; }
  int getSize(){ return grid_size; }
  
  void show()
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
