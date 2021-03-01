#Random Average Shifted Histogram
#Inputs: data - x, bin width - h, number of averaged histograms - M
#It can be chosen between two distributions:
#1 - "Uniform": Uniform[-h,h]
#2 - "Gaussian": Gaussian N(mean = 0, sigma = h)
RASH <- function(x, h, M, distribution){
  #Initial Histogram
  t0 <- min(x) - h/10             
  L <- ceiling( (max(x) - t0)/h )
  #Initalize new grid
  if(distribution == "Uniform"){
    starts <- t0 - runif(M, min = -h, max = h)
  } else if(distribution == "Gaussian"){
    starts <- t0 - rnorm(M, mean = 0, sd = h)
  }
  b <- c()
  for(i in 1:M){
    b <- c(b, seq(starts[i], starts[i] + L*h, h) )
  }
  b <- sort(b)
  x <- x[x > min(b) & x < max(b)]
  hist <- hist(x, breaks = b, plot = FALSE)
  hist$density <- rep(0, length(hist$density))
  # Average histograms
  for(i in 1:M){
    bi <- seq(starts[i], starts[i] + L*h, h)
    xi <- x[x > min(bi) & x < max(bi)]
    histI <- hist(xi, breaks = bi, plot = FALSE)
    count <- match(starts[i], b)
    for(j in 1:L){
      edge1 <- bi[j]
      edge2 <- bi[j+1]
      while(edge1 <= b[count] & b[count+1] <= edge2 & count < length(b)){
        hist$density[count] <- hist$density[count] + histI$density[j]
        count <- count + 1
      }
    }
  }
  hist$density <- hist$density/M
  return(hist)
}