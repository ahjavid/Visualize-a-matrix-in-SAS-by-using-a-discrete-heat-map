DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
proc template;
define statgraph HeatmapDisc;
dynamic _X _Y _Z;
begingraph;
   layout overlay/ aspectratio=1  /* optional: for square matrices */
                  xaxisopts=(discreteopts=(tickvaluefitpolicy=THIN)
                             display=(line ticks tickvalues))
                  yaxisopts=(discreteopts=(tickvaluefitpolicy=THIN)
                             display=(line ticks tickvalues) reverse=true);
      heatmapparm x=_X y=_Y colorgroup=_Z / DISCRETEY=TRUE DISCRETEX=TRUE xbinaxis=false ybinaxis=false 
				  name="heatmap" primary=true display=ALL;
      discretelegend "heatmap";
   endlayout;
endgraph;
end;
run;

/* convert from wide to long format */
start WriteMatrixInLongForm(Y, DSName);
   Row = colvec( repeat(T(1:nrow(Y)), 1, ncol(Y)) );              /* row index */
   Col = colvec( repeat(1:ncol(Y), nrow(Y)) );                    /* col index */
   X = colvec(Y);
   create (DSName) var {"Row" "Col" "X"};             
   append;
   close (DSName);
finish;

run WriteMatrixInLongForm(X, "X");
run WriteMatrixInLongForm(Z, "Z");
run WriteMatrixInLongForm(G, "G");
run WriteMatrixInLongForm(R, "R");
run WriteMatrixInLongForm(var_y, "VARy");
quit;

title "Heatmap for X";
proc sgrender data=X template=HeatmapDisc;
   dynamic _X="col" _Y="row" _Z="X";
run;
title "Heatmap for Z";
proc sgrender data=Z template=HeatmapDisc;
   dynamic _X="col" _Y="row" _Z="X";
run;
title "Heatmap for G";
proc sgrender data=G template=HeatmapDisc;
   dynamic _X="col" _Y="row" _Z="X";
run;
title "Heatmap for R";
proc sgrender data=R template=HeatmapDisc;
   dynamic _X="col" _Y="row" _Z="X";
run;
title "Heatmap for Var(y)";
proc sgrender data=VARy template=HeatmapDisc;
   dynamic _X="col" _Y="row" _Z="X";
run;
quit;
