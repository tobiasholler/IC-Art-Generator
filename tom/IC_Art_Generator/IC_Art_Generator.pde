int grid_ref_dense;
Chip chip;
Chip chip2;
Grid grid;
TraceControlGrid tcg;

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  //noLoop();
  
  grid_ref_dense = 25;
  grid = new Grid(grid_ref_dense, width/grid_ref_dense);
  tcg = new TraceControlGrid(grid);
  chip = new Chip(tcg.getDense()*10, tcg.getDense()*15, tcg.getDense()*5, tcg.getDense()*7, tcg);
  chip2 = new Chip(tcg.getDense()*20, tcg.getDense()*5, tcg.getDense()*6, tcg.getDense()*3, tcg);
}

void draw()
{
  background(255);
  
  chip.show_All(tcg);
  chip2.show_All(tcg);
  grid.show();
  tcg.show();
  
  //chip.genTrace(tcg);
}
