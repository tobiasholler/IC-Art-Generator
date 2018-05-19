class Grid
{
  int Grid_Dense;
  int Grid_Size;
  
  Grid(int Grid_Dense, int Grid_Size)
  {
    this.Grid_Dense = Grid_Dense;
    this.Grid_Size = Grid_Size;
  }
  
  void setGridParameter(int Grid_Dense, int Grid_Size)
  {
    this.Grid_Dense = Grid_Dense;
    this.Grid_Size = Grid_Size;
  }
  
  int getDense(){ return Grid_Dense; }
  int getSize(){ return Grid_Size; }
  
  void show()
  {
    for(int i = 0; i < Grid_Size; i++)
  {
    for(int j = 0; j < Grid_Size; j++)
    {
      point(i*Grid_Dense, j*Grid_Dense);
    }
  }
  }
}
