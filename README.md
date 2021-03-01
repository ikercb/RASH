# Random Average Shifted Histogram

Implementation in R of the new density estimator proposed in:

M. Bourel, R. Fraiman, and B. Ghattas. 2014. Random average shifted histograms. Comput. Stat. Data Anal. 79 (November, 2014), 149–164. DOI: https://doi.org/10.1016/j.csda.2014.05.004

### Function

The function has the following inputs:

- x: a vector of values for which the histogram is desired. The current version can only handle 1D data.  
- M: integer, number of histograms that are aggregated.  
- h: numeric, bin width of the histograms.
- distribution: string, it is possible to choose between a uniform distribution U[-h,h] or a gaussian N(0,h^2)  

The output is an object of class "histogram".
