class Chip
{
  PVector pos;
  PVector kontaktpunkt[]; // == kp
  Grid grid;
  int chip_width;
  int chip_height;
  int kp_pro_chipseite;
  Trace trace[];
  
  Chip(int x, int y, int chip_width, int chip_height)
  {
    this.pos = new PVector(x, y);
    this.chip_width = chip_width;
    this.chip_height = chip_height;
    
    //Just to be safe
    this.grid = new Grid(0, 0);
    this.kp_pro_chipseite = 0;
    this.trace = new Trace[kp_pro_chipseite*4];
  }
  
  //Eingabe eines Referenzgrids für klasseninterne Berechnungen
  void setRefGrid(int Grid_Dense, int Grid_Size)
  {
    this.grid.setGridParameter(Grid_Dense, Grid_Size);
  }
  
  //Init Kontaktpunkte
  void initKP()
  {
    kp_pro_chipseite = (chip_width/grid.getDense())-1;
    kontaktpunkt = new PVector[kp_pro_chipseite*4];
    
    for(int i = 0; i < kp_pro_chipseite; i++)
    {
      for(int j = 0; j < kp_pro_chipseite; j++)
      {
        switch(i)
        {
          case 0:
            //Oben
            kontaktpunkt[i*4+j] = new PVector(pos.x+grid.getDense()*(j+1), pos.y);
            break;
          case 1:
            //Unten
            kontaktpunkt[i*4+j] = new PVector(pos.x+grid.getDense()*(j+1), pos.y+chip_height);
            break;
          case 2:
            //Links
            kontaktpunkt[i*4+j] = new PVector(pos.x, pos.y+grid.getDense()*(j+1));
            break;
          case 3:
            //Rechts
            kontaktpunkt[i*4+j] = new PVector(pos.x+chip_width, pos.y+grid.getDense()*(j+1));
            break;
        }
      }
    }
  }
  
  //Initiiere die Traces/Spuren
  void initT()
  {
    for(int i = 0; i < trace.length; i++)
    {
      trace[i] = new Trace(kontaktpunkt[i], 10, i);
    }
  }
  
  //Zeig mir alles
  void show_All()
  {
    show_C();
    show_KP();
    show_T();
  }
  
  //Zeig mir den Chip
  void show_C(){ rect(pos.x, pos.y, chip_width, chip_height); }
  //Zeig mir die Kontaktpunkte
  void show_KP(){ for(PVector pv : kontaktpunkt){ ellipse(pv.x, pv.y, grid.getDense()/2, grid.getDense()/2); } }
  //Zeig mir die Traces/Spuren
  void show_T(){ for(Trace t : trace){ t.show(); } }
}
