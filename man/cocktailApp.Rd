% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cocktailApp.r
\name{cocktailApp}
\alias{cocktailApp}
\title{cocktailApp .}
\usage{
cocktailApp(page_title = "Drink Schnauzer", enableBookmarking = "url")
}
\arguments{
\item{page_title}{an optional page title for the app. A \code{NULL} value
causes no page title to be used.}

\item{enableBookmarking}{Can be one of \code{"url"}, \code{"server"}, or
\code{"disable"}. The default value, \code{NULL}, will respect the setting from
any previous calls to  \code{\link[shiny:enableBookmarking]{enableBookmarking()}}. See \code{\link[shiny:enableBookmarking]{enableBookmarking()}}
for more information on bookmarking your app.}
}
\value{
Runs the \code{shiny} app.
}
\description{
A \code{shiny} app to explore cocktails. The app allows you to enter ingredients
that a cocktail must have, or ingredients that it must not have. One can
filter by number of ingredients, minimum rating, minimum \sQuote{t stat}
(computed as the rating minus the T stat zero all multiplied by the square
root of the number of ratings). One can also search for cocktail by regex.

In the main tab, titled \dQuote{drinks}, one can find a table with the
summaries of matching cocktails. Selecting rows of this table will
cause the cocktail table below to be populated with more details on each
selected cocktail. Selecting rows will also populate the bar chart
in the \dQuote{plots} tab.

If two or more ingredients are selected, drinks with non-zero quantities
of both of these will be shown in a ternary plot in the \dQuote{tern}
tab. 

In the \dQuote{other} tab is a table with common co-ingredients of the
selected ingredients. A co-ingredient is an ingredient that commonly
occurs with the selected ingredient, as measured by the number of
cocktails, and by \sQuote{rho}, which is like a correlation based
on the proportion.

A checkbox labelled, \dQuote{Hobson's Choice} allows you to populate
the cocktail table with five random cocktails that meet the numerical
filters on number of ingredients, rating, and so on, but which do not
meet the ingredient selections. Unselecting and re-selecting the
checkbox selects a new set of random cocktails. Note that the random
selection is not responsive to changes in the numerical filters.
}
\section{Screenshots}{


The main page looks as follows. In this case the user has selected
two ingredients, \sQuote{Benedictine} and \sQuote{Bourbon}. The
user has modified some of the numeric filters resulting in only
six cocktails in the cocktail table on the right in the main
tab.

\if{html}{
\figure{Screenshot-mainpage.png}{options: width="100\%" alt="Screenshot: landing page of app"}
}
\if{latex}{
\figure{Screenshot-mainpage.png}{options: width=14cm}
}

In the next screenshot, the user has selected two of
the rows of the cocktail table,
which causes the ingredients table
on the lower right to be populated with the recipes of the
selected cocktails. Instead one could click on the linked
cocktail names to be taken to the upstream source of the recipe,
which is recommended since those pages typically have better
instructions.

\if{html}{
\figure{Screenshot-ingredients.png}{options: width="100\%" alt="Screenshot: landing page of app, with selected cocktails"}
}
\if{latex}{
\figure{Screenshot-ingredients.png}{options: width=14cm}
}

In the following screenshot, the user has selected two ingredients,
\sQuote{Benedictine} and \sQuote{bourbon}, then clicked on the
the main table, then selected the \sQuote{plots} tab. This
shows a bar plot of the proportions of all ingredients
in all the selected cocktails.

\if{html}{
\figure{Screenshot-barplot.png}{options: width="100\%" alt="Screenshot: bar plot of ingredients"}
}
\if{latex}{
\figure{Screenshot-barplot.png}{options: width=14cm}
}

In this screenshot, the user has selected two ingredients,
\sQuote{Benedictine} and \sQuote{bourbon}, then clicked on the
\sQuote{ternary} tab, which shows a ternary plot of the proportions
of cocktails with non-zero proportions of the first two selected
ingredients. The third dimension of the ternary plot is \sQuote{other}
ingredients.

\if{html}{
\figure{Screenshot-ternary.png}{options: width="100\%" alt="Screenshot: ternary plot of ingredients"}
}
\if{latex}{
\figure{Screenshot-ternary.png}{options: width=14cm}
}

In this screenshot, the user has checked the \dQuote{Hobson's Choice}
box, which adds 5 random cocktails to the cocktail table.

\if{html}{
\figure{Screenshot-hobsons.png}{options: width="100\%" alt="Screenshot: main page with Hobsons choice"}
}
\if{latex}{
\figure{Screenshot-hobsons.png}{options: width=14cm}
}
}

\examples{
\dontrun{
cocktailApp()
}
}
\author{
Steven E. Pav \email{shabbychef@gmail.com}
}
\keyword{shiny}
