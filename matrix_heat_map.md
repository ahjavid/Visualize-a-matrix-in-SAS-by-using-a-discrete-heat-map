**Problem 1.** A fixed one-way treatment structure in a RCBD with 3
levels and with 5 reps.

a.  Univariate notation

$$y_{ij} = \mu + \alpha_{i} + \beta_{j} + e_{ij}$$

$i = 1,\ 2,\ 3$ $j = 1,\ 2,\ \ldots,\ 5$

$e_{ij}\sim N(0,\sigma_{e}^{2})$ $\beta_{j}\sim N(0,\sigma_{b}^{2})$

$$var(y_{ij}) = var(\mu + \alpha_{i} + \beta_{j} + e_{ij})$$

But $\alpha_{i},\ \beta_{j},and\ e_{ij}$ are mutually independent.

$$var(y_{ij}) = var(\mu) + {var(\alpha}_{i}) + var(\beta_{j}) + {var(e}_{ij})$$

$$\mu\ and\ \alpha_{i}\ are\ fixed,\ var(\mu) = var\left( \alpha_{i} \right) = 0$$

$$var\left( y_{ij} \right) = \sigma_{b}^{2} + \sigma_{e}^{2}$$

$$var({\overline{y}}_{i.}) = var(\mu + \alpha_{i} + {\overline{\beta}}_{.} + {\overline{e}}_{i.})$$

$$var\left( {\overline{y}}_{i.} \right) = var\left( {\overline{\beta}}_{.} \right) + var({\overline{e}}_{i.})$$

$$var\left( {\overline{y}}_{i.} \right) = \frac{\sigma_{b}^{2}}{5} + \frac{\sigma_{e}^{2}}{5}$$

**\
**

b.  For t = 3, N= 5, var(β) = 12, var(e) = 3 the heatmaps for X, Z, G,
    R, and var(y) are shown below:

**SAS code**

**proc** **iml** ;

X = j(**3**, **1**, **1**)@j(**5**, **1**, **1**)\|\|I(**3**)@j(**5**,
**1**, **1**);

Z = j(**3**, **1**, **1**)@I(**5**) ;

G = **12**\*I(**5**) ;

R = **3**\*I(**15**) ;

var_y = **12**\*(j(**3**, **3**, **1**)@I(**5**))+**3**\*I(**15**) ;

