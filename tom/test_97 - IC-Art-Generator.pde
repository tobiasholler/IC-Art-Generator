int Grid_Dense;
int Grid_Size;
Chip chip;

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  
  Grid_Dense = 10;
  Grid_Size = ((width+height)/2)/Grid_Dense;
  
  chip = new Chip(Grid_Dense*25, Grid_Dense*25, Grid_Dense*5, Grid_Dense*5);
  chip.setRefGrid(Grid_Dense, Grid_Size);
  chip.initKP();
}

void draw()
{
  background(255);
  
  drawGrid(Grid_Size, Grid_Dense);
  
  chip.show();
  chip.show_KP();
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
