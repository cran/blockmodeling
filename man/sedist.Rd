% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sedist.R
\encoding{UTF-8}
\name{sedist}
\alias{sedist}
\title{Computes distances in terms of Structural equivalence (Lorrain & White, 1971)}
\usage{
sedist(
  M,
  method = "default",
  fun = "default",
  fun.on.rows = "default",
  handle.interaction = "switch",
  use = "pairwise.complete.obs",
  ...
)
}
\arguments{
\item{M}{A matrix representing the (usually valued) network. For now, only one-relational networks are supported. The network must be one-mode.}

\item{method}{The method used to compute distances - any of the methods allowed by functions dist, \code{"cor"} or \code{"cov"} (all \code{package::stats}) or just \code{"cor"} or \code{"cov"} (given as a character).}

\item{fun}{Which function should be used to compute distances (given as a character).}

\item{fun.on.rows}{For non-standard function - does the function compute measure on rows (such as \code{"cor"}, \code{"cov"},...) of the data matrix (as opposed to computing measure on columns (such as \code{dist}).}

\item{handle.interaction}{How should the interaction between the vertices analysed be handled:\cr
\code{"switch"} (the default) - assumes that when comparing units i and j, M[i,i] should be compared with M[j,j] and M[i,j] with M[j,i]. These two comparisons are weighted by 2. This should be used with Euclidean distance to get the corrected Euclidean distance with p = 2.\cr
\code{"switch2"} - the same (alias)\cr
\code{"switch1"} - the same as above, only that the two comparisons are weighted by 1. This should be used with Euclidean distance to get the corrected Wuclidean distance with p = 1.\cr
\code{"ignore"} (diagonal) - Diagonal is ignored. This should be used with Euclidean distance to get the corrected Euclidean distance with p = 0.\cr
\code{"none"} - the matrix is used "as is"}

\item{use}{For use with methods \code{"cor"} and \code{"cov"}, for other methods (the default option should be used if \code{handle.interaction == "ignore"}), \code{"pairwise.complete.obs"} are always used, if \code{stats.dist.cor.cov = TRUE}.}

\item{\dots}{Additional arguments to \code{fun}}
}
\value{
A matrix (usually of class dist) is returned.
}
\description{
The functions compute the distances in terms of Structural equivalence (Lorrain and White, 1971) between the units of a one-mode network.
Several options for treating the diagonal values are supported.
}
\details{
If both \code{method} and \code{fun} are \code{"default"}, the Euclidean distances are computed.
The \code{"default"} method for \code{fun = "dist"} is "euclidean" and for \code{fun  = "cor"} "pearson".
}
\examples{
# Generating a simple network corresponding to the simple Sum of squares
# Structural equivalence with blockmodel:
# null com
# null null
n <- 20
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(5, 15))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

D <- sedist(M = net)
plot.mat(net, clu = cutree(hclust(d = D, method = "ward"), k = 2))

}
\references{
Batagelj, V., Ferligoj, A., & Doreian, P. (1992). Direct and indirect methods for structural equivalence. Social Networks, 14(1-2), 63-90. doi: 10.1016/0378-8733(92)90014-X

Lorrain, F., & White, H. C. (1971). Structural equivalence of individuals in social networks. Journal of Mathematical Sociology, 1(1), 49-80. doi: 10.1080/0022250X.1971.9989788
}
\seealso{
\code{\link{dist}}, \code{\link{hclust}}, \code{\link{REGE}}, \code{\link{optParC}}, \code{\link{optParC}}, \code{\link{optRandomParC}}
}
\author{
\enc{Aleš Žiberna}{Ales Ziberna}
}
\keyword{cluster}
\keyword{graphs}