**run** WriteMatrixInLongForm(X, \"X\");

**run** WriteMatrixInLongForm(Z, \"Z\");

**run** WriteMatrixInLongForm(G, \"G\");

**run** WriteMatrixInLongForm(R, \"R\");

**run** WriteMatrixInLongForm(var_y, \"VARy\");

**quit** ;

title \"Problem 1 - Heatmap for X\";

**proc** **sgrender** data=X template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 1 - Heatmap for Z\";

**proc** **sgrender** data=Z template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 1 - Heatmap for G\";

**proc** **sgrender** data=G template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 1 - Heatmap for R\";

**proc** **sgrender** data=R template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 1 - Heatmap for Var(y)\";

**proc** **sgrender** data=VARy template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

Problem 1 - Heatmap for X

![](./images//media/image1.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 1 - Heatmap for Z

![](./images//media/image2.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 1 - Heatmap for G

![](./images//media/image3.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 1 - Heatmap for R

![](./images//media/image4.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 1 - Heatmap for Var(y)

![](./images//media/image5.png){width="5.000694444444444in"
height="3.7534722222222223in"}

**Problem 2.** 2 x 3 factorial treatment structure (A is fixed and B is
random) in a CRD with 10 reps.

a.  Univariate notation

$$y_{ijk} = \mu + \alpha_{i} + b_{j} + {(\alpha b)}_{ij} + e_{ijk}$$

$i = 1,\ 2\ $ $j = 1,\ 2,\ 3$ $k = 1,\ 2,\ \ldots,\ 10$

$e_{ijk}\sim N(0,\sigma_{e}^{2})$ $b_{j}\sim N(0,\sigma_{b}^{2})$
${\alpha b}_{ij}\sim N(0,\sigma_{\alpha b}^{2})$

$$var(y_{ijk}) = var(\mu + \alpha_{i} + b_{j} + {(\alpha b)}_{ij} + e_{ijk})$$

But $\alpha_{i},\ b_{j},{(\alpha b)}_{ij},\ and\ e_{ijk}$ are mutually
independent.

$$var(y_{ijk}) = var(\mu) + {var(\alpha}_{i}) + var(b_{j}) + var({(\alpha b)}_{ij}) + {var(e}_{ijk})$$

$$\mu\ and\ \alpha_{i}\ are\ fixed,\ var(\mu) = var\left( \alpha_{i} \right) = 0$$

$$var\left( y_{ijk} \right) = \sigma_{b}^{2} + \sigma_{\alpha b}^{2} + \sigma_{e}^{2}$$

$$var({\overline{y}}_{i..}) = var(\mu + \alpha_{i} + {\overline{b}}_{.} + {(\overline{\alpha b})}_{i.} + {\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i..} \right) = var\left( {\overline{b}}_{.} \right) + var{((\overline{\alpha b})}_{i.}) + var({\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i.} \right) = \frac{\sigma_{b}^{2}}{3} + \frac{\sigma_{\alpha b}^{2}}{3} + \frac{\sigma_{e}^{2}}{30}$$

b.  For a = 2, b = 3, N = 10, var(B) = 15, var(AB) = 4, var(e) = 6 the
    heatmaps for X, Z, G, R, and var(y) are shown below:

**SAS code**

**proc** **iml** ;

X = j(**2**, **1**, **1**)@j(**3**, **1**, **1**)@j(**10**, **1**,
**1**)\|\|I(**2**)@j(**3**, **1**, **1**)@j(**10**, **1**, **1**) ;

Z = j(**2**, **1**, **1**)@I(**3**)@j(**10**, **1**,
**1**)\|\|I(**2**)@I(**3**)@j(**10**, **1**, **1**) ;

G = BLOCK(**15**\*I(**3**), **4**\*I(**6**));

R = **6**\*I(**60**) ;

var_y = Z\*G\*Z\` + R ;

**run** WriteMatrixInLongForm(X, \"X\");

**run** WriteMatrixInLongForm(Z, \"Z\");

**run** WriteMatrixInLongForm(G, \"G\");

**run** WriteMatrixInLongForm(R, \"R\");

**run** WriteMatrixInLongForm(var_y, \"VARy\");

**quit** ;

title \"Problem 2 - Heatmap for X\";

**proc** **sgrender** data=X template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 2 - Heatmap for Z\";

**proc** **sgrender** data=Z template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 2 - Heatmap for G\";

**proc** **sgrender** data=G template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 2 - Heatmap for R\";

**proc** **sgrender** data=R template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 2 - Heatmap for Var(y)\";

**proc** **sgrender** data=VARy template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

Problem 2 - Heatmap for X

![](./images//media/image6.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 2 - Heatmap for Z

![](./images//media/image7.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 2 - Heatmap for G

![](./images//media/image8.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 2 - Heatmap for R

![](./images//media/image9.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 2 - Heatmap for Var(y)

![](./images//media/image10.png){width="5.000694444444444in"
height="3.7534722222222223in"}

**Problem 3.** 2 x 3 factorial treatment structure (A is random and B is
random) in a CRD with 10 reps.

a.  Univariate notation

$$y_{ijk} = \mu + \alpha_{i} + b_{j} + {(\alpha b)}_{ij} + e_{ijk}$$

$i = 1,\ 2\ $ $j = 1,\ 2,\ 3$ $k = 1,\ 2,\ \ldots,\ 10$

$e_{ijk}\sim N\left( 0,\sigma_{e}^{2} \right)\ \ \ a_{i}\sim N(0,\sigma_{a}^{2})$
$b_{j}\sim N(0,\sigma_{b}^{2})$
${\alpha b}_{ij}\sim N(0,\sigma_{ab}^{2})$

$$var(y_{ijk}) = var(\mu + a_{i} + b_{j} + {(\alpha b)}_{ij} + e_{ijk})$$

But $a_{i},\ b_{j},{(ab)}_{ij},\ and\ e_{ijk}$ are mutually independent.

$$var(y_{ijk}) = var(\mu) + {var(a}_{i}) + var(b_{j}) + var({(ab)}_{ij}) + {var(e}_{ijk})$$

$$\mu\ and\ \alpha_{i}\ are\ fixed,\ var(\mu) = 0$$

$$var\left( y_{ijk} \right) = \sigma_{a}^{2} + \sigma_{b}^{2} + \sigma_{ab}^{2} + \sigma_{e}^{2}$$

$$var({\overline{y}}_{i..}) = var(\mu + a_{i} + {\overline{b}}_{.} + {(\overline{ab})}_{i.} + {\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i..} \right) = var\left( {\overline{a}}_{.} \right) + var\left( {\overline{b}}_{.} \right) + var{((\overline{ab})}_{i.}) + var({\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i.} \right) = \sigma_{a}^{2} + \frac{\sigma_{b}^{2}}{3} + \frac{\sigma_{ab}^{2}}{3} + \frac{\sigma_{e}^{2}}{30}$$

b.  For a = 2, b = 3, N = 10, var(A) = 20, var(B) = 15, var(AB) = 4,
    var(e) = 6 the heatmaps for X, Z, G, R, and var(y) are shown below:

**SAS code**

**proc** **iml** ;

X = j(**2**, **1**, **1**)@j(**3**, **1**, **1**)@j(**10**, **1**,
**1**) ;

Z = I(**2**)@j(**3**, **1**, **1**)@j(**10**, **1**, **1**)\|\|j(**2**,
**1**, **1**)@I(**3**)@j(**10**, **1**,
**1**)\|\|I(**2**)@I(**3**)@j(**10**, **1**, **1**) ;

G = BLOCK(**20**\*I(**2**),**15**\*I(**3**),**4**\*I(**6**));

R = **6**\*I(**60**) ;

var_y = Z\*G\*Z\` + R ;

**run** WriteMatrixInLongForm(X, \"X\");

**run** WriteMatrixInLongForm(Z, \"Z\");

**run** WriteMatrixInLongForm(G, \"G\");

**run** WriteMatrixInLongForm(R, \"R\");

**run** WriteMatrixInLongForm(var_y, \"VARy\");

**quit** ;

title \"Problem 3 - Heatmap for X\";

**proc** **sgrender** data=X template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 3 - Heatmap for Z\";

**proc** **sgrender** data=Z template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 3 - Heatmap for G\";

**proc** **sgrender** data=G template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 3 - Heatmap for R\";

**proc** **sgrender** data=R template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 3 - Heatmap for Var(y)\";

**proc** **sgrender** data=VARy template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

Problem 3 - Heatmap for X

![](./images//media/image11.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 3 - Heatmap for Z

![](./images//media/image12.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 3 - Heatmap for G

![](./images//media/image13.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 3 - Heatmap for R

![](./images//media/image9.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 3 - Heatmap for Var(y)

![](./images//media/image14.png){width="5.000694444444444in"
height="3.7534722222222223in"}

**Problem 4.** 2 x 3 factorial treatment structure (A is fixed and B is
fixed) in a CRD with 4 reps.

a.  Univariate notation

$$y_{ijk} = \mu + \alpha_{i} + \beta_{j} + {(\alpha\beta)}_{ij} + d_{k(i)} + e_{ijk}$$

$i = 1,\ 2\ $ $j = 1,\ 2,\ 3$ $k = 1,\ 2,\ 3,\ 4$

$e_{ijk}\sim N\left( 0,\sigma_{e}^{2} \right)\ \ $
$d_{k(i)}\sim N(0,\sigma_{d}^{2})$

$$var(y_{ijk}) = var(\mu + \alpha_{i} + \beta_{j} + {(\alpha\beta)}_{ij} + d_{k(i)} + e_{ijk})$$

But
$\alpha_{i},\ \beta_{j},{(\alpha\beta)}_{ij},d_{k(i)},\ and\ e_{ijk}$
are mutually independent.

$$var(y_{ijk}) = var(\mu) + {var(\alpha}_{i}) + var(\beta_{j}) + var({(\alpha\beta)}_{ij}) + var(d_{k(i)}) + {var(e}_{ijk})$$

$$\mu,\ \alpha_{i},\ \beta_{j},\ and{(\alpha\beta)}_{ij}\ are\ fixed,\ var = 0$$

$$var\left( y_{ijk} \right) = \sigma_{d}^{2} + \sigma_{e}^{2}$$

$$var({\overline{y}}_{i..}) = var(\mu + \alpha_{i} + {\overline{\beta}}_{.} + {(\overline{\alpha\beta})}_{i.} + {\overline{d}}_{.(i)} + {\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i..} \right) = var{(\overline{d}}_{.(i)}) + var({\overline{e}}_{i..})$$

$$var\left( {\overline{y}}_{i.} \right) = \frac{\sigma_{d}^{2}}{4} + \frac{\sigma_{e}^{2}}{12}$$

b.  For a = 2, b = 3, N = 4, var(WP) = 5, var(SP) = 2 the heatmaps for
    X, Z, G, R, and var(y) are shown below:

**SAS code**

**proc** **iml** ;

X = j(**2**, **1**, **1**)@j(**3**, **1**, **1**)@j(**4**, **1**,
**1**)\|\|I(**2**)@j(**3**, **1**, **1**)@j(**4**, **1**,
**1**)\|\|j(**2**, **1**, **1**)@I(**3**)@j(**4**, **1**,
**1**)\|\|I(**2**)@I(**3**)@j(**4**, **1**, **1**) ;

Z = I(**2**)@j(**3**, **1**, **1**)@I(**4**) ;

G = **2**\*I(**8**);

R = **5**\*I(**24**) ;

var_y = Z\*G\*Z\` + R ;

**run** WriteMatrixInLongForm(X, \"X\");

**run** WriteMatrixInLongForm(Z, \"Z\");

**run** WriteMatrixInLongForm(G, \"G\");

**run** WriteMatrixInLongForm(R, \"R\");

**run** WriteMatrixInLongForm(var_y, \"VARy\");

**quit** ;

title \"Problem 4 - Heatmap for X\";

**proc** **sgrender** data=X template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 4 - Heatmap for Z\";

**proc** **sgrender** data=Z template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 4 - Heatmap for G\";

**proc** **sgrender** data=G template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 4 - Heatmap for R\";

**proc** **sgrender** data=R template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

title \"Problem 4 - Heatmap for Var(y)\";

**proc** **sgrender** data=VARy template=HeatmapDisc;

dynamic \_X=\"col\" \_Y=\"row\" \_Z=\"X\";

**run**;

**quit**;

Problem 4 - Heatmap for X

![](./images//media/image15.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 4 - Heatmap for Z

![](./images//media/image16.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 4 - Heatmap for G

![](./images//media/image17.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 4 - Heatmap for R

![](./images//media/image18.png){width="5.000694444444444in"
height="3.7534722222222223in"}

Problem 4 - Heatmap for Var(y)

![](./images//media/image19.png){width="5.000694444444444in"
height="3.7534722222222223in"}
