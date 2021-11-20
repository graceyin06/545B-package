
#' Make histogram plots
#'
#' This function make the histogram plots for a certain variable in different groups/levels seperately.
#'
#' @param data  The dataset
#' @param group  The group variable
#' @param variable  The variable for histograms
#' @param x_label  The x label for the plots.
#' @return several histogram plots
#' @details The function was made by combining "group_by", "mutate", and "ggplot" functions
#' @examples
#' require(dplyr)
#' require(magrittr)
#' require(tidyverse)
#' require(datateachr)
#' require(gapminder)
#' require(glue)
#' histogram_plot(cancer_sample,diagnosis,radius_mean,"radius_mean")
#' histogram_plot(gapminder,continent,lifeExp,"lifeExp")
#'
#' @export
#'
histogram_plot<-function(data, group,variable, x_label){
  data_plot<-data %>%
    dplyr:: group_by({{group}}) %>%
    tidyr:: nest() %>%
    dplyr:: mutate(plot = purrr:: map2(data,{{group}}, ~ ggplot(data = .x, aes(x = {{variable}})) +geom_histogram(alpha=0.5,bins=30)+
                         labs(x = x_label,
                              y = 'count') +
                         ggtitle(glue::glue("Histogram plots for ", {x_label}, " in Group ", {.y}))))
  data_plot$plot}

