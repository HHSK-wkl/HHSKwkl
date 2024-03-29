% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/02_dataframe_utils.R
\name{add_jaar_maand}
\alias{add_jaar_maand}
\alias{add_jaar}
\alias{add_maand}
\title{Jaar en maand toevoegen}
\usage{
add_jaar_maand(df, datum = "datum")

add_jaar(df, datum = "datum")

add_maand(df, datum = "datum")
}
\arguments{
\item{df}{Een dataframe waar de kolommen aan toegevoegd moeten worden.}

\item{datum}{Een character-string met naam van de datum kolom. Default is \code{"datum"}}
}
\value{
De dataframe met een extra kolom \code{jaar} en/of \code{maand}. Beide kolommen zijn integers.
}
\description{
Voeg kolommen toe met het jaar en/of de maand op basis van de datum. De datumkolom moet een datumformaat hebben.
}
\section{Functions}{
\itemize{
\item \code{add_jaar_maand()}: Voeg twee kolommen toe met het jaar en de maand.

\item \code{add_jaar()}: Voeg een kolom toe met het jaar.

\item \code{add_maand()}: Voeg een kolom toe met de maand.

}}
\examples{

\dontrun{

data \%>\% add_jaar_maand()

data \%>\% add_jaar()

data \%>\% add_maand()
}
}
