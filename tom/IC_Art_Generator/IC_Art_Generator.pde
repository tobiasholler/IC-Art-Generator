int Grid_Ref_Dense;
Chip chip;
Grid grid;

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  
  Grid_Ref_Dense = 15;
  grid = new Grid(Grid_Ref_Dense, (((width+height)/2)/Grid_Ref_Dense));
  chip = new Chip(grid.getDense()*25, grid.getDense()*25, grid.getDense()*5, grid.getDense()*5);
  chip.setRefGrid(grid.getDense(), grid.getSize());
  chip.initKP();
}

void draw()
{
  background(255);
  
  grid.show();
  chip.show_All();
}

void drawGrid(int GridSize, int GridDense)
{
  for(int i = 0; i < GridSize; i++)
  {
    for(int j = 0; j < GridSize; j++)
    {
      point(i*GridDense, j*GridDense);
    }
  }
}
