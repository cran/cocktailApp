# Copyright 2018 Steven E. Pav. All Rights Reserved.
# Author: Steven E. Pav

# This file is part of cocktailApp.
#
# cocktailApp is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cocktailApp is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with cocktailApp.  If not, see <http://www.gnu.org/licenses/>.

# env var:
# nb: 
# see also:
# todo:
# changelog: 
#
# Created: 2018.07.01
# Copyright: Steven E. Pav, 2018-2018
# Author: Steven E. Pav
# Comments: Steven E. Pav

# helpers#FOLDUP
set.char.seed <- function(str) {
	set.seed(as.integer(charToRaw(str)))
}
#UNFOLD

library(dplyr)
context("code runs at all")#FOLDUP
test_that("shiny bits",{#FOLDUP
	# travis only?
	#skip_on_cran()

	utils::data("cocktails", package="cocktailApp")
	indat <- cocktails

	recipe_df <- .add_id(indat)
	cocktail_df <- .distill_info(recipe_df)

	both <- list(recipe=recipe_df %>% dplyr::select(-cocktail,-rating,-votes,-url),cocktail=cocktail_df)

	both2 <- .filter_ingredients(both,name_regex='sazerac',must_have_ing=c('Bourbon','Averna'),
															 must_not_have_ing=c(),
															 logical_sense='OR')

	two_ing <- c('Bourbon','Averna')
	both3 <- .filter_num_ingredients(both2,must_have_ing=two_ing,min_rating=2,max_ingr=10,max_other_ingr=5)
	both4 <- .filter_tstat(both3,min_t=2,t_zero=1)
	both5 <- .filter_src(both4,from_sources=c('diffordsguide'))
	both6 <- .add_description(both5)

	tbl <- .drinks_table(both6)
	merged <- .merge_both(both6)

	# sentinel
	expect_true(TRUE)
})#UNFOLD
test_that('plot stuff',{# FOLDUP
	utils::data("cocktails", package="cocktailApp")
	indat <- cocktails
	both <- .gen_both(indat)
	both_alt <- .gen_both()

	both2 <- .filter_ingredients(both,name_regex='sazerac',must_have_ing=c('Bourbon','Averna'),
															 must_not_have_ing=c(),
															 logical_sense='OR')

	two_ing <- c('Bourbon','Averna')
	both3 <- .filter_num_ingredients(both2,must_have_ing=two_ing,min_rating=2,max_ingr=10,max_other_ingr=5)
	ptern <- .prepare_ternary(both3,two_ing=two_ing)
	.make_tern_plot(ptern,two_ing)

	both4 <- .filter_tstat(both3,min_t=2,t_zero=1)
	both5 <- .filter_src(both4,from_sources=c('diffordsguide'))
	both6 <- .add_description(both5)

	merged <- .merge_both(both6)
	ph <- .make_bar_plot(merged)

	# sentinel
	expect_true(TRUE)
})# UNFOLD
test_that('correlation and coingredient',{
	utils::data("cocktails", package="cocktailApp")
	indat <- cocktails

	recipe_df <- .add_id(indat)

	rhov1 <- .coingredients(recipe_df)
	rhov2 <- .ingredient_rho(recipe_df)
	# sentinel
	expect_true(TRUE)
})
test_that("call the app?",{#FOLDUP
	# travis only?
	#skip_on_cran()
	blah <- cocktailApp()

	# sentinel
	expect_true(TRUE)
})#UNFOLD
# 2FIX: check the effects of NA
#UNFOLD


#for vim modeline: (do not edit)
# vim:ts=2:sw=2:tw=79:fdm=marker:fmr=FOLDUP,UNFOLD:cms=#%s:syn=r:ft=r:ai:si:cin:nu:fo=croql:cino=p0t0c5(0:
