int grid_ref_dense;
Chip chip;
Grid grid;
TraceControlGrid trace_control_grid;

void setup()
{
  size(800, 800);
  background(255);
  noSmooth();
  
  grid_ref_dense = 15;
  grid = new Grid(grid_ref_dense, width/grid_ref_dense);
  chip = new Chip(grid.getDense()*25, grid.getDense()*25, grid.getDense()*5, grid.getDense()*5);
  chip.setRefGrid(grid.getDense(), grid.getSize());
  chip.initKP();
  trace_control_grid = new TraceControlGrid(grid);
}

void draw()
{
  background(255);
  
  grid.show();
  chip.show_All();
  trace_control_grid.show();
}
