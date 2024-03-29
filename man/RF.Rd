% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RF.R
\encoding{UTF-8}
\name{RF}
\alias{RF}
\title{Calculate the value of the Relative Fit function}
\usage{
RF(res, m = 10, loops = NULL)
}
\arguments{
\item{res}{An object returned by the function \code{optRandomParC}.}

\item{m}{The number of randomized networks for the estimation of the expected value of a criterion function. It has to be as high as possible. Defaults to 10.}

\item{loops}{Whether loops are treated the same as any other values or not.}
}
\value{
\itemize{
\item \code{RF} - The value of the Relative Fit function.
\item \code{err} - The value of a criterion function that is used for blockmodeling (for empirical network).
\item \code{rand.err} - A vector with the values of the criterion function that is used for blockmodeling (for randomized networks).
}
}
\description{
The function calculates the value of the Relative Fit function. Currently implemented only for one-relational one-mode or two-mode networks.
}
\details{
The function randomizes an empirical network to compute the value of the Relative Fit function.
The networks are randomized in such a way that the values on the links are randomly relocated. Other approaches to 
randomization also exist and might be more appropriate in some cases, see Cugmas et al. (2021).
}
\examples{
n <- 8 # If larger, the number of partitions increases 
# dramatically as does if we increase the number of clusters
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(3, 5))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

res <- optRandomParC(M = net, k = 2, rep = 10, approaches = "hom", homFun = "ss", blocks = "com")
RF(res = res, m = 100, loops = TRUE)
}
\references{
Cugmas, M., Žiberna, A., & Ferligoj, A. (2021). The Relative Fit measure for evaluating a blockmodel. Statistical Methods & Applications, 30(5), 1315-1335. \doi{10.1007/s10260-021-00595-1}
}
\seealso{
\code{optRandomParC}
}
\author{
Marjan Cugmas and Aleš Žiberna
}
